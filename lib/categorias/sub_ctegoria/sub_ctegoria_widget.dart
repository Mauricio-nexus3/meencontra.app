import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/backend/backend.dart';
import '/categorias/componentes/card_big_sub_categoria/card_big_sub_categoria_widget.dart';
import '/categorias/componentes/card_premium_categoria/card_premium_categoria_widget.dart';
import '/categorias/componentes/card_small_sub_categoria/card_small_sub_categoria_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CategoriasRecord>(
      future: CategoriasRecord.getDocumentOnce(widget!.subCategoria!),
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

        return Title(
            title: 'SubCtegoria',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: FutureBuilder<List<AnuncianteRecord>>(
                  future: queryAnuncianteRecordOnce(
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
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<AnunciosRecord>>(
                        future: queryAnunciosRecordOnce(
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
                                                              safeSetState(
                                                                  () {});
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
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      6.0, 50.0, 6.0, 6.0),
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
                                                    fillColor:
                                                        Color(0x26FFFFFF),
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
                                  FutureBuilder<List<SubCategoriasRecord>>(
                                    future: querySubCategoriasRecordOnce(
                                      queryBuilder: (subCategoriasRecord) =>
                                          subCategoriasRecord.where(
                                        'NomeCategoriaPai',
                                        isEqualTo: subCtegoriaCategoriasRecord
                                                    .nomeDaCategoria !=
                                                ''
                                            ? subCtegoriaCategoriasRecord
                                                .nomeDaCategoria
                                            : null,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF622AE2),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<SubCategoriasRecord>
                                          conteudoSubCategoriasRecordList =
                                          snapshot.data!;

                                      return Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 1200.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants
                                                        .paddingMobile,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
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
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Categorias',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 250.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final conteudoVar =
                                                                conteudoSubCategoriasRecordList
                                                                    .toList();

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    4,
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
                                                                  conteudoVar
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  conteudoVarIndex) {
                                                                final conteudoVarItem =
                                                                    conteudoVar[
                                                                        conteudoVarIndex];
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
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
                                                                            'total':
                                                                                serializeParam(
                                                                              valueOrDefault<double>(
                                                                                (valueOrDefault<int>(
                                                                                          containerAnuncianteRecordList.where((e) => e.nomeSubCategoria01 == conteudoVarItem.nomeSubCategoria).toList().length,
                                                                                          0,
                                                                                        ) +
                                                                                        valueOrDefault<int>(
                                                                                          containerAnuncianteRecordList.where((e) => e.nomeSubCategoria02 == conteudoVarItem.nomeSubCategoria).toList().length,
                                                                                          0,
                                                                                        ))
                                                                                    .toDouble(),
                                                                                0.0,
                                                                              ),
                                                                              ParamType.double,
                                                                            ),
                                                                            'subCategoria':
                                                                                serializeParam(
                                                                              conteudoVarItem.nomeSubCategoria,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                            ),
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 8.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
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
                                                                                conteudoVarItem.nomeSubCategoria.maybeHandleOverflow(
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
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
                                                                                                  containerAnuncianteRecordList.where((e) => e.nomeSubCategoria01 == conteudoVarItem.nomeSubCategoria).toList().length,
                                                                                                  0,
                                                                                                ) +
                                                                                                valueOrDefault<int>(
                                                                                                  containerAnuncianteRecordList.where((e) => e.nomeSubCategoria02 == conteudoVarItem.nomeSubCategoria).toList().length,
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
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              conteudoSubCategoriasRecordList
                                                                  .first
                                                                  .nomeSubCategoria,
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 270.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final cardBig01 =
                                                                    containerAnuncianteRecordList
                                                                        .sortedList(
                                                                            keyOf: (e) =>
                                                                                random_data
                                                                                    .randomString(
                                                                                  3,
                                                                                  10,
                                                                                  true,
                                                                                  false,
                                                                                  false,
                                                                                ),
                                                                            desc:
                                                                                true)
                                                                        .where((e) =>
                                                                            (e.nomeSubCategoria01 == conteudoSubCategoriasRecordList.first.nomeSubCategoria) &&
                                                                            (e.logo !=
                                                                                ''))
                                                                        .toList()
                                                                        .take(5)
                                                                        .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        cardBig01
                                                                            .length,
                                                                        (cardBig01Index) {
                                                                      final cardBig01Item =
                                                                          cardBig01[
                                                                              cardBig01Index];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_hphg9yu2_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  cardBig01Item.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              CardBigSubCategoriaWidget(
                                                                            key:
                                                                                Key('Keyhph_${cardBig01Index}_of_${cardBig01.length}'),
                                                                            imagem:
                                                                                valueOrDefault<String>(
                                                                              cardBig01Item.logo,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                            ),
                                                                            nome:
                                                                                cardBig01Item.nomeFantasia,
                                                                            endereco:
                                                                                cardBig01Item.nomeSubCategoria01,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Famosos no meencontra',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 16.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 26.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 26.0;
                                                                    } else {
                                                                      return 16.0;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final famosos = containerAnuncianteRecordList
                                                                  .take(12)
                                                                  .toList()
                                                                  .sortedList(
                                                                      keyOf: (e) =>
                                                                          e.contaCriada!,
                                                                      desc: true)
                                                                  .toList()
                                                                  .take(12)
                                                                  .toList();

                                                              return SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: List
                                                                      .generate(
                                                                          famosos
                                                                              .length,
                                                                          (famososIndex) {
                                                                    final famososItem =
                                                                        famosos[
                                                                            famososIndex];
                                                                    return CircleCategorieWidget(
                                                                      key: Key(
                                                                          'Keyyy4_${famososIndex}_of_${famosos.length}'),
                                                                      img: valueOrDefault<
                                                                          String>(
                                                                        famososItem
                                                                            .logo,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                      ),
                                                                      name: famososItem
                                                                          .nomeFantasia,
                                                                      planoAssinatura:
                                                                          famososItem
                                                                              .planoAssinatura,
                                                                      resgatado:
                                                                          famososItem
                                                                              .resgatado,
                                                                    );
                                                                  }).divide(SizedBox(
                                                                      width: MediaQuery.sizeOf(context).width >
                                                                              1080.0
                                                                          ? 20.0
                                                                          : 4.0)),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Novidades',
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 220.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final cardSmal01 = containerAnuncianteRecordList
                                                                    .take(9)
                                                                    .toList()
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .contaCriada!,
                                                                        desc:
                                                                            false)
                                                                    .where((e) =>
                                                                        e.logo !=
                                                                        '')
                                                                    .toList()
                                                                    .take(9)
                                                                    .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        cardSmal01
                                                                            .length,
                                                                        (cardSmal01Index) {
                                                                      final cardSmal01Item =
                                                                          cardSmal01[
                                                                              cardSmal01Index];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_f8oyogzt_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  cardSmal01Item.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              CardSmallSubCategoriaWidget(
                                                                            key:
                                                                                Key('Keyf8o_${cardSmal01Index}_of_${cardSmal01.length}'),
                                                                            imagem:
                                                                                valueOrDefault<String>(
                                                                              cardSmal01Item.logo,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                            ),
                                                                            nome:
                                                                                cardSmal01Item.nomeFantasia,
                                                                            enderecoCompleto:
                                                                                cardSmal01Item.nomeSubCategoria01,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Mais vistos',
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 270.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final cardBig02 = containerAnuncianteRecordList
                                                                    .sortedList(
                                                                        keyOf: (e) => random_data.randomString(
                                                                              3,
                                                                              10,
                                                                              true,
                                                                              false,
                                                                              false,
                                                                            ),
                                                                        desc: true)
                                                                    .where((e) => e.logo != '')
                                                                    .toList()
                                                                    .take(5)
                                                                    .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        cardBig02
                                                                            .length,
                                                                        (cardBig02Index) {
                                                                      final cardBig02Item =
                                                                          cardBig02[
                                                                              cardBig02Index];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_r1t9j81j_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  cardBig02Item.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              CardBigSubCategoriaWidget(
                                                                            key:
                                                                                Key('Keyr1t_${cardBig02Index}_of_${cardBig02.length}'),
                                                                            imagem:
                                                                                valueOrDefault<String>(
                                                                              cardBig02Item.logo,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                            ),
                                                                            nome:
                                                                                cardBig02Item.nomeFantasia,
                                                                            endereco:
                                                                                cardBig02Item.nomeSubCategoria01,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              conteudoSubCategoriasRecordList[
                                                                      1]
                                                                  .nomeSubCategoria,
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final list02 = containerAnuncianteRecordList
                                                                    .sortedList(
                                                                        keyOf: (e) => random_data.randomString(
                                                                              3,
                                                                              10,
                                                                              true,
                                                                              false,
                                                                              false,
                                                                            ),
                                                                        desc: true)
                                                                    .where((e) => e.nomeSubCategoria01 == conteudoSubCategoriasRecordList[1].nomeSubCategoria)
                                                                    .toList()
                                                                    .take(5)
                                                                    .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        list02
                                                                            .length,
                                                                        (list02Index) {
                                                                      final list02Item =
                                                                          list02[
                                                                              list02Index];
                                                                      return CircleCategorieWidget(
                                                                        key: Key(
                                                                            'Key7pd_${list02Index}_of_${list02.length}'),
                                                                        img: valueOrDefault<
                                                                            String>(
                                                                          list02Item
                                                                              .logo,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                        ),
                                                                        name: list02Item
                                                                            .nomeFantasia,
                                                                        planoAssinatura:
                                                                            list02Item.planoAssinatura,
                                                                        resgatado:
                                                                            list02Item.resgatado,
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 220.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final cardSmal02 = containerAnuncianteRecordList
                                                                    .sortedList(
                                                                        keyOf: (e) => random_data.randomString(
                                                                              3,
                                                                              10,
                                                                              true,
                                                                              false,
                                                                              false,
                                                                            ),
                                                                        desc: true)
                                                                    .where((e) => e.logo != '')
                                                                    .toList()
                                                                    .take(9)
                                                                    .toList();

                                                                return SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        cardSmal02
                                                                            .length,
                                                                        (cardSmal02Index) {
                                                                      final cardSmal02Item =
                                                                          cardSmal02[
                                                                              cardSmal02Index];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_elfpl03y_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  cardSmal02Item.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              CardSmallSubCategoriaWidget(
                                                                            key:
                                                                                Key('Keyelf_${cardSmal02Index}_of_${cardSmal02.length}'),
                                                                            imagem:
                                                                                valueOrDefault<String>(
                                                                              cardSmal02Item.logo,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                            ),
                                                                            nome:
                                                                                cardSmal02Item.nomeFantasia,
                                                                            enderecoCompleto:
                                                                                cardSmal02Item.nomeSubCategoria01,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .whatshot_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Text(
                                                                      'Em alta',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                () {
                                                                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                return 16.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                return 26.0;
                                                                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                return 26.0;
                                                                              } else {
                                                                                return 16.0;
                                                                              }
                                                                            }(),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 2.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        120.0,
                                                                    height: 2.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final descobrir = containerAnuncianteRecordList
                                                                        .sortedList(
                                                                            keyOf: (e) => random_data.randomString(
                                                                                  3,
                                                                                  10,
                                                                                  true,
                                                                                  false,
                                                                                  false,
                                                                                ),
                                                                            desc: true)
                                                                        .where((e) => e.logo != '')
                                                                        .toList()
                                                                        .take(30)
                                                                        .toList();

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          descobrir
                                                                              .length,
                                                                          (descobrirIndex) {
                                                                        final descobrirItem =
                                                                            descobrir[descobrirIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_uf43w2sx_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  descobrirItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                0.8,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 52.0,
                                                                                      height: 52.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          descobrirItem.logo,
                                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                        ),
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              descobrirItem.nomeFantasia.maybeHandleOverflow(
                                                                                                maxChars: 26,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            SelosAnuncianteWidget(
                                                                                              key: Key('Keyikk_${descobrirIndex}_of_${descobrir.length}'),
                                                                                              planoAnunciante: descobrirItem.planoAssinatura,
                                                                                              tamanhoPequenoNormalGrande: 'Pequeno',
                                                                                              resgatado: descobrirItem.resgatado,
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              descobrirItem.nomeSubCategoria01,
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 4.0)),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(height: 16.0)).around(SizedBox(
                                                                          height:
                                                                              16.0)),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                            ))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 900.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final emAltadesktop = containerAnuncianteRecordList
                                                                        .sortedList(
                                                                            keyOf: (e) => random_data.randomString(
                                                                                  3,
                                                                                  10,
                                                                                  true,
                                                                                  false,
                                                                                  false,
                                                                                ),
                                                                            desc: true)
                                                                        .toList()
                                                                        .take(30)
                                                                        .toList();

                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            12.0,
                                                                        mainAxisSpacing:
                                                                            12.0,
                                                                        childAspectRatio:
                                                                            3.0,
                                                                      ),
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          emAltadesktop
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              emAltadesktopIndex) {
                                                                        final emAltadesktopItem =
                                                                            emAltadesktop[emAltadesktopIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('SUB_CTEGORIA_Container_ov7su8kd_ON_TAP');

                                                                            context.pushNamed(
                                                                              'AnunciantePerfil',
                                                                              queryParameters: {
                                                                                'referenciaAnunciante': serializeParam(
                                                                                  emAltadesktopItem.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                0.8,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 420.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        SelosAnuncianteWidget(
                                                                                          key: Key('Keyc7l_${emAltadesktopIndex}_of_${emAltadesktop.length}'),
                                                                                          planoAnunciante: emAltadesktopItem.planoAssinatura,
                                                                                          resgatado: emAltadesktopItem.resgatado,
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          child: Image.network(
                                                                                            emAltadesktopItem.logo,
                                                                                            width: 90.0,
                                                                                            height: 90.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      emAltadesktopItem.nomeFantasia.maybeHandleOverflow(
                                                                                                        maxChars: 30,
                                                                                                        replacement: '…',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 4.0)),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      emAltadesktopItem.nomeSubCategoria01,
                                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 4.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(height: 16.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 24.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ].addToEnd(SizedBox(height: 60.0)),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
