import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/categorias/componentes/card_premium_categoria/card_premium_categoria_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_ctegoria_model.dart';
export 'sub_ctegoria_model.dart';

class SubCtegoriaWidget extends StatefulWidget {
  const SubCtegoriaWidget({
    super.key,
    required this.subCategoria,
  });

  final DocumentReference? subCategoria;

  @override
  State<SubCtegoriaWidget> createState() => _SubCtegoriaWidgetState();
}

class _SubCtegoriaWidgetState extends State<SubCtegoriaWidget> {
  late SubCtegoriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCtegoriaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SubCtegoria'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CategoriasRecord>(
      stream: CategoriasRecord.getDocument(widget.subCategoria!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final subCtegoriaCategoriasRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<AnuncianteRecord>>(
                stream: queryAnuncianteRecord(
                  queryBuilder: (anuncianteRecord) => anuncianteRecord.where(
                    'Categoria',
                    isEqualTo: subCtegoriaCategoriasRecord.nomeDaCategoria,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF622AE2),
                          ),
                        ),
                      ),
                    );
                  }
                  List<AnuncianteRecord> containerAnuncianteRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: StreamBuilder<List<AnunciosRecord>>(
                      stream: queryAnunciosRecord(
                        queryBuilder: (anunciosRecord) => anunciosRecord
                            .where(
                              'Categoria',
                              isEqualTo:
                                  subCtegoriaCategoriasRecord.nomeDaCategoria,
                            )
                            .where(
                              'Anunciado',
                              isEqualTo: true,
                            ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF622AE2),
                                ),
                              ),
                            ),
                          );
                        }
                        List<AnunciosRecord> containerPaiAnunciosRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final medestacaCapa =
                                                    containerPaiAnunciosRecordList
                                                        .where((e) =>
                                                            ((e.planoDoAnuncio ==
                                                                    'medestacaCapa') ||
                                                                (e.planoDoAnuncio ==
                                                                    'meimpulsionaPlus')) &&
                                                            (e.anunciado ==
                                                                true))
                                                        .toList()
                                                        .take(5)
                                                        .toList();
                                                return Container(
                                                  width: double.infinity,
                                                  height: 500.0,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    30.0),
                                                        child: PageView.builder(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          valueOrDefault<int>(
                                                                            random_data.randomInteger(0,
                                                                                10),
                                                                            0,
                                                                          ),
                                                                          medestacaCapa.length - 1))),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              medestacaCapa
                                                                  .length,
                                                          itemBuilder: (context,
                                                              medestacaCapaIndex) {
                                                            final medestacaCapaItem =
                                                                medestacaCapa[
                                                                    medestacaCapaIndex];
                                                            return Stack(
                                                              children: [
                                                                Hero(
                                                                  tag:
                                                                      'italyImage',
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        CardPremiumCategoriaWidget(
                                                                      key: Key(
                                                                          'Keyhy7_${medestacaCapaIndex}_of_${medestacaCapa.length}'),
                                                                      fotoDestaquePremium:
                                                                          medestacaCapaItem
                                                                              .fotoAnuncio,
                                                                      discricao:
                                                                          medestacaCapaItem
                                                                              .descricao,
                                                                      tituloPaginaCategoria:
                                                                          subCtegoriaCategoriasRecord
                                                                              .nomeDaCategoria,
                                                                      auncianteREF:
                                                                          medestacaCapaItem
                                                                              .parentReference,
                                                                      nomeFantasia: containerAnuncianteRecordList
                                                                          .where((e) =>
                                                                              e.reference ==
                                                                              medestacaCapaItem.parentReference)
                                                                          .toList()
                                                                          .first
                                                                          .nomeFantasia,
                                                                      nextPage:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: smooth_page_indicator
                                                              .SmoothPageIndicator(
                                                            controller: _model
                                                                    .pageViewController ??=
                                                                PageController(
                                                                    initialPage: max(
                                                                        0,
                                                                        min(
                                                                            valueOrDefault<int>(
                                                                              random_data.randomInteger(0, 10),
                                                                              0,
                                                                            ),
                                                                            medestacaCapa.length - 1))),
                                                            count: medestacaCapa
                                                                .length,
                                                            axisDirection:
                                                                Axis.horizontal,
                                                            onDotClicked:
                                                                (i) async {
                                                              await _model
                                                                  .pageViewController!
                                                                  .animateToPage(
                                                                i,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            effect:
                                                                smooth_page_indicator
                                                                    .SlideEffect(
                                                              spacing: 8.0,
                                                              radius: 16.0,
                                                              dotWidth: 8.0,
                                                              dotHeight: 8.0,
                                                              dotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              activeDotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              paintStyle:
                                                                  PaintingStyle
                                                                      .fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            if (containerPaiAnunciosRecordList
                                                    .where((e) =>
                                                        (e.planoDoAnuncio ==
                                                            'medestacaCapa') ||
                                                        (e.planoDoAnuncio ==
                                                            'Turbo') ||
                                                        (e.planoDoAnuncio ==
                                                            'Master'))
                                                    .toList()
                                                    .length <
                                                1)
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Imagem_do_WhatsApp_de_2023-10-16_(s)_23.52.01_f44041c5.jpg',
                                                  width: double.infinity,
                                                  height: 470.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsets.all(6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.arrow_back_ios_new,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'SUB_CTEGORIA_arrow_back_ios_new_ICN_ON_T');

                                                      context.pushNamed(
                                                          'Categorias');
                                                    },
                                                  ),
                                                  Text(
                                                    subCtegoriaCategoriasRecord
                                                        .nomeDaCategoria,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 1200.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 1020.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Categorias',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: StreamBuilder<
                                                        List<
                                                            SubCategoriasRecord>>(
                                                      stream:
                                                          querySubCategoriasRecord(
                                                        queryBuilder:
                                                            (subCategoriasRecord) =>
                                                                subCategoriasRecord
                                                                    .where(
                                                          'NomeCategoriaPai',
                                                          isEqualTo:
                                                              subCtegoriaCategoriasRecord
                                                                  .nomeDaCategoria,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Color(
                                                                      0xFF622AE2),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<SubCategoriasRecord>
                                                            gridViewSubCategoriasRecordList =
                                                            snapshot.data!;
                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 4,
                                                            crossAxisSpacing:
                                                                8.0,
                                                            mainAxisSpacing:
                                                                8.0,
                                                            childAspectRatio:
                                                                0.25,
                                                          ),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              gridViewSubCategoriasRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              gridViewIndex) {
                                                            final gridViewSubCategoriasRecord =
                                                                gridViewSubCategoriasRecordList[
                                                                    gridViewIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SUB_CTEGORIA_PAGE_Row_umzn9plf_ON_TAP');

                                                                    context
                                                                        .pushNamed(
                                                                      'Resultado',
                                                                      queryParameters:
                                                                          {
                                                                        'subCategoriasResultRef':
                                                                            serializeParam(
                                                                          gridViewSubCategoriasRecord
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.rightToLeft,
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                8.0,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                random_data.randomColor(),
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(8.0),
                                                                                bottomRight: Radius.circular(2.0),
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(2.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            gridViewSubCategoriasRecord.nomeSubCategoria.maybeHandleOverflow(
                                                                              maxChars: 25,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Total',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    (valueOrDefault<int>(
                                                                                              containerAnuncianteRecordList.where((e) => e.nomeSubCategoria01 == gridViewSubCategoriasRecord.nomeSubCategoria).toList().length,
                                                                                              0,
                                                                                            ) +
                                                                                            valueOrDefault<int>(
                                                                                              containerAnuncianteRecordList.where((e) => e.nomeSubCategoria02 == gridViewSubCategoriasRecord.nomeSubCategoria).toList().length,
                                                                                              0,
                                                                                            ))
                                                                                        .toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (containerPaiAnunciosRecordList
                                                              .where((e) =>
                                                                  e.anunciado ==
                                                                  true)
                                                              .toList()
                                                              .length >=
                                                          1)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Destaques',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final grid = containerPaiAnunciosRecordList
                                                                .where((e) =>
                                                                    e.planoDoAnuncio !=
                                                                    'meencontra')
                                                                .toList();
                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 2;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 3;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 4;
                                                                  } else {
                                                                    return 4;
                                                                  }
                                                                }(),
                                                                crossAxisSpacing:
                                                                    12.0,
                                                                mainAxisSpacing:
                                                                    12.0,
                                                                childAspectRatio:
                                                                    1.0,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  grid.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      gridIndex) {
                                                                final gridItem =
                                                                    grid[
                                                                        gridIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SUB_CTEGORIA_Container_2m2wj667_ON_TAP');

                                                                    context
                                                                        .pushNamed(
                                                                      'AnunciantePage',
                                                                      queryParameters:
                                                                          {
                                                                        'documentoRefAnunciante':
                                                                            serializeParam(
                                                                          containerAnuncianteRecordList
                                                                              .where((e) => e.reference == gridItem.parentReference)
                                                                              .toList()
                                                                              .first,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'documentoRefAnunciante': containerAnuncianteRecordList
                                                                            .where((e) =>
                                                                                e.reference ==
                                                                                gridItem.parentReference)
                                                                            .toList()
                                                                            .first,
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.8,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x230E151B),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              2.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      containerAnuncianteRecordList.where((e) => e.reference == gridItem.parentReference).toList().first.logo,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Flexible(
                                                                                    child: Text(
                                                                                      containerAnuncianteRecordList.where((e) => e.reference == gridItem.parentReference).toList().first.nomeFantasia,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: Duration(milliseconds: 500),
                                                                                fadeOutDuration: Duration(milliseconds: 500),
                                                                                imageUrl: gridItem.fotoAnuncio,
                                                                                width: double.infinity,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 12.0))
                                                        .around(SizedBox(
                                                            height: 12.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Encontre também',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final gridGratis =
                                                                containerPaiAnunciosRecordList
                                                                    .where((e) =>
                                                                        e.planoDoAnuncio ==
                                                                        'meencontra')
                                                                    .toList();
                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    valueOrDefault<
                                                                        int>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 4;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 6;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 8;
                                                                    } else {
                                                                      return 4;
                                                                    }
                                                                  }(),
                                                                  4,
                                                                ),
                                                                crossAxisSpacing:
                                                                    12.0,
                                                                mainAxisSpacing:
                                                                    12.0,
                                                                childAspectRatio:
                                                                    1.0,
                                                              ),
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  gridGratis
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  gridGratisIndex) {
                                                                final gridGratisItem =
                                                                    gridGratis[
                                                                        gridGratisIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SUB_CTEGORIA_Container_1e6zr9yx_ON_TAP');
                                                                    _model.anuncinateGratisdoc =
                                                                        await queryAnuncianteRecordOnce(
                                                                      queryBuilder:
                                                                          (anuncianteRecord) =>
                                                                              anuncianteRecord.where(
                                                                        'aid',
                                                                        isEqualTo: gridGratisItem
                                                                            .anuncianteRef
                                                                            ?.id,
                                                                      ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);

                                                                    context
                                                                        .pushNamed(
                                                                      'AnunciantePage',
                                                                      queryParameters:
                                                                          {
                                                                        'documentoRefAnunciante':
                                                                            serializeParam(
                                                                          _model
                                                                              .anuncinateGratisdoc,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'documentoRefAnunciante':
                                                                            _model.anuncinateGratisdoc,
                                                                      },
                                                                    );

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        0.8,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x230E151B),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              2.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              gridGratisItem.fotoAnuncio,
                                                                          width:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
