import '/anunciante/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/card_essencial_copy/card_essencial_copy_widget.dart';
import '/feed_home/componentes/card_premium_feed/card_premium_feed_widget.dart';
import '/feed_home/componentes/circle_categorie/circle_categorie_widget.dart';
import '/feed_home/componentes/drawer_componente_usuario/drawer_componente_usuario_widget.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/feed_home/componentes/new_comp_anuncios_gera_l/new_comp_anuncios_gera_l_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import '/me_divirta/componentes/medivirta_feed/medivirta_feed_widget.dart';
import '/me_informa/componentes/me_informa_card_feed/me_informa_card_feed_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _FeedWidgetState extends State<FeedWidget> with TickerProviderStateMixin {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Feed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_PAGE_Feed_ON_INIT_STATE');
      setState(() {
        _model.categoriaSelecionada = 'Em destaque';
      });
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
        setState(() {
          FFAppState().versaoAtualMobile = _model.novaAtualizacao!.versao;
        });
      } else {
        return;
      }
    });

    _model.tabBar1Controller = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1170.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.6, 1.6),
          ),
        ],
      ),
    });

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

    return FutureBuilder<List<NotificacaoRecord>>(
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
        List<NotificacaoRecord> feedNotificacaoRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFEFF1F3),
              floatingActionButton: Visibility(
                visible: (valueOrDefault(currentUserDocument?.perfil, '') ==
                        'Anunciante') ||
                    (valueOrDefault(currentUserDocument?.perfil, '') ==
                        'Imprensa'),
                child: AuthUserStreamWidget(
                  builder: (context) => FloatingActionButton(
                    onPressed: () async {
                      logFirebaseEvent(
                          'FEED_FloatingActionButton_r0vkin9j_ON_TA');
                      var _shouldSetState = false;
                      if (valueOrDefault(currentUserDocument?.perfil, '') ==
                          'Imprensa') {
                        _model.imprensaRefere = await queryMeInformaRecordOnce(
                          queryBuilder: (meInformaRecord) =>
                              meInformaRecord.where(
                            'UsuarioRef',
                            isEqualTo: currentUserReference,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _shouldSetState = true;

                        context.pushNamed(
                          'TVGON',
                          queryParameters: {
                            'imprensaRef': serializeParam(
                              _model.imprensaRefere?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        if (_shouldSetState) setState(() {});
                        return;
                      } else if (valueOrDefault(
                              currentUserDocument?.perfil, '') ==
                          'Anunciante') {
                        _model.anuncianteRefFeed =
                            await queryAnuncianteRecordOnce(
                          queryBuilder: (anuncianteRecord) =>
                              anuncianteRecord.where(
                            'aid',
                            isEqualTo:
                                valueOrDefault(currentUserDocument?.iDUser, ''),
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _shouldSetState = true;

                        context.pushNamed(
                          'AnunciantePage',
                          queryParameters: {
                            'documentoRefAnunciante': serializeParam(
                              _model.anuncianteRefFeed,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'documentoRefAnunciante': _model.anuncianteRefFeed,
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('Perfil não identificado'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Fechar'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    elevation: 8.0,
                    child: Icon(
                      FFIcons.kshop,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              drawer: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: wrapWithModel(
                    model: _model.drawerComponenteUsuarioModel,
                    updateCallback: () => setState(() {}),
                    child: DrawerComponenteUsuarioWidget(),
                  ),
                ),
              ),
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, _) => [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    backgroundColor: MediaQuery.sizeOf(context).width <= 479.0
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).primaryBackground,
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
                              children: [
                                Flexible(
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
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                              ],
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
                                  FlutterFlowTheme.of(context).roxo
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(1.0, 0.0),
                                end: AlignmentDirectional(-1.0, 0),
                              ),
                            ),
                            child: wrapWithModel(
                              model: _model.feedMenuHorizontModel,
                              updateCallback: () => setState(() {}),
                              child: FeedMenuHorizontWidget(
                                paginaAtual: 'Pagina inicial',
                                notificacao: feedNotificacaoRecordList,
                                drawerAcao: () async {
                                  logFirebaseEvent(
                                      'FEED_PAGE_Container_xf6f4i6m_CALLBACK');
                                  scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    actions: [],
                    centerTitle: true,
                    elevation: 3.0,
                  )
                ],
                body: Builder(
                  builder: (context) {
                    return SafeArea(
                      top: false,
                      child: FutureBuilder<List<CategoriasRecord>>(
                        future: queryCategoriasRecordOnce(
                          queryBuilder: (categoriasRecord) =>
                              categoriasRecord.orderBy('NomeDaCategoria'),
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
                          List<CategoriasRecord>
                              aplicativofeedCategoriasRecordList =
                              snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: RefreshIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'FEED_Column_kkj19ekp_ON_PULL_TO_REFRESH');

                                context.pushNamed('Feed');
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if (((FFAppState().versaoAtualMobile !=
                                                FFAppState()
                                                    .versaoNoDispositivo) &&
                                            (isWeb != false)) &&
                                        responsiveVisibility(
                                          context: context,
                                          desktop: false,
                                        ))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'FEED_PAGE_atualizacao_ON_TAP');
                                          setState(() {
                                            FFAppState().versaoNoDispositivo =
                                                FFAppState().versaoAtualMobile;
                                          });
                                          if (isAndroid == true) {
                                            await launchURL(
                                                'https://play.google.com/store/apps/details?id=com.mycompany.meencontra&pcampaignid=web_share');
                                          } else if (isiOS == true) {
                                            await launchURL(
                                                'https://apps.apple.com/br/app/meencontra-app/id6463742581');
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'Atualização disponivel'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Fechar'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .roxo,
                                                FlutterFlowTheme.of(context)
                                                    .lilas
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, 0.0),
                                              end:
                                                  AlignmentDirectional(-1.0, 0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 12.0, 24.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Nova versão do aplicativo disponível! ',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: 'Atualize agora ',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                if (isiOS == true)
                                                  Icon(
                                                    Icons.apple_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation1']!),
                                                if (isAndroid == true)
                                                  Icon(
                                                    Icons.android_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation2']!),
                                              ].divide(SizedBox(width: 2.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      desktop: false,
                                    ))
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 24.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 44.0,
                                                          height: 44.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
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
                                                                        'FEED_PAGE_CircleImage_9puz5nqu_ON_TAP');
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openDrawer();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 200),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 200),
                                                                      imageUrl:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        currentUserPhoto,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/xg254mnosbli/_bbfda765-824e-4dc5-9afe-752725cc7e01.jpeg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation']!),
                                                            ],
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (loggedIn ==
                                                                  true)
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Text(
                                                                    'Olá, ${currentUserDisplayName}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              if (loggedIn ==
                                                                  false)
                                                                Flexible(
                                                                  child: Text(
                                                                    'Faça login para acessar tudo que o meencontra oferece.',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                  if (loggedIn == true)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'FEED_PAGE_Container_xqpkvcm7_ON_TAP');

                                                            context.pushNamed(
                                                              'notificacoes',
                                                              queryParameters: {
                                                                'notificacoes':
                                                                    serializeParam(
                                                                  feedNotificacaoRecordList,
                                                                  ParamType
                                                                      .Document,
                                                                  true,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'notificacoes':
                                                                    feedNotificacaoRecordList,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 42.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Stack(
                                                              children: [
                                                                if ((aplicativofeedCategoriasRecordList
                                                                            .length >=
                                                                        1) &&
                                                                    (feedNotificacaoRecordList
                                                                            .first
                                                                            .dataCriacao! >
                                                                        FFAppState()
                                                                            .ultimaNotificacaoAtualizacao!))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidBell,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((aplicativofeedCategoriasRecordList
                                                                            .length >=
                                                                        1) &&
                                                                    (feedNotificacaoRecordList
                                                                            .first
                                                                            .dataCriacao! >
                                                                        FFAppState()
                                                                            .ultimaNotificacaoAtualizacao!))
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          feedNotificacaoRecordList
                                                                              .where((e) => feedNotificacaoRecordList.first.dataCriacao! > FFAppState().ultimaNotificacaoAtualizacao!)
                                                                              .toList()
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (feedNotificacaoRecordList
                                                                        .first
                                                                        .dataCriacao! <
                                                                    FFAppState()
                                                                        .ultimaNotificacaoAtualizacao!)
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .ksino,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    FutureBuilder<List<AnuncianteRecord>>(
                                      future: queryAnuncianteRecordOnce(
                                        queryBuilder: (anuncianteRecord) =>
                                            anuncianteRecord.orderBy(
                                                'PlanoAssinatura',
                                                descending: true),
                                        limit: 900,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
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
                                          constraints: BoxConstraints(
                                            maxWidth: 1020.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child:
                                              // Lista de anúnciante
                                              StreamBuilder<
                                                  List<AnunciosRecord>>(
                                            stream: queryAnunciosRecord(
                                              queryBuilder: (anunciosRecord) =>
                                                  anunciosRecord.where(
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
                                              List<AnunciosRecord>
                                                  containerAnunciosRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
                                                    List<ProdutoRecord>>(
                                                  stream: queryProdutoRecord(
                                                    queryBuilder:
                                                        (produtoRecord) =>
                                                            produtoRecord.where(
                                                      'ProdutoAnunciado',
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
                                                    List<ProdutoRecord>
                                                        containerProdutoRecordList =
                                                        snapshot.data!;
                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          720.0
                                                                      ? 124.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          720.0
                                                                      ? 124.0
                                                                      : 0.0,
                                                                  0.0,
                                                                ),
                                                                0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            48.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            48.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('FEED_PAGE_Text_yb6ksh8d_ON_TAP');
                                                                                  setState(() {
                                                                                    _model.categoriaSelecionada = 'Em destaque';
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  'Em destaque',
                                                                                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 160.0,
                                                                                height: 2.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(8.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 12.0)),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
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
                                                                width: double
                                                                    .infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment(
                                                                              0.0,
                                                                              0),
                                                                      child:
                                                                          TabBar(
                                                                        isScrollable:
                                                                            true,
                                                                        labelColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        unselectedLabelColor:
                                                                            FlutterFlowTheme.of(context).accent2,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        unselectedLabelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        indicatorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        padding:
                                                                            EdgeInsets.all(4.0),
                                                                        tabs: [
                                                                          Tab(
                                                                            text:
                                                                                'Em destaque',
                                                                          ),
                                                                          Tab(
                                                                            text:
                                                                                'Alimentação',
                                                                          ),
                                                                          Tab(
                                                                            text:
                                                                                'Beleza',
                                                                          ),
                                                                          Tab(
                                                                            text:
                                                                                'Farmácia',
                                                                          ),
                                                                          Tab(
                                                                            text:
                                                                                'Imóveis',
                                                                          ),
                                                                          Tab(
                                                                            text:
                                                                                'Mercado',
                                                                          ),
                                                                        ],
                                                                        controller:
                                                                            _model.tabBar1Controller,
                                                                        onTap:
                                                                            (i) async {
                                                                          [
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_EmDestaque_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Em destaque';
                                                                              });
                                                                            },
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_Alimentacao_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Alimentação';
                                                                              });
                                                                            },
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_Beleza_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Beleza e estética';
                                                                              });
                                                                            },
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_Farmacia_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Farmácia';
                                                                              });
                                                                            },
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_Imoveis_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Imóveis';
                                                                              });
                                                                            },
                                                                            () async {
                                                                              logFirebaseEvent('FEED_PAGE_Mercado_ON_TAP');
                                                                              setState(() {
                                                                                _model.categoriaSelecionada = 'Mercado';
                                                                              });
                                                                            }
                                                                          ][i]();
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          TabBarView(
                                                                        controller:
                                                                            _model.tabBar1Controller,
                                                                        children: [
                                                                          Container(),
                                                                          Container(),
                                                                          Container(),
                                                                          Container(),
                                                                          Container(),
                                                                          Container(),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                        .tabBar1CurrentIndex !=
                                                                    0) {
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final meImpulsionaPlusTeste01 = appAnuncianteRecordList.where((e) => ((e.planoAssinatura == 'meimpulsionaPlus') || (e.planoAssinatura == 'medestacaCapa')) && (e.categoria == _model.categoriaSelecionada)).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsionaPlus').toList().length)).toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(meImpulsionaPlusTeste01.length, (meImpulsionaPlusTeste01Index) {
                                                                                  final meImpulsionaPlusTeste01Item = meImpulsionaPlusTeste01[meImpulsionaPlusTeste01Index];
                                                                                  return NewCompAnunciosGeraLWidget(
                                                                                    key: Key('Key2w1_${meImpulsionaPlusTeste01Index}_of_${meImpulsionaPlusTeste01.length}'),
                                                                                    anuncio: containerAnunciosRecordList.where((e) => e.parentReference == meImpulsionaPlusTeste01Item.reference).toList().first,
                                                                                    produtos: containerProdutoRecordList.where((e) => e.parentReference == meImpulsionaPlusTeste01Item.reference).toList(),
                                                                                    formatoAnuncio: meImpulsionaPlusTeste01Item.formatoAnuncio,
                                                                                    nomeFantasia: meImpulsionaPlusTeste01Item.nomeFantasia,
                                                                                    logo: meImpulsionaPlusTeste01Item.logo,
                                                                                    planoAssinatura: meImpulsionaPlusTeste01Item.planoAssinatura,
                                                                                    nextPageAnunciante: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_2w18ffp3_CALLBACK');

                                                                                      context.pushNamed(
                                                                                        'AnunciantePage',
                                                                                        queryParameters: {
                                                                                          'documentoRefAnunciante': serializeParam(
                                                                                            meImpulsionaPlusTeste01Item,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'documentoRefAnunciante': meImpulsionaPlusTeste01Item,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    btnWhatsapp: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_2w18ffp3_CALLBACK');

                                                                                      await meImpulsionaPlusTeste01Item.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'ConversasWhatsapp': FieldValue.increment(1.0),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      await launchURL('https://wa.me/55${meImpulsionaPlusTeste01Item.whatsComercial}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${currentUserDisplayName}+tudo+bem%3F');
                                                                                    },
                                                                                  );
                                                                                }).divide(SizedBox(height: 24.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final meImpulsiona = appAnuncianteRecordList.where((e) => (e.planoAssinatura == 'meimpulsiona') && (e.categoria == _model.categoriaSelecionada)).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsiona').toList().length)).toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(meImpulsiona.length, (meImpulsionaIndex) {
                                                                                  final meImpulsionaItem = meImpulsiona[meImpulsionaIndex];
                                                                                  return NewCompAnunciosGeraLWidget(
                                                                                    key: Key('Keyc8d_${meImpulsionaIndex}_of_${meImpulsiona.length}'),
                                                                                    anuncio: containerAnunciosRecordList.where((e) => e.parentReference == meImpulsionaItem.reference).toList().first,
                                                                                    produtos: containerProdutoRecordList.where((e) => e.parentReference == meImpulsionaItem.reference).toList(),
                                                                                    formatoAnuncio: meImpulsionaItem.formatoAnuncio,
                                                                                    nomeFantasia: meImpulsionaItem.nomeFantasia,
                                                                                    logo: meImpulsionaItem.logo,
                                                                                    planoAssinatura: meImpulsionaItem.planoAssinatura,
                                                                                    nextPageAnunciante: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_c8drgl6n_CALLBACK');

                                                                                      context.pushNamed(
                                                                                        'AnunciantePage',
                                                                                        queryParameters: {
                                                                                          'documentoRefAnunciante': serializeParam(
                                                                                            meImpulsionaItem,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'documentoRefAnunciante': meImpulsionaItem,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    btnWhatsapp: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_c8drgl6n_CALLBACK');

                                                                                      await meImpulsionaItem.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'ConversasWhatsapp': FieldValue.increment(1.0),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      await launchURL('https://wa.me/55${meImpulsionaItem.whatsComercial}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${currentUserDisplayName}+tudo+bem%3F');
                                                                                    },
                                                                                  );
                                                                                }).divide(SizedBox(height: 24.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final medestaca = appAnuncianteRecordList.where((e) => (e.planoAssinatura == 'medestaca') && (e.categoria == _model.categoriaSelecionada)).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsiona').toList().length)).toList();
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(medestaca.length, (medestacaIndex) {
                                                                                  final medestacaItem = medestaca[medestacaIndex];
                                                                                  return NewCompAnunciosGeraLWidget(
                                                                                    key: Key('Key603_${medestacaIndex}_of_${medestaca.length}'),
                                                                                    anuncio: containerAnunciosRecordList.where((e) => e.parentReference == medestacaItem.reference).toList().first,
                                                                                    produtos: containerProdutoRecordList.where((e) => e.parentReference == medestacaItem.reference).toList(),
                                                                                    formatoAnuncio: medestacaItem.formatoAnuncio,
                                                                                    nomeFantasia: medestacaItem.nomeFantasia,
                                                                                    logo: medestacaItem.logo,
                                                                                    planoAssinatura: medestacaItem.planoAssinatura,
                                                                                    nextPageAnunciante: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_603rsru9_CALLBACK');

                                                                                      context.pushNamed(
                                                                                        'AnunciantePage',
                                                                                        queryParameters: {
                                                                                          'documentoRefAnunciante': serializeParam(
                                                                                            medestacaItem,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'documentoRefAnunciante': medestacaItem,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    btnWhatsapp: () async {
                                                                                      logFirebaseEvent('FEED_PAGE_Container_603rsru9_CALLBACK');

                                                                                      await medestacaItem.reference.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'ConversasWhatsapp': FieldValue.increment(1.0),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      await launchURL('https://wa.me/55${medestacaItem.whatsComercial}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${currentUserDisplayName}+tudo+bem%3F');
                                                                                    },
                                                                                  );
                                                                                }).divide(SizedBox(height: 24.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                  0.0,
                                                                                ),
                                                                                12.0,
                                                                                valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                  0.0,
                                                                                ),
                                                                                0.0),
                                                                            child:
                                                                                Column(
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
                                                                                          'Descobrir',
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
                                                                                        final descobrir = appAnuncianteRecordList.where((e) => (e.logo != '') && (e.categoria == _model.categoriaSelecionada)).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.resgatado == true).toList().length)).toList().take(50).toList();
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(descobrir.length, (descobrirIndex) {
                                                                                            final descobrirItem = descobrir[descobrirIndex];
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('FEED_PAGE_Container_pdi2lloy_ON_TAP');

                                                                                                context.pushNamed(
                                                                                                  'AnunciantePage',
                                                                                                  queryParameters: {
                                                                                                    'documentoRefAnunciante': serializeParam(
                                                                                                      descobrirItem,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'documentoRefAnunciante': descobrirItem,
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.8,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
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
                                                                                                        Flexible(
                                                                                                          child: Column(
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
                                                                                                                    key: Key('Keyfio_${descobrirIndex}_of_${descobrir.length}'),
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
                                                                                                            ].divide(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }).divide(SizedBox(height: 16.0)),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(height: 32.0)).addToEnd(
                                                                              SizedBox(height: 24.0)),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 400.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final carrouselmeimpulsionaPlus = appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsionaPlus').toList();
                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          height: 180.0,
                                                                                          child: CarouselSlider.builder(
                                                                                            itemCount: carrouselmeimpulsionaPlus.length,
                                                                                            itemBuilder: (context, carrouselmeimpulsionaPlusIndex, _) {
                                                                                              final carrouselmeimpulsionaPlusItem = carrouselmeimpulsionaPlus[carrouselmeimpulsionaPlusIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('FEED_PAGE_NewcardPremiumFeed_ON_TAP');

                                                                                                  context.pushNamed(
                                                                                                    'AnunciantePage',
                                                                                                    queryParameters: {
                                                                                                      'documentoRefAnunciante': serializeParam(
                                                                                                        carrouselmeimpulsionaPlusItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'documentoRefAnunciante': carrouselmeimpulsionaPlusItem,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: CardPremiumFeedWidget(
                                                                                                  key: Key('Key2aa_${carrouselmeimpulsionaPlusIndex}_of_${carrouselmeimpulsionaPlus.length}'),
                                                                                                  logo: valueOrDefault<String>(
                                                                                                    carrouselmeimpulsionaPlusItem.logo,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                                  ),
                                                                                                  nome: carrouselmeimpulsionaPlusItem.nomeFantasia,
                                                                                                  formatoAnuncio: carrouselmeimpulsionaPlusItem.formatoAnuncio,
                                                                                                  anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaPlusItem.reference).toList().first,
                                                                                                  produtos: containerProdutoRecordList.where((e) => e.parentReference == carrouselmeimpulsionaPlusItem.reference).toList(),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            carouselController: _model.carouselTESTEController ??= CarouselController(),
                                                                                            options: CarouselOptions(
                                                                                              initialPage: min(
                                                                                                  valueOrDefault<int>(
                                                                                                    random_data.randomInteger(0, carrouselmeimpulsionaPlus.length),
                                                                                                    0,
                                                                                                  ),
                                                                                                  carrouselmeimpulsionaPlus.length - 1),
                                                                                              viewportFraction: 0.8,
                                                                                              disableCenter: true,
                                                                                              enlargeCenterPage: true,
                                                                                              enlargeFactor: 0.15,
                                                                                              enableInfiniteScroll: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              autoPlay: true,
                                                                                              autoPlayAnimationDuration: Duration(milliseconds: 600),
                                                                                              autoPlayInterval: Duration(milliseconds: (600 + 2600)),
                                                                                              autoPlayCurve: Curves.linear,
                                                                                              pauseAutoPlayInFiniteScroll: true,
                                                                                              onPageChanged: (index, _) => _model.carouselTESTECurrentIndex = index,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tabletLandscape: false,
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
                                                                                                                key: Key('Keyq51_${carrouselmeimpulsionaPlusIndex}_of_${carrouselmeimpulsionaPlus.length}'),
                                                                                                                logo: carrouselmeimpulsionaPlusItem.logo,
                                                                                                                nome: carrouselmeimpulsionaPlusItem.nomeFantasia,
                                                                                                                formatoAnuncio: carrouselmeimpulsionaPlusItem.formatoAnuncio,
                                                                                                                anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaPlusItem.reference).toList().first,
                                                                                                                produtos: containerProdutoRecordList.where((e) => e.parentReference == carrouselmeimpulsionaPlusItem.reference).toList(),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                          carouselController: _model.carouselWebController ??= CarouselController(),
                                                                                                          options: CarouselOptions(
                                                                                                            initialPage: min(
                                                                                                                valueOrDefault<int>(
                                                                                                                  random_data.randomInteger(0, carrouselmeimpulsionaPlus.length),
                                                                                                                  0,
                                                                                                                ),
                                                                                                                carrouselmeimpulsionaPlus.length - 1),
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
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: MediaQuery.sizeOf(context).width > 490.0 ? 42.0 : 38.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width > 490.0 ? 220.0 : 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                              0.0,
                                                                                                              0.0,
                                                                                                              valueOrDefault<double>(
                                                                                                                MediaQuery.sizeOf(context).width > 490.0 ? 16.0 : 8.0,
                                                                                                                0.0,
                                                                                                              ),
                                                                                                              0.0),
                                                                                                          child: Icon(
                                                                                                            FFIcons.kmeInformaON,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'me',
                                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'informa',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 2.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(8.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Text_9ygzfa2d_ON_TAP');

                                                                                                    context.pushNamed('meInforma');
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    'Ver todas ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 4.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 280.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: StreamBuilder<List<MateriasRecord>>(
                                                                                      stream: queryMateriasRecord(
                                                                                        queryBuilder: (materiasRecord) => materiasRecord.orderBy('DataPublicacaoMateria', descending: true),
                                                                                        limit: 10,
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
                                                                                        List<MateriasRecord> horizontalListMateriasRecordList = snapshot.data!;
                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.zero,
                                                                                          primary: false,
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          itemCount: horizontalListMateriasRecordList.length,
                                                                                          separatorBuilder: (_, __) => SizedBox(width: MediaQuery.sizeOf(context).width > 1080.0 ? 20.0 : 12.0),
                                                                                          itemBuilder: (context, horizontalListIndex) {
                                                                                            final horizontalListMateriasRecord = horizontalListMateriasRecordList[horizontalListIndex];
                                                                                            return MeInformaCardFeedWidget(
                                                                                              key: Key('Key8xe_${horizontalListIndex}_of_${horizontalListMateriasRecordList.length}'),
                                                                                              parameter1: horizontalListMateriasRecord.imagemCapa,
                                                                                              parameter2: horizontalListMateriasRecord.categoria,
                                                                                              parameter3: horizontalListMateriasRecord.tituloMateria,
                                                                                              parameter4: horizontalListMateriasRecord,
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                                        valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                          0.0,
                                                                                        ),
                                                                                        0.0,
                                                                                        0.0,
                                                                                        0.0),
                                                                                    child: Text(
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
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                                        valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                          0.0,
                                                                                        ),
                                                                                        0.0,
                                                                                        0.0,
                                                                                        0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: 2.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 130.0,
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
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                    desktop: false,
                                                                                  ))
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final carrouselmeimpulsiona = appAnuncianteRecordList.where((e) => e.planoAssinatura == 'meimpulsiona').toList();
                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          child: CarouselSlider.builder(
                                                                                            itemCount: carrouselmeimpulsiona.length,
                                                                                            itemBuilder: (context, carrouselmeimpulsionaIndex, _) {
                                                                                              final carrouselmeimpulsionaItem = carrouselmeimpulsiona[carrouselmeimpulsionaIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  logFirebaseEvent('FEED_PAGE_meImpulsiona_ON_TAP');

                                                                                                  context.pushNamed(
                                                                                                    'AnunciantePage',
                                                                                                    queryParameters: {
                                                                                                      'documentoRefAnunciante': serializeParam(
                                                                                                        carrouselmeimpulsionaItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'documentoRefAnunciante': carrouselmeimpulsionaItem,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: CardEssencialCopyWidget(
                                                                                                  key: Key('Key745_${carrouselmeimpulsionaIndex}_of_${carrouselmeimpulsiona.length}'),
                                                                                                  logo: valueOrDefault<String>(
                                                                                                    carrouselmeimpulsionaItem.logo,
                                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                                  ),
                                                                                                  nome: carrouselmeimpulsionaItem.nomeFantasia,
                                                                                                  formatoAnuncio: carrouselmeimpulsionaItem.formatoAnuncio,
                                                                                                  anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList().first,
                                                                                                  produtos: containerProdutoRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList(),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            carouselController: _model.mobileController ??= CarouselController(),
                                                                                            options: CarouselOptions(
                                                                                              initialPage: min(
                                                                                                  valueOrDefault<int>(
                                                                                                    random_data.randomInteger(0, carrouselmeimpulsiona.length),
                                                                                                    0,
                                                                                                  ),
                                                                                                  carrouselmeimpulsiona.length - 1),
                                                                                              viewportFraction: 0.5,
                                                                                              disableCenter: false,
                                                                                              enlargeCenterPage: false,
                                                                                              enlargeFactor: 0.0,
                                                                                              enableInfiniteScroll: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              autoPlay: true,
                                                                                              autoPlayAnimationDuration: Duration(milliseconds: 600),
                                                                                              autoPlayInterval: Duration(milliseconds: (600 + 2600)),
                                                                                              autoPlayCurve: Curves.linear,
                                                                                              pauseAutoPlayInFiniteScroll: true,
                                                                                              onPageChanged: (index, _) => _model.mobileCurrentIndex = index,
                                                                                            ),
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
                                                                                                    logFirebaseEvent('FEED_PAGE_Container_azwgqnkc_ON_TAP');

                                                                                                    context.pushNamed(
                                                                                                      'AnunciantePage',
                                                                                                      queryParameters: {
                                                                                                        'documentoRefAnunciante': serializeParam(
                                                                                                          carrouselmeimpulsionaItem,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'documentoRefAnunciante': carrouselmeimpulsionaItem,
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                  child: CardEssencialCopyWidget(
                                                                                                    key: Key('Keyazw_${carrouselmeimpulsionaIndex}_of_${carrouselmeimpulsiona.length}'),
                                                                                                    logo: carrouselmeimpulsionaItem.logo,
                                                                                                    nome: carrouselmeimpulsionaItem.nomeFantasia,
                                                                                                    formatoAnuncio: carrouselmeimpulsionaItem.formatoAnuncio,
                                                                                                    anuncios: containerAnunciosRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList().first,
                                                                                                    produtos: containerProdutoRecordList.where((e) => e.parentReference == carrouselmeimpulsionaItem.reference).toList(),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            carouselController: _model.desktopController ??= CarouselController(),
                                                                                            options: CarouselOptions(
                                                                                              initialPage: min(
                                                                                                  valueOrDefault<int>(
                                                                                                    random_data.randomInteger(0, carrouselmeimpulsiona.length),
                                                                                                    0,
                                                                                                  ),
                                                                                                  carrouselmeimpulsiona.length - 1),
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
                                                                                              onPageChanged: (index, _) => _model.desktopCurrentIndex = index,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: MediaQuery.sizeOf(context).width > 490.0 ? 42.0 : 38.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width > 490.0 ? 220.0 : 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                              0.0,
                                                                                                              0.0,
                                                                                                              valueOrDefault<double>(
                                                                                                                MediaQuery.sizeOf(context).width > 490.0 ? 16.0 : 8.0,
                                                                                                                0.0,
                                                                                                              ),
                                                                                                              0.0),
                                                                                                          child: Icon(
                                                                                                            FFIcons.kmeDivirtaOFF,
                                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'me',
                                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'divirta',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 2.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(8.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Text_qp9zn9p9_ON_TAP');

                                                                                                    context.pushNamed('meDivirta');
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    'Ver todas ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 274.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                      child: StreamBuilder<List<MeDiverteRecord>>(
                                                                                        stream: queryMeDiverteRecord(
                                                                                          queryBuilder: (meDiverteRecord) => meDiverteRecord.orderBy('Data_Hora'),
                                                                                          limit: 8,
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
                                                                                          List<MeDiverteRecord> horizontalListMeDiverteRecordList = snapshot.data!;
                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            itemCount: horizontalListMeDiverteRecordList.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(width: MediaQuery.sizeOf(context).width > 1080.0 ? 20.0 : 12.0),
                                                                                            itemBuilder: (context, horizontalListIndex) {
                                                                                              final horizontalListMeDiverteRecord = horizontalListMeDiverteRecordList[horizontalListIndex];
                                                                                              return MedivirtaFeedWidget(
                                                                                                key: Key('Keyepa_${horizontalListIndex}_of_${horizontalListMeDiverteRecordList.length}'),
                                                                                                parameter1: horizontalListMeDiverteRecord.imagemCapa,
                                                                                                parameter2: dateTimeFormat(
                                                                                                  'd',
                                                                                                  horizontalListMeDiverteRecord.dataHora!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                parameter3: dateTimeFormat(
                                                                                                  'MMM',
                                                                                                  horizontalListMeDiverteRecord.dataHora!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                parameter4: horizontalListMeDiverteRecord.ingressoURL,
                                                                                                parameter5: horizontalListMeDiverteRecord.nomeEvento,
                                                                                                parameter6: horizontalListMeDiverteRecord,
                                                                                                parameter7: dateTimeFormat(
                                                                                                  'EEEE',
                                                                                                  horizontalListMeDiverteRecord.dataHora!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                parameter8: dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  horizontalListMeDiverteRecord.dataHora!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                parameter9: horizontalListMeDiverteRecord.local,
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
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
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
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
                                                                                    final famosos = appAnuncianteRecordList.where((e) => ((e.planoAssinatura != 'gratis') || (e.planoAssinatura != 'medestaca')) && (e.logo != '')).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => ((e.planoAssinatura != 'gratis') || (e.planoAssinatura != 'medestaca')) && (e.logo != '')).toList().length)).toList().take(30).toList();
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
                                                                                              logFirebaseEvent('FEED_PAGE_Container_3qucte2a_ON_TAP');

                                                                                              context.pushNamed(
                                                                                                'AnunciantePage',
                                                                                                queryParameters: {
                                                                                                  'documentoRefAnunciante': serializeParam(
                                                                                                    famososItem,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'documentoRefAnunciante': famososItem,
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                            child: CircleCategorieWidget(
                                                                                              key: Key('Key3qu_${famososIndex}_of_${famosos.length}'),
                                                                                              img: valueOrDefault<String>(
                                                                                                famososItem.logo,
                                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                              ),
                                                                                              name: famososItem.nomeFantasia,
                                                                                              planoAssinatura: famososItem.planoAssinatura,
                                                                                              resgatado: famososItem.resgatado,
                                                                                              anuncianteRefACTION: () async {
                                                                                                logFirebaseEvent('FEED_PAGE_Container_3qucte2a_CALLBACK');

                                                                                                context.pushNamed(
                                                                                                  'AnunciantePage',
                                                                                                  queryParameters: {
                                                                                                    'documentoRefAnunciante': serializeParam(
                                                                                                      famososItem,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'documentoRefAnunciante': famososItem,
                                                                                                  },
                                                                                                );
                                                                                              },
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
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: MediaQuery.sizeOf(context).width > 490.0 ? 42.0 : 38.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width > 490.0 ? 220.0 : 160.0,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                              0.0,
                                                                                                              0.0,
                                                                                                              valueOrDefault<double>(
                                                                                                                MediaQuery.sizeOf(context).width > 490.0 ? 16.0 : 8.0,
                                                                                                                0.0,
                                                                                                              ),
                                                                                                              0.0),
                                                                                                          child: Icon(
                                                                                                            FFIcons.kmeContrataOFF,
                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'me',
                                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.9, 0.0),
                                                                                                          child: Text(
                                                                                                            'contrata',
                                                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  fontSize: MediaQuery.sizeOf(context).width > 490.0 ? 28.0 : 22.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 2.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(8.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('FEED_PAGE_Text_z94gdvci_ON_TAP');

                                                                                                    context.pushNamed('meContrata');
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    'Ver todas ',
                                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 2.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 1.0),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 250.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                      child: StreamBuilder<List<MeContrataVAGASRecord>>(
                                                                                        stream: queryMeContrataVAGASRecord(
                                                                                          queryBuilder: (meContrataVAGASRecord) => meContrataVAGASRecord
                                                                                              .where(
                                                                                                'Status',
                                                                                                isEqualTo: 'Ativo',
                                                                                              )
                                                                                              .orderBy('Publicado', descending: true),
                                                                                          limit: 8,
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
                                                                                          List<MeContrataVAGASRecord> horizontalListMeContrataVAGASRecordList = snapshot.data!;
                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            itemCount: horizontalListMeContrataVAGASRecordList.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(width: MediaQuery.sizeOf(context).width > 1080.0 ? 20.0 : 12.0),
                                                                                            itemBuilder: (context, horizontalListIndex) {
                                                                                              final horizontalListMeContrataVAGASRecord = horizontalListMeContrataVAGASRecordList[horizontalListIndex];
                                                                                              return MecontrataFeedWidget(
                                                                                                key: Key('Keyuje_${horizontalListIndex}_of_${horizontalListMeContrataVAGASRecordList.length}'),
                                                                                                parameter4: horizontalListMeContrataVAGASRecord,
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
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
                                                                                        logFirebaseEvent('FEED_PAGE_Text_t5lini9n_ON_TAP');

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
                                                                                    final farmacia = appAnuncianteRecordList.where((e) => (e.categoria == 'Farmácia') && (e.logo != '')).toList();
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: List.generate(farmacia.length, (farmaciaIndex) {
                                                                                          final farmaciaItem = farmacia[farmaciaIndex];
                                                                                          return CircleCategorieWidget(
                                                                                            key: Key('Keygsd_${farmaciaIndex}_of_${farmacia.length}'),
                                                                                            img: valueOrDefault<String>(
                                                                                              farmaciaItem.logo,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                            ),
                                                                                            name: farmaciaItem.nomeFantasia,
                                                                                            planoAssinatura: farmaciaItem.planoAssinatura,
                                                                                            resgatado: farmaciaItem.resgatado,
                                                                                            anuncianteRefACTION: () async {
                                                                                              logFirebaseEvent('FEED_PAGE_Container_gsd60fvr_CALLBACK');

                                                                                              context.pushNamed(
                                                                                                'AnunciantePage',
                                                                                                queryParameters: {
                                                                                                  'documentoRefAnunciante': serializeParam(
                                                                                                    farmaciaItem,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'documentoRefAnunciante': farmaciaItem,
                                                                                                },
                                                                                              );
                                                                                            },
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
                                                                                MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                0.0,
                                                                              ),
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
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
                                                                                        logFirebaseEvent('FEED_PAGE_Text_b6zry6x5_ON_TAP');

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
                                                                                    final mercado = appAnuncianteRecordList.where((e) => (e.categoria == 'Mercado') && (e.logo != '')).toList();
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: List.generate(mercado.length, (mercadoIndex) {
                                                                                          final mercadoItem = mercado[mercadoIndex];
                                                                                          return CircleCategorieWidget(
                                                                                            key: Key('Keymez_${mercadoIndex}_of_${mercado.length}'),
                                                                                            img: valueOrDefault<String>(
                                                                                              mercadoItem.logo,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                                                                            ),
                                                                                            name: mercadoItem.nomeFantasia,
                                                                                            planoAssinatura: mercadoItem.planoAssinatura,
                                                                                            resgatado: mercadoItem.resgatado,
                                                                                            anuncianteRefACTION: () async {
                                                                                              logFirebaseEvent('FEED_PAGE_Container_mezq33r4_CALLBACK');

                                                                                              context.pushNamed(
                                                                                                'AnunciantePage',
                                                                                                queryParameters: {
                                                                                                  'documentoRefAnunciante': serializeParam(
                                                                                                    mercadoItem,
                                                                                                    ParamType.Document,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                                extra: <String, dynamic>{
                                                                                                  'documentoRefAnunciante': mercadoItem,
                                                                                                },
                                                                                              );
                                                                                            },
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
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                580.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
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
                                                                                  MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                  0.0,
                                                                                ),
                                                                                12.0,
                                                                                valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width >= 720.0 ? 0.0 : 24.0,
                                                                                  0.0,
                                                                                ),
                                                                                0.0),
                                                                            child:
                                                                                Column(
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
                                                                                        final descobrir = appAnuncianteRecordList.where((e) => (e.resgatado == true) && (e.logo != '')).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.resgatado == true).toList().length)).toList().take(50).toList();
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(descobrir.length, (descobrirIndex) {
                                                                                            final descobrirItem = descobrir[descobrirIndex];
                                                                                            return InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('FEED_PAGE_Container_pnm9yl25_ON_TAP');

                                                                                                context.pushNamed(
                                                                                                  'AnunciantePage',
                                                                                                  queryParameters: {
                                                                                                    'documentoRefAnunciante': serializeParam(
                                                                                                      descobrirItem,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'documentoRefAnunciante': descobrirItem,
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.8,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
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
                                                                                                                  key: Key('Keyne6_${descobrirIndex}_of_${descobrir.length}'),
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
                                                                                          }).divide(SizedBox(height: 16.0)),
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
                                                                                        final emAltadesktop = appAnuncianteRecordList.where((e) => (e.resgatado == true) && (e.logo != '')).toList().sortedList((e) => random_data.randomInteger(1, appAnuncianteRecordList.where((e) => e.resgatado == true).toList().length)).toList().take(50).toList();
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
                                                                                                logFirebaseEvent('FEED_PAGE_Container_o7bpb7c3_ON_TAP');

                                                                                                context.pushNamed(
                                                                                                  'AnunciantePage',
                                                                                                  queryParameters: {
                                                                                                    'documentoRefAnunciante': serializeParam(
                                                                                                      emAltadesktopItem,
                                                                                                      ParamType.Document,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    'documentoRefAnunciante': emAltadesktopItem,
                                                                                                  },
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
                                                                                                              key: Key('Key175_${emAltadesktopIndex}_of_${emAltadesktop.length}'),
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
                                                                      }())).addToEnd(
                                                                              SizedBox(height: 24.0)),
                                                                    ),
                                                                  );
                                                                }
                                                              },
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
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
