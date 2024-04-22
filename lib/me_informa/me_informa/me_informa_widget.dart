import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_informa/componentes/card_right_meinforma/card_right_meinforma_widget.dart';
import '/me_informa/componentes/meinforma_card_lista/meinforma_card_lista_widget.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'me_informa_model.dart';
export 'me_informa_model.dart';

class MeInformaWidget extends StatefulWidget {
  const MeInformaWidget({super.key});

  @override
  State<MeInformaWidget> createState() => _MeInformaWidgetState();
}

class _MeInformaWidgetState extends State<MeInformaWidget>
    with TickerProviderStateMixin {
  late MeInformaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeInformaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'meInforma'});
    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.01, 1.0),
            end: Offset(1.01, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MateriasRecord>>(
      stream: queryMateriasRecord(
        queryBuilder: (materiasRecord) =>
            materiasRecord.orderBy('DataPublicacaoMateria', descending: true),
        limit: 100,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEFF1F3),
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF622AE2),
                  ),
                ),
              ),
            ),
          );
        }
        List<MateriasRecord> meInformaMateriasRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFEFF1F3),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                logFirebaseEvent('ME_INFORMA_FloatingActionButton_psec0m5u');
                await _model.appBar?.animateTo(
                  0,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.ease,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              elevation: 6.0,
              child: Icon(
                Icons.arrow_upward_rounded,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 34.0,
              ),
            ),
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  backgroundColor: MediaQuery.sizeOf(context).width >= 493.0
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).alternate,
                  automaticallyImplyLeading: false,
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        desktop: false,
                      ))
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.appbarGrupoMeModel,
                              updateCallback: () => setState(() {}),
                              child: AppbarGrupoMeWidget(
                                viewLeft: 'default',
                                viewRight: 'default',
                                title: 'informa',
                                tabbar: 'meinforma',
                                corText:
                                    FlutterFlowTheme.of(context).secondaryText,
                                perfil: valueOrDefault(
                                    currentUserDocument?.perfil, ''),
                                iconLeft: () async {},
                                iconRight: () async {},
                              ),
                            ),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tabletLandscape: false,
                      ))
                        Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.feedMenuHorizontModel,
                            updateCallback: () => setState(() {}),
                            child: FeedMenuHorizontWidget(
                              paginaAtual: 'meinforma',
                              drawerAcao: () async {},
                            ),
                          ),
                        ),
                    ],
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 2.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        controller: _model.appBar,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              desktop: false,
                            ))
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      tablet: false,
                                      desktop: false,
                                    ))
                                      Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final listmobile =
                                                        meInformaMateriasRecordList
                                                            .where((e) =>
                                                                e.materiaDestaque ==
                                                                true)
                                                            .toList()
                                                            .take(5)
                                                            .toList();
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 307.0,
                                                      child: CarouselSlider
                                                          .builder(
                                                        itemCount:
                                                            listmobile.length,
                                                        itemBuilder: (context,
                                                            listmobileIndex,
                                                            _) {
                                                          final listmobileItem =
                                                              listmobile[
                                                                  listmobileIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ME_INFORMA_PAGE_Stack_u8v0rubl_ON_TAP');
                                                              if (loggedIn ==
                                                                  true) {
                                                                context
                                                                    .pushNamed(
                                                                  'meinformaDetalhesNoticia',
                                                                  queryParameters:
                                                                      {
                                                                    'materiadoc':
                                                                        serializeParam(
                                                                      listmobileItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'materiadoc':
                                                                        listmobileItem,
                                                                  },
                                                                );
                                                              } else {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              UsarDeslogadoUsoExclusivoCompWidget(
                                                                            usoExclusivo:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            },
                                                            child: Stack(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
                                                                    listmobileItem
                                                                        .imagemCapa,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        300.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0x1A000000),
                                                                        Color(
                                                                            0x66000000)
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          32.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        listmobileItem
                                                                            .categoria,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        listmobileItem
                                                                            .tituloMateria,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'relative',
                                                                          listmobileItem
                                                                              .dataPublicacaoMateria!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        carouselController: _model
                                                                .carouselController ??=
                                                            CarouselController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: min(
                                                              1,
                                                              listmobile
                                                                      .length -
                                                                  1),
                                                          viewportFraction: 1.0,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              true,
                                                          enlargeFactor: 0.25,
                                                          enableInfiniteScroll:
                                                              true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay:
                                                              valueOrDefault<
                                                                  bool>(
                                                            meInformaMateriasRecordList
                                                                    .length >
                                                                1,
                                                            false,
                                                          ),
                                                          autoPlayAnimationDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      800),
                                                          autoPlayInterval:
                                                              Duration(
                                                                  milliseconds:
                                                                      (800 +
                                                                          6000)),
                                                          autoPlayCurve:
                                                              Curves.linear,
                                                          pauseAutoPlayInFiniteScroll:
                                                              true,
                                                          onPageChanged: (index,
                                                                  _) =>
                                                              _model.carouselCurrentIndex =
                                                                  index,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            if (FFAppState().EsconderDaTela ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 32.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ECONOMIA',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Menos eleitores de Lula esperam alta na economia, diz Datafolha...',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Há 2 horas',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      tablet: false,
                                      desktop: false,
                                    ))
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >=
                                                            720.0
                                                        ? 124.0
                                                        : 0.0,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                                .width >=
                                                            720.0
                                                        ? 124.0
                                                        : 0.0,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 8.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                        'EEEE',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  controller:
                                                      _model.rowController,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child:
                                                            FlutterFlowChoiceChips(
                                                          options: [
                                                            ChipData('Últimas'),
                                                            ChipData('Saúde'),
                                                            ChipData(
                                                                'Politica'),
                                                            ChipData('Tempo'),
                                                            ChipData('Esporte'),
                                                            ChipData(
                                                                'Segurança'),
                                                            ChipData(
                                                                'Transporte'),
                                                            ChipData(
                                                                'Meio ambiente'),
                                                            ChipData(
                                                                'Internacional'),
                                                            ChipData(
                                                                'Arte/Cultura'),
                                                            ChipData(
                                                                'Educação'),
                                                            ChipData(
                                                                'Comunidade'),
                                                            ChipData('Eventos'),
                                                            ChipData('Cidades')
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() => _model
                                                                      .choiceChipsValue =
                                                                  val?.firstOrNull),
                                                          selectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            iconSize: 18.0,
                                                            elevation: 2.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          unselectedChipStyle:
                                                              ChipStyle(
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            iconSize: 18.0,
                                                            elevation: 1.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          chipSpacing: 8.0,
                                                          rowSpacing: 12.0,
                                                          multiselect: false,
                                                          initialized: _model
                                                                  .choiceChipsValue !=
                                                              null,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          controller: _model
                                                                  .choiceChipsValueController ??=
                                                              FormFieldController<
                                                                  List<String>>(
                                                            ['Últimas'],
                                                          ),
                                                          wrapped: true,
                                                        ),
                                                      ),
                                                    ]
                                                        .addToStart(SizedBox(
                                                            width: 16.0))
                                                        .addToEnd(SizedBox(
                                                            width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (_model.choiceChipsValue ==
                                                      'Últimas') {
                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final materias =
                                                              meInformaMateriasRecordList
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                    materias
                                                                        .length,
                                                                    (materiasIndex) {
                                                              final materiasItem =
                                                                  materias[
                                                                      materiasIndex];
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
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
                                                                        'ME_INFORMA_Container_dilwvyby_ON_TAP');
                                                                    if (loggedIn ==
                                                                        true) {
                                                                      context
                                                                          .pushNamed(
                                                                        'meinformaDetalhesNoticia',
                                                                        queryParameters:
                                                                            {
                                                                          'materiadoc':
                                                                              serializeParam(
                                                                            materiasItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'materiadoc':
                                                                              materiasItem,
                                                                        },
                                                                      );
                                                                    } else {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                  usoExclusivo: true,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  },
                                                                  child:
                                                                      MeinformaCardListaWidget(
                                                                    key: Key(
                                                                        'Keydil_${materiasIndex}_of_${materias.length}'),
                                                                    parameter1:
                                                                        materiasItem
                                                                            .imagemCapa,
                                                                    parameter2:
                                                                        materiasItem
                                                                            .categoria,
                                                                    parameter3:
                                                                        materiasItem
                                                                            .tituloMateria,
                                                                    publicado:
                                                                        materiasItem
                                                                            .dataPublicacaoMateria!,
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                                .divide(SizedBox(
                                                                    height:
                                                                        12.0))
                                                                .around(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  } else if (meInformaMateriasRecordList
                                                          .where((e) =>
                                                              e.categoria ==
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .choiceChipsValue,
                                                                'todos',
                                                              ))
                                                          .toList()
                                                          .length <
                                                      1) {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    60.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Nenhuma matéria foi publicada com esse tema',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Builder(
                                                      builder: (context) {
                                                        final materias =
                                                            meInformaMateriasRecordList
                                                                .where((e) =>
                                                                    e
                                                                        .categoria ==
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .choiceChipsValue,
                                                                      'todos',
                                                                    ))
                                                                .toList();
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  materias
                                                                      .length,
                                                                  (materiasIndex) {
                                                            final materiasItem =
                                                                materias[
                                                                    materiasIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ME_INFORMA_Container_66hud8d5_ON_TAP');

                                                                context
                                                                    .pushNamed(
                                                                  'meinformaDetalhesNoticia',
                                                                  queryParameters:
                                                                      {
                                                                    'materiadoc':
                                                                        serializeParam(
                                                                      materiasItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'materiadoc':
                                                                        materiasItem,
                                                                  },
                                                                );
                                                              },
                                                              child:
                                                                  MeinformaCardListaWidget(
                                                                key: Key(
                                                                    'Key66h_${materiasIndex}_of_${materias.length}'),
                                                                parameter1:
                                                                    materiasItem
                                                                        .imagemCapa,
                                                                parameter2:
                                                                    materiasItem
                                                                        .categoria,
                                                                parameter3:
                                                                    materiasItem
                                                                        .tituloMateria,
                                                                publicado:
                                                                    materiasItem
                                                                        .dataPublicacaoMateria!,
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  height: 12.0))
                                                              .around(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tabletLandscape: false,
                            ))
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tabletLandscape: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 50.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'me',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      fontSize:
                                                                          42.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'informa ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          42.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          FFIcons
                                                              .kvectorTvgoCorreto,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 48.0,
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tabletLandscape: false,
                                              ))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                124.0,
                                                                0.0,
                                                                124.0,
                                                                0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 500.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final gridDesktop2 =
                                                              meInformaMateriasRecordList
                                                                  .where((e) =>
                                                                      e.materiaDestaque ==
                                                                      true)
                                                                  .toList()
                                                                  .take(3)
                                                                  .toList();
                                                          return MasonryGridView
                                                              .builder(
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            gridDelegate:
                                                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                            ),
                                                            crossAxisSpacing:
                                                                12.0,
                                                            mainAxisSpacing:
                                                                12.0,
                                                            itemCount:
                                                                gridDesktop2
                                                                    .length,
                                                            shrinkWrap: true,
                                                            itemBuilder: (context,
                                                                gridDesktop2Index) {
                                                              final gridDesktop2Item =
                                                                  gridDesktop2[
                                                                      gridDesktop2Index];
                                                              return InkWell(
                                                                splashColor: Colors
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
                                                                      'ME_INFORMA_PAGE_Stack_hdetrym9_ON_TAP');
                                                                  if (loggedIn ==
                                                                      true) {
                                                                    context
                                                                        .pushNamed(
                                                                      'meinformaDetalhesNoticia',
                                                                      queryParameters:
                                                                          {
                                                                        'materiadoc':
                                                                            serializeParam(
                                                                          gridDesktop2Item,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'materiadoc':
                                                                            gridDesktop2Item,
                                                                      },
                                                                    );
                                                                  } else {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                usoExclusivo: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                child: Stack(
                                                                  children: [
                                                                    Hero(
                                                                      tag: gridDesktop2Item
                                                                          .imagemCapa,
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          gridDesktop2Item
                                                                              .imagemCapa,
                                                                          width:
                                                                              double.infinity,
                                                                          height: gridDesktop2Index == 0
                                                                              ? 500.0
                                                                              : 250.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'imageOnActionTriggerAnimation']!,
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: gridDesktop2Index ==
                                                                              0
                                                                          ? 500.0
                                                                          : 250.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0x1A000000),
                                                                            Color(0x66000000)
                                                                          ],
                                                                          stops: [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: gridDesktop2Index ==
                                                                              0
                                                                          ? 500.0
                                                                          : 250.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            24.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              gridDesktop2Item.categoria,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              gridDesktop2Item.tituloMateria,
                                                                              style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontSize: gridDesktop2Index == 0 ? 32.0 : 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              dateTimeFormat(
                                                                                'relative',
                                                                                gridDesktop2Item.dataPublicacaoMateria!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            controller: _model
                                                                .staggeredViewController,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 32.0)),
                                          ),
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tabletLandscape: false,
                                    ))
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  124.0, 0.0, 124.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final materias =
                                                          meInformaMateriasRecordList
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                                materias.length,
                                                                (materiasIndex) {
                                                          final materiasItem =
                                                              materias[
                                                                  materiasIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ME_INFORMA_Container_2tu68me6_ON_TAP');
                                                              if (loggedIn ==
                                                                  true) {
                                                                context
                                                                    .pushNamed(
                                                                  'meinformaDetalhesNoticia',
                                                                  queryParameters:
                                                                      {
                                                                    'materiadoc':
                                                                        serializeParam(
                                                                      materiasItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'materiadoc':
                                                                        materiasItem,
                                                                  },
                                                                );
                                                              } else {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              UsarDeslogadoUsoExclusivoCompWidget(
                                                                            usoExclusivo:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              }
                                                            },
                                                            child:
                                                                MeinformaCardListaWidget(
                                                              key: Key(
                                                                  'Key2tu_${materiasIndex}_of_${materias.length}'),
                                                              parameter1:
                                                                  materiasItem
                                                                      .imagemCapa,
                                                              parameter2:
                                                                  materiasItem
                                                                      .categoria,
                                                              parameter3:
                                                                  materiasItem
                                                                      .tituloMateria,
                                                              publicado:
                                                                  materiasItem
                                                                      .dataPublicacaoMateria!,
                                                            ),
                                                          );
                                                        })
                                                            .divide(SizedBox(
                                                                height: 12.0))
                                                            .around(SizedBox(
                                                                height: 12.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 360.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0.8,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .moving_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              32.0,
                                                                        ),
                                                                        Text(
                                                                          'Mais lidas',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineSmall
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final maisLidas = meInformaMateriasRecordList
                                                                          .where((e) =>
                                                                              e.materiaDestaque ==
                                                                              true)
                                                                          .toList()
                                                                          .take(
                                                                              10)
                                                                          .toList();
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            maisLidas.length,
                                                                            (maisLidasIndex) {
                                                                          final maisLidasItem =
                                                                              maisLidas[maisLidasIndex];
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('ME_INFORMA_PAGE_Row_0up9443v_ON_TAP');
                                                                                  if (loggedIn == true) {
                                                                                    context.pushNamed(
                                                                                      'meinformaDetalhesNoticia',
                                                                                      queryParameters: {
                                                                                        'materiadoc': serializeParam(
                                                                                          maisLidasItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'materiadoc': maisLidasItem,
                                                                                      },
                                                                                    );
                                                                                  } else {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return WebViewAware(
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                                usoExclusivo: false,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      formatNumber(
                                                                                        maisLidasIndex + 1,
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.commaDecimal,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).accent2,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        maisLidasItem.tituloMateria,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Divider(
                                                                                thickness: 0.8,
                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          16.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .cardRightMeinformaModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              CardRightMeinformaWidget(
                                                            parameter1: meInformaMateriasRecordList
                                                                .where((e) =>
                                                                    e.categoria ==
                                                                    'Comunidade')
                                                                .toList(),
                                                            tituloCategoria:
                                                                'Comunidade',
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .cardRightMeinformaModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              CardRightMeinformaWidget(
                                                            parameter1: meInformaMateriasRecordList
                                                                .where((e) =>
                                                                    e.categoria ==
                                                                    'Politica')
                                                                .toList(),
                                                            tituloCategoria:
                                                                'Politica',
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .cardRightMeinformaModel3,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              CardRightMeinformaWidget(
                                                            parameter1:
                                                                meInformaMateriasRecordList
                                                                    .where((e) =>
                                                                        e.categoria ==
                                                                        'Saúde')
                                                                    .toList(),
                                                            tituloCategoria:
                                                                'Saúde',
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 50.0)),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
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
