import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/categorias/componentes/card_small_sub_categoria/card_small_sub_categoria_widget.dart';
import '/componentes_globais/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/menus/menu_horizontal/menu_horizontal_widget.dart';
import '/components/atualizacao_disponivel_widget.dart';
import '/components/navbar_widget.dart';
import '/feed_home/feedcomp/card_essencial_copy/card_essencial_copy_widget.dart';
import '/feed_home/feedcomp/card_premium_feed/card_premium_feed_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/feed_home/feedcomp/feed_completo_divirta/feed_completo_divirta_widget.dart';
import '/feed_home/feedcomp/feed_completo_informa/feed_completo_informa_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Feed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_PAGE_Feed_ON_INIT_STATE');
      // Atualizacao
      _model.novaAtualizacao = await queryNotificacaoRecordOnce(
        queryBuilder: (notificacaoRecord) => notificacaoRecord
            .where(
              'data_criacao',
              isGreaterThan: FFAppState().ultimaNotificacaoAtualizacao,
            )
            .orderBy('data_criacao', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.novaAtualizacao!.dataCriacao! >
          FFAppState().ultimaNotificacaoAtualizacao!) {
        FFAppState().versaoAtualMobile = _model.novaAtualizacao!.versao;
        safeSetState(() {});
        if ((FFAppState().versaoAtualMobile !=
                FFAppState().versaoNoDispositivoUsuario) &&
            (MediaQuery.sizeOf(context).width <= kBreakpointLarge)) {
          await showAlignedDialog(
            context: context,
            isGlobal: false,
            avoidOverflow: false,
            targetAnchor: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            followerAnchor: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return Material(
                color: Colors.transparent,
                child: WebViewAware(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                    child: AtualizacaoDisponivelWidget(),
                  ),
                ),
              );
            },
          );

          return;
        } else {
          return;
        }
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => FutureBuilder<List<NotificacaoRecord>>(
        future: _model.novoFeed(
          requestFn: () => queryNotificacaoRecordOnce(
            queryBuilder: (notificacaoRecord) =>
                notificacaoRecord.orderBy('data_criacao', descending: true),
            limit: 10,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          List<NotificacaoRecord> feedNotificacaoRecordList = snapshot.data!;

          return Title(
              title: 'Feed',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: WillPopScope(
                  onWillPop: () async => false,
                  child: Scaffold(
                    key: scaffoldKey,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    floatingActionButton: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          logFirebaseEvent(
                              'FEED_FloatingActionButton_r0vkin9j_ON_TA');

                          context.pushNamed('TonyAssist');
                        },
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        elevation: 8.0,
                        child: Icon(
                          Icons.auto_awesome,
                          color: FlutterFlowTheme.of(context).white,
                          size: 24.0,
                        ),
                      ),
                    ),
                    drawer: Drawer(
                      elevation: 16.0,
                      child: WebViewAware(
                        child: wrapWithModel(
                          model: _model.menuDrawerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MenuDrawerWidget(
                            paginaAtual: TelasMenuDrawer.Inicio.name,
                          ),
                        ),
                      ),
                    ),
                    body: NestedScrollView(
                      floatHeaderSlivers: true,
                      headerSliverBuilder: (context, _) => [
                        SliverAppBar(
                          pinned: true,
                          floating: false,
                          backgroundColor: MediaQuery.sizeOf(context).width >=
                                  kBreakpointLarge
                              ? FlutterFlowTheme.of(context).secondaryBackground
                              : FlutterFlowTheme.of(context).primary,
                          automaticallyImplyLeading: false,
                          title: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                desktop: false,
                              ))
                                Container(
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'FEED_PAGE_Image_1bj83159_ON_TAP');

                                              context.pushNamed(
                                                'Feed',
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/novo_logo.svg',
                                              height: 24.0,
                                              fit: BoxFit.contain,
                                              alignment: Alignment(-1.0, 0.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 24.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x15FFFFFF),
                                            icon: Icon(
                                              FFIcons.klupa,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 24.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x15FFFFFF),
                                            icon: FaIcon(
                                              FontAwesomeIcons.bell,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'FEED_PAGE_bell_ICN_ON_TAP');

                                              context.pushNamed('notificacoes');
                                            },
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tabletLandscape: false,
                              ))
                                Container(
                                  width: double.infinity,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).lilas,
                                        FlutterFlowTheme.of(context).primary
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.0),
                                      end: AlignmentDirectional(-1.0, 0),
                                    ),
                                  ),
                                  child: wrapWithModel(
                                    model: _model.menuHorizontalModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuHorizontalWidget(
                                      paginaAtual: TelasMenuDrawer.Inicio.name,
                                      notificacao: feedNotificacaoRecordList,
                                      drawerAcao: () async {
                                        logFirebaseEvent(
                                            'FEED_PAGE_Container_ze7e8011_CALLBACK');
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      notificacaoAcao: () async {
                                        logFirebaseEvent(
                                            'FEED_PAGE_Container_ze7e8011_CALLBACK');

                                        context.pushNamed('notificacoes');
                                      },
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      FutureBuilder<List<CategoriasRecord>>(
                                        future: queryCategoriasRecordOnce(
                                          queryBuilder: (categoriasRecord) =>
                                              categoriasRecord
                                                  .orderBy('NomeDaCategoria'),
                                        ),
                                        builder: (context, snapshot) {
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
                                                    Color(0xFF622AE2),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CategoriasRecord>
                                              aplicativofeedCategoriasRecordList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: RefreshIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'FEED_Column_kkj19ekp_ON_PULL_TO_REFRESH');

                                                context.pushNamed('Feed');
                                              },
                                              child: SingleChildScrollView(
                                                physics:
                                                    const AlwaysScrollableScrollPhysics(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: OpenweatherGroup
                                                                  .longitudeLatitudeDiaCall
                                                                  .call(),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          Color(
                                                                              0xFF622AE2),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final containerLongitudeLatitudeDiaResponse =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                'http://openweathermap.org/img/wn/${OpenweatherGroup.longitudeLatitudeDiaCall.img(
                                                                                  containerLongitudeLatitudeDiaResponse.jsonBody,
                                                                                )}@2x.png',
                                                                                'https://openweathermap.org/img/wn/10d@2x.png',
                                                                              ),
                                                                              width: 76.0,
                                                                              height: 70.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Guaíba teste',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    OpenweatherGroup.longitudeLatitudeDiaCall.temperatura(
                                                                                      containerLongitudeLatitudeDiaResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: '0',
                                                                                    locale: '',
                                                                                  ),
                                                                                  '0',
                                                                                )}º',
                                                                                style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    OpenweatherGroup.longitudeLatitudeDiaCall.descricao(
                                                                                      containerLongitudeLatitudeDiaResponse.jsonBody,
                                                                                    ),
                                                                                    'Guaíba',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                      if (responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                        tabletLandscape:
                                                                            false,
                                                                        desktop:
                                                                            false,
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 170.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(12.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(12.0),
                                                                                  topRight: Radius.circular(0.0),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                              ),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final wee = FFAppState().fonteMeinforma.toList().take(7).toList();

                                                                                  return SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(wee.length, (weeIndex) {
                                                                                        final weeItem = wee[weeIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(12.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'seg',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '26 de ago',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 4.0)),
                                                                                                  ),
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      'https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png',
                                                                                                      width: 50.0,
                                                                                                      height: 50.0,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        '14º',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '6º',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 4.0)),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 1.0,
                                                                                              height: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      }).divide(SizedBox(width: 16.0)),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    FutureBuilder<
                                                        List<AnuncianteRecord>>(
                                                      future:
                                                          queryAnuncianteRecordOnce(
                                                        queryBuilder:
                                                            (anuncianteRecord) =>
                                                                anuncianteRecord.orderBy(
                                                                    'PlanoAssinatura',
                                                                    descending:
                                                                        true),
                                                        limit: 600,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: SizedBox(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AnuncianteRecord>
                                                            appAnuncianteRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 1020.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              // Lista de anúnciante
                                                              StreamBuilder<
                                                                  List<
                                                                      AnunciosRecord>>(
                                                            stream:
                                                                queryAnunciosRecord(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
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
                                                              List<AnunciosRecord>
                                                                  containerAnunciosRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= kBreakpointSmall
                                                                                ? 0.0
                                                                                : 124.0,
                                                                            0.0,
                                                                          ),
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= kBreakpointSmall
                                                                                ? 24.0
                                                                                : 48.0,
                                                                            24.0,
                                                                          ),
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= kBreakpointSmall
                                                                                ? 0.0
                                                                                : 124.0,
                                                                            0.0,
                                                                          ),
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .stretch,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children:
                                                                            [
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            tablet:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                            desktop:
                                                                                false,
                                                                          ))
                                                                            FlutterFlowVideoPlayer(
                                                                              path: 'https://firebasestorage.googleapis.com/v0/b/meencontra-64c35.appspot.com/o/video%2Fbobs%20anuncio.mp4?alt=media&token=a704ff1b-47e1-4c55-9a7e-c096125b6932',
                                                                              videoType: VideoType.network,
                                                                              width: 500.0,
                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                              autoPlay: true,
                                                                              looping: true,
                                                                              showControls: false,
                                                                              allowFullScreen: false,
                                                                              allowPlaybackSpeedMenu: false,
                                                                            ),
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                          ))
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: FlutterFlowTheme.of(context).accent4,
                                                                                          borderRadius: 30.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          fillColor: Color(0x71EEEEEE),
                                                                                          icon: Icon(
                                                                                            Icons.chevron_left_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('FEED_chevron_left_rounded_ICN_ON_TAP');
                                                                                            await _model.carouselWebController?.previousPage(
                                                                                              duration: Duration(milliseconds: 300),
                                                                                              curve: Curves.ease,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 600.0,
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                                              ),
                                                                                              child: Builder(
                                                                                                builder: (context) {
                                                                                                  final carrouselmeimpulsionaPlus = appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsionaPlus').toList();

                                                                                                  return Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 575.0,
                                                                                                    child: CarouselSlider.builder(
                                                                                                      itemCount: carrouselmeimpulsionaPlus.length,
                                                                                                      itemBuilder: (context, carrouselmeimpulsionaPlusIndex, _) {
                                                                                                        final carrouselmeimpulsionaPlusItem = carrouselmeimpulsionaPlus[carrouselmeimpulsionaPlusIndex];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsets.all(4.0),
                                                                                                          child: CardPremiumFeedWidget(
                                                                                                            key: Key('Keyhvd_${carrouselmeimpulsionaPlusIndex}_of_${carrouselmeimpulsionaPlus.length}'),
                                                                                                            logo: carrouselmeimpulsionaPlusItem.logo,
                                                                                                            nome: carrouselmeimpulsionaPlusItem.nomeFantasia,
                                                                                                            formatoAnuncio: carrouselmeimpulsionaPlusItem.formatoAnuncio,
                                                                                                            anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaPlusItem.reference).toList().first,
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                      carouselController: _model.carouselWebController ??= CarouselController(),
                                                                                                      options: CarouselOptions(
                                                                                                        initialPage: max(
                                                                                                            0,
                                                                                                            min(
                                                                                                                valueOrDefault<int>(
                                                                                                                  random_data.randomInteger(0, carrouselmeimpulsionaPlus.length),
                                                                                                                  0,
                                                                                                                ),
                                                                                                                carrouselmeimpulsionaPlus.length - 1)),
                                                                                                        viewportFraction: 1.0,
                                                                                                        disableCenter: true,
                                                                                                        enlargeCenterPage: true,
                                                                                                        enlargeFactor: 0.16,
                                                                                                        enableInfiniteScroll: true,
                                                                                                        scrollDirection: Axis.horizontal,
                                                                                                        autoPlay: true,
                                                                                                        autoPlayAnimationDuration: Duration(milliseconds: 2200),
                                                                                                        autoPlayInterval: Duration(milliseconds: (2200 + 2600)),
                                                                                                        autoPlayCurve: Curves.linear,
                                                                                                        pauseAutoPlayInFiniteScroll: true,
                                                                                                        onPageChanged: (index, _) => _model.carouselWebCurrentIndex = index,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: FlutterFlowTheme.of(context).accent4,
                                                                                          borderRadius: 30.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 40.0,
                                                                                          fillColor: Color(0x71EEEEEE),
                                                                                          icon: Icon(
                                                                                            Icons.chevron_right_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('FEED_chevron_right_rounded_ICN_ON_TAP');
                                                                                            await _model.carouselWebController?.nextPage(
                                                                                              duration: Duration(milliseconds: 300),
                                                                                              curve: Curves.ease,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  FFAppConstants.paddingMobile,
                                                                                  0.0,
                                                                                ),
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Container(
                                                                                    child: wrapWithModel(
                                                                                      model: _model.headerTitleFeedModel1,
                                                                                      updateCallback: () => safeSetState(() {}),
                                                                                      child: HeaderTitleFeedWidget(
                                                                                        texto: 'Categorias',
                                                                                        cor: FlutterFlowTheme.of(context).primary,
                                                                                        barrierWidth: 0.5,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final famosos = aplicativofeedCategoriasRecordList.toList().take(10).toList();

                                                                                      return SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: List.generate(famosos.length, (famososIndex) {
                                                                                            final famososItem = famosos[famososIndex];
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('FEED_PAGE_Container_x3oxfzlz_ON_TAP');

                                                                                                context.pushNamed(
                                                                                                  'SubCtegoria',
                                                                                                  queryParameters: {
                                                                                                    'subCategoria': serializeParam(
                                                                                                      famososItem.reference,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: CircleCategorieWidget(
                                                                                                key: Key('Keyx3o_${famososIndex}_of_${famosos.length}'),
                                                                                                img: valueOrDefault<String>(
                                                                                                  famososItem.imgBackgroundCategoria,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                                ),
                                                                                                name: famososItem.nomeDaCategoria,
                                                                                                resgatado: false,
                                                                                              ),
                                                                                            );
                                                                                          }).divide(SizedBox(width: MediaQuery.sizeOf(context).width > 1080.0 ? 20.0 : 4.0)),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<MateriasRecord>>(
                                                                            future:
                                                                                queryMateriasRecordOnce(
                                                                              queryBuilder: (materiasRecord) => materiasRecord.orderBy('DataPublicacaoMateria', descending: true),
                                                                              limit: 10,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<MateriasRecord> meInformaaMateriasRecordList = snapshot.data!;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                      child: wrapWithModel(
                                                                                        model: _model.feedCompletoInformaModel,
                                                                                        updateCallback: () => safeSetState(() {}),
                                                                                        child: FeedCompletoInformaWidget(
                                                                                          listaDocMaterias: meInformaaMateriasRecordList.where((e) => e.materiaDestaque == true).toList(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Alimentação',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: () {
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
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 220.0,
                                                                                                  height: 2.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final listaAnuncianteSmall = appAnuncianteRecordList.where((e) => (e.categoria == 'Alimentação') && (e.logo != '')).toList().map((e) => e).toList().sortedList(keyOf: (e) => random_data.randomInteger(0, 200), desc: false).toList().take(16).toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(listaAnuncianteSmall.length, (listaAnuncianteSmallIndex) {
                                                                                              final listaAnuncianteSmallItem = listaAnuncianteSmall[listaAnuncianteSmallIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Container_s2u17id1_ON_TAP');

                                                                                                    context.pushNamed(
                                                                                                      'AnunciantePerfil',
                                                                                                      queryParameters: {
                                                                                                        'referenciaAnunciante': serializeParam(
                                                                                                          listaAnuncianteSmallItem.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: CardSmallSubCategoriaWidget(
                                                                                                    key: Key('Keys2u_${listaAnuncianteSmallIndex}_of_${listaAnuncianteSmall.length}'),
                                                                                                    imagem: listaAnuncianteSmallItem.logo,
                                                                                                    nome: listaAnuncianteSmallItem.nomeFantasia,
                                                                                                    enderecoCompleto: listaAnuncianteSmallItem.nomeSubCategoria01,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final carrouselmeimpulsiona = appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsiona').toList();

                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            height: 400.0,
                                                                                            child: CarouselSlider.builder(
                                                                                              itemCount: carrouselmeimpulsiona.length,
                                                                                              itemBuilder: (context, carrouselmeimpulsionaIndex, _) {
                                                                                                final carrouselmeimpulsionaItem = carrouselmeimpulsiona[carrouselmeimpulsionaIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('FEED_PAGE_Container_ai5uln4f_ON_TAP');

                                                                                                      context.pushNamed(
                                                                                                        'AnunciantePerfil',
                                                                                                        queryParameters: {
                                                                                                          'referenciaAnunciante': serializeParam(
                                                                                                            carrouselmeimpulsionaItem.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: CardEssencialCopyWidget(
                                                                                                      key: Key('Keyai5_${carrouselmeimpulsionaIndex}_of_${carrouselmeimpulsiona.length}'),
                                                                                                      logo: carrouselmeimpulsionaItem.logo,
                                                                                                      nome: carrouselmeimpulsionaItem.nomeFantasia,
                                                                                                      formatoAnuncio: carrouselmeimpulsionaItem.formatoAnuncio,
                                                                                                      anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList().first,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              carouselController: _model.desktopController1 ??= CarouselController(),
                                                                                              options: CarouselOptions(
                                                                                                initialPage: max(
                                                                                                    0,
                                                                                                    min(
                                                                                                        valueOrDefault<int>(
                                                                                                          random_data.randomInteger(0, carrouselmeimpulsiona.length),
                                                                                                          0,
                                                                                                        ),
                                                                                                        carrouselmeimpulsiona.length - 1)),
                                                                                                viewportFraction: 0.32,
                                                                                                disableCenter: true,
                                                                                                enlargeCenterPage: true,
                                                                                                enlargeFactor: 0.16,
                                                                                                enableInfiniteScroll: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                autoPlay: true,
                                                                                                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                                                                                                autoPlayInterval: Duration(milliseconds: (1200 + 2600)),
                                                                                                autoPlayCurve: Curves.linear,
                                                                                                pauseAutoPlayInFiniteScroll: true,
                                                                                                onPageChanged: (index, _) => _model.desktopCurrentIndex1 = index,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                  ].divide(SizedBox(height: 24.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Recomendados',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: () {
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
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 220.0,
                                                                                                  height: 2.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 8.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final listaAnuncianteSmall = appAnuncianteRecordList.where((e) => e.logo != '').toList().sortedList(keyOf: (e) => random_data.randomInteger(0, 500), desc: false).toList().take(16).toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(listaAnuncianteSmall.length, (listaAnuncianteSmallIndex) {
                                                                                              final listaAnuncianteSmallItem = listaAnuncianteSmall[listaAnuncianteSmallIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Container_crj5kvim_ON_TAP');

                                                                                                    context.pushNamed(
                                                                                                      'AnunciantePerfil',
                                                                                                      queryParameters: {
                                                                                                        'referenciaAnunciante': serializeParam(
                                                                                                          listaAnuncianteSmallItem.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: CardSmallSubCategoriaWidget(
                                                                                                    key: Key('Keycrj_${listaAnuncianteSmallIndex}_of_${listaAnuncianteSmall.length}'),
                                                                                                    imagem: listaAnuncianteSmallItem.logo,
                                                                                                    nome: listaAnuncianteSmallItem.nomeFantasia,
                                                                                                    enderecoCompleto: listaAnuncianteSmallItem.nomeSubCategoria01,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final carrouselmeimpulsiona = appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsiona').toList();

                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            height: 400.0,
                                                                                            child: CarouselSlider.builder(
                                                                                              itemCount: carrouselmeimpulsiona.length,
                                                                                              itemBuilder: (context, carrouselmeimpulsionaIndex, _) {
                                                                                                final carrouselmeimpulsionaItem = carrouselmeimpulsiona[carrouselmeimpulsionaIndex];
                                                                                                return Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('FEED_PAGE_Container_hhrrk08x_ON_TAP');

                                                                                                      context.pushNamed(
                                                                                                        'AnunciantePerfil',
                                                                                                        queryParameters: {
                                                                                                          'referenciaAnunciante': serializeParam(
                                                                                                            carrouselmeimpulsionaItem.reference,
                                                                                                            ParamType.DocumentReference,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    child: CardEssencialCopyWidget(
                                                                                                      key: Key('Keyhhr_${carrouselmeimpulsionaIndex}_of_${carrouselmeimpulsiona.length}'),
                                                                                                      logo: carrouselmeimpulsionaItem.logo,
                                                                                                      nome: carrouselmeimpulsionaItem.nomeFantasia,
                                                                                                      formatoAnuncio: carrouselmeimpulsionaItem.formatoAnuncio,
                                                                                                      anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList().first,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              carouselController: _model.desktopController2 ??= CarouselController(),
                                                                                              options: CarouselOptions(
                                                                                                initialPage: max(
                                                                                                    0,
                                                                                                    min(
                                                                                                        valueOrDefault<int>(
                                                                                                          random_data.randomInteger(0, carrouselmeimpulsiona.length),
                                                                                                          0,
                                                                                                        ),
                                                                                                        carrouselmeimpulsiona.length - 1)),
                                                                                                viewportFraction: 0.32,
                                                                                                disableCenter: true,
                                                                                                enlargeCenterPage: true,
                                                                                                enlargeFactor: 0.16,
                                                                                                enableInfiniteScroll: true,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                autoPlay: true,
                                                                                                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                                                                                                autoPlayInterval: Duration(milliseconds: (1200 + 2600)),
                                                                                                autoPlayCurve: Curves.linear,
                                                                                                pauseAutoPlayInFiniteScroll: true,
                                                                                                onPageChanged: (index, _) => _model.desktopCurrentIndex2 = index,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                  ].divide(SizedBox(height: 24.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<MeDiverteRecord>>(
                                                                            future:
                                                                                queryMeDiverteRecordOnce(
                                                                              queryBuilder: (meDiverteRecord) => meDiverteRecord.orderBy('Data_Hora'),
                                                                              limit: 8,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<MeDiverteRecord> meDIVIRTAAMeDiverteRecordList = snapshot.data!;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: wrapWithModel(
                                                                                  model: _model.feedCompletoDivirtaModel,
                                                                                  updateCallback: () => safeSetState(() {}),
                                                                                  child: FeedCompletoDivirtaWidget(
                                                                                    listaDocEventos: meDIVIRTAAMeDiverteRecordList,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppConstants.paddingMobile,
                                                                                    0.0,
                                                                                  ),
                                                                                  0.0,
                                                                                  valueOrDefault<double>(
                                                                                    FFAppConstants.paddingMobile,
                                                                                    0.0,
                                                                                  ),
                                                                                  0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  containerAnunciosRecordList[random_data.randomInteger(0, 10)].fotoAnuncio,
                                                                                  width: double.infinity,
                                                                                  height: 350.0,
                                                                                  fit: BoxFit.cover,
                                                                                  cacheWidth: 500,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                  0.0,
                                                                                ),
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.favorite,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Text(
                                                                                                'Famosos no meencontra',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: () {
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
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        height: 2.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 220.0,
                                                                                              height: 2.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                  bottomRight: Radius.circular(8.0),
                                                                                                  topLeft: Radius.circular(0.0),
                                                                                                  topRight: Radius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 8.0)),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final famosos = appAnuncianteRecordList.where((e) => ((e.planoAssinatura != 'gratis') || (e.planoAssinatura != 'medestaca')) && (e.logo != '')).toList().sortedList(keyOf: (e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => ((e.planoAssinatura != 'gratis') || (e.planoAssinatura != 'medestaca')) && (e.logo != '')).toList().length), desc: false).toList().take(20).toList();

                                                                                      return SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: List.generate(famosos.length, (famososIndex) {
                                                                                            final famososItem = famosos[famososIndex];
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('FEED_PAGE_Container_jn80z28n_ON_TAP');

                                                                                                context.pushNamed(
                                                                                                  'AnunciantePerfil',
                                                                                                  queryParameters: {
                                                                                                    'referenciaAnunciante': serializeParam(
                                                                                                      famososItem.reference,
                                                                                                      ParamType.DocumentReference,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                );
                                                                                              },
                                                                                              child: CircleCategorieWidget(
                                                                                                key: Key('Keyjn8_${famososIndex}_of_${famosos.length}'),
                                                                                                img: valueOrDefault<String>(
                                                                                                  famososItem.logo,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                                ),
                                                                                                name: famososItem.nomeFantasia,
                                                                                                planoAssinatura: famososItem.planoAssinatura,
                                                                                                resgatado: famososItem.resgatado,
                                                                                              ),
                                                                                            );
                                                                                          }).divide(SizedBox(width: MediaQuery.sizeOf(context).width > 1080.0 ? 20.0 : 4.0)),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<MeContrataVAGASRecord>>(
                                                                            future:
                                                                                queryMeContrataVAGASRecordOnce(
                                                                              queryBuilder: (meContrataVAGASRecord) => meContrataVAGASRecord
                                                                                  .where(
                                                                                    'Status',
                                                                                    isEqualTo: 'Ativo',
                                                                                  )
                                                                                  .orderBy('Publicado', descending: true),
                                                                              limit: 8,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<MeContrataVAGASRecord> meCONTRATAMeContrataVAGASRecordList = snapshot.data!;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 80.0,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                                            valueOrDefault<double>(
                                                                                              FFAppConstants.paddingMobile,
                                                                                              0.0,
                                                                                            ),
                                                                                            0.0,
                                                                                            0.0,
                                                                                            0.0),
                                                                                        child: wrapWithModel(
                                                                                          model: _model.headerTitleFeedModel2,
                                                                                          updateCallback: () => safeSetState(() {}),
                                                                                          child: HeaderTitleFeedWidget(
                                                                                            texto: 'Vagas',
                                                                                            cor: FlutterFlowTheme.of(context).secondary,
                                                                                            barrierWidth: 0.5,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                                          valueOrDefault<double>(
                                                                                            FFAppConstants.paddingMobile,
                                                                                            0.0,
                                                                                          ),
                                                                                          0.0,
                                                                                          0.0,
                                                                                          0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final vagas = meCONTRATAMeContrataVAGASRecordList.toList().take(5).toList();

                                                                                          return SingleChildScrollView(
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: List.generate(vagas.length, (vagasIndex) {
                                                                                                final vagasItem = vagas[vagasIndex];
                                                                                                return MecontrataFeedWidget(
                                                                                                  key: Key('Key4sq_${vagasIndex}_of_${vagas.length}'),
                                                                                                  parameter4: vagasItem,
                                                                                                );
                                                                                              }).divide(SizedBox(width: 16.0)),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  FFAppConstants.paddingMobile,
                                                                                  0.0,
                                                                                ),
                                                                                12.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.medication,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Farmácia',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: () {
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
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('FEED_PAGE_Text_tczozbwr_ON_TAP');

                                                                                          context.pushNamed(
                                                                                            'SubCtegoria',
                                                                                            queryParameters: {
                                                                                              'subCategoria': serializeParam(
                                                                                                aplicativofeedCategoriasRecordList.where((e) => e.nomeDaCategoria == 'Farmácia').toList().first.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: Text(
                                                                                          'Ver todas ',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 2.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 120.0,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final farmacia = appAnuncianteRecordList.where((e) => (e.categoria == 'Farmácia') && (e.logo != '')).toList().take(16).toList();

                                                                                      return SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: List.generate(farmacia.length, (farmaciaIndex) {
                                                                                            final farmaciaItem = farmacia[farmaciaIndex];
                                                                                            return CircleCategorieWidget(
                                                                                              key: Key('Key78q_${farmaciaIndex}_of_${farmacia.length}'),
                                                                                              img: valueOrDefault<String>(
                                                                                                farmaciaItem.logo,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                              ),
                                                                                              name: farmaciaItem.nomeFantasia,
                                                                                              planoAssinatura: farmaciaItem.planoAssinatura,
                                                                                              resgatado: farmaciaItem.resgatado,
                                                                                            );
                                                                                          }).divide(SizedBox(width: 20.0)),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(height: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  FFAppConstants.paddingMobile,
                                                                                  0.0,
                                                                                ),
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.shopping_cart_sharp,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Mercado',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: () {
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
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                      InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('FEED_PAGE_Text_fhd9myq5_ON_TAP');

                                                                                          context.pushNamed(
                                                                                            'SubCtegoria',
                                                                                            queryParameters: {
                                                                                              'subCategoria': serializeParam(
                                                                                                aplicativofeedCategoriasRecordList.where((e) => e.nomeDaCategoria == 'Mercado').toList().first.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: Text(
                                                                                          'Ver todas ',
                                                                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 2.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 120.0,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      final mercado = appAnuncianteRecordList.where((e) => (e.categoria == 'Mercado') && (e.logo != '')).toList().take(16).toList();

                                                                                      return SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: List.generate(mercado.length, (mercadoIndex) {
                                                                                            final mercadoItem = mercado[mercadoIndex];
                                                                                            return CircleCategorieWidget(
                                                                                              key: Key('Keydtg_${mercadoIndex}_of_${mercado.length}'),
                                                                                              img: valueOrDefault<String>(
                                                                                                mercadoItem.logo,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                              ),
                                                                                              name: mercadoItem.nomeFantasia,
                                                                                              planoAssinatura: mercadoItem.planoAssinatura,
                                                                                              resgatado: mercadoItem.resgatado,
                                                                                            );
                                                                                          }).divide(SizedBox(width: 20.0)),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ].divide(SizedBox(height: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                          ))
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 580.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                              child: Image.asset(
                                                                                                'assets/images/icone_me_encontra_sem_fundo.png',
                                                                                                width: 80.0,
                                                                                                height: 80.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              'Destaque seu Negócio e Alcance Novos Patamares de Sucesso!',
                                                                                              style: FlutterFlowTheme.of(context).displayMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                              child: Text(
                                                                                                'Anuncie conosco e ganhe visibilidade instantânea na página principal. Atraia mais clientes e aumente suas vendas com nosso plano de destaque para anunciantes. Clique no botão abaixo para começar agora mesmo!',
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'Quero destacar meu negócio',
                                                                                              options: FFButtonOptions(
                                                                                                height: 48.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: Colors.white,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                elevation: 1.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: Colors.transparent,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 24.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Imagem_do_WhatsApp_de_2023-10-16_(s)_23.52.01_f44041c5.jpg',
                                                                                        width: 620.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppConstants.paddingMobile,
                                                                                    0.0,
                                                                                  ),
                                                                                  12.0,
                                                                                  valueOrDefault<double>(
                                                                                    FFAppConstants.paddingMobile,
                                                                                    0.0,
                                                                                  ),
                                                                                  0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.whatshot_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Em alta',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: () {
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
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 4.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 2.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).accent4,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 120.0,
                                                                                          height: 2.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                              topLeft: Radius.circular(0.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                    desktop: false,
                                                                                  ))
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final descobrir = appAnuncianteRecordList.where((e) => (e.resgatado == true) && (e.logo != '')).toList().sortedList(keyOf: (e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.resgatado == true).toList().length), desc: false).toList().take(50).toList();

                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(descobrir.length, (descobrirIndex) {
                                                                                              final descobrirItem = descobrir[descobrirIndex];
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                ),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Row_73ewuuva_ON_TAP');

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
                                                                                                                key: Key('Keynnv_${descobrirIndex}_of_${descobrir.length}'),
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
                                                                                              );
                                                                                            }).divide(SizedBox(height: 24.0)),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                  ))
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 900.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final emAltadesktop = appAnuncianteRecordList.where((e) => (e.resgatado == true) && (e.logo != '')).toList().sortedList(keyOf: (e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.resgatado == true).toList().length), desc: false).toList().take(50).toList();

                                                                                          return GridView.builder(
                                                                                            padding: EdgeInsets.zero,
                                                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                              crossAxisCount: 3,
                                                                                              crossAxisSpacing: 12.0,
                                                                                              mainAxisSpacing: 12.0,
                                                                                              childAspectRatio: 3.0,
                                                                                            ),
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: emAltadesktop.length,
                                                                                            itemBuilder: (context, emAltadesktopIndex) {
                                                                                              final emAltadesktopItem = emAltadesktop[emAltadesktopIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('FEED_PAGE_Container_eyn8qgzr_ON_TAP');

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
                                                                                                child: Material(
                                                                                                  color: Colors.transparent,
                                                                                                  elevation: 0.8,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  child: Container(
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
                                                                                                                key: Key('Key6n2_${emAltadesktopIndex}_of_${emAltadesktop.length}'),
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
                                                                                ].divide(SizedBox(height: 12.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height:
                                                                                () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              460.0) {
                                                                            return 24.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              1080.0) {
                                                                            return 40.0;
                                                                          } else if (MediaQuery.sizeOf(context).width >
                                                                              1080.0) {
                                                                            return 44.0;
                                                                          } else {
                                                                            return 270.0;
                                                                          }
                                                                        }())).addToEnd(SizedBox(height: 24.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              wrapWithModel(
                                                model: _model.navbarModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: NavbarWidget(
                                                  paginaAtual:
                                                      TelasMenuDrawer.Inicio,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
