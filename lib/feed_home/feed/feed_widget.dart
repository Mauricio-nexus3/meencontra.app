import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/anuncios_c_a_r_d_s/card_essencial/card_essencial_widget.dart';
import '/componentes/anuncios_c_a_r_d_s/card_premium_feed/card_premium_feed_widget.dart';
import '/componentes/circle_categorie/circle_categorie_widget.dart';
import '/components/nehuma_notificacao_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_contrata/mecontrata_feed/mecontrata_feed_widget.dart';
import '/me_divirta/medivirta_feed/medivirta_feed_widget.dart';
import '/me_informa/me_informa_card_feed/me_informa_card_feed_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 1000.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.1, 1.1),
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 1000.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.1, 1.1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1170.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.6, 1.6),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    _model.versaoAtualAppController ??= TextEditingController();
    _model.versaoAtualAppFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.versaoAtualAppController?.text = '2.0.4';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<NotificacaoRecord>>(
      stream: queryNotificacaoRecord(
        queryBuilder: (notificacaoRecord) =>
            notificacaoRecord.orderBy('data_criacao', descending: true),
        limit: 10,
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
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: (valueOrDefault(currentUserDocument?.perfil, '') ==
                      'Anunciante') ||
                  (valueOrDefault(currentUserDocument?.perfil, '') ==
                      'Imprensa'),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton(
                  onPressed: () async {
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
                        'Anunciante',
                        queryParameters: {
                          'refAnunciante': serializeParam(
                            _model.anuncianteRefFeed?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 24.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              FFIcons.kclose,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault<String>(
                                      currentUserDisplayName,
                                      'Não cadastrado',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    currentUserEmail,
                                    'Usuario não registrado',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                              Divider(
                                height: 20.0,
                                thickness: 1.0,
                                indent: 24.0,
                                endIndent: 24.0,
                                color:
                                    FlutterFlowTheme.of(context).inputLightGray,
                              ),
                              if (valueOrDefault(
                                      currentUserDocument?.perfil, '') ==
                                  'Admin')
                                AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('meDashboard');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 12.0, 8.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.space_dashboard_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Dashboard',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          FFIcons.ksino,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: SwitchListTile.adaptive(
                                          value: _model.switchListTileValue1 ??=
                                              true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.switchListTileValue1 =
                                                    newValue!);
                                          },
                                          title: Text(
                                            'Notificações',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor: Color(0x3439D2C0),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 4.0, 0.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (FFAppState().EsconderDaTela == true)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.dark_mode_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: SwitchListTile.adaptive(
                                            value: _model
                                                .switchListTileValue2 ??= false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchListTileValue2 =
                                                      newValue!);
                                            },
                                            title: Text(
                                              'Tema escuro',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor: Color(0x3439D2C0),
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 4.0, 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Divider(
                                height: 20.0,
                                thickness: 1.0,
                                indent: 24.0,
                                endIndent: 24.0,
                                color:
                                    FlutterFlowTheme.of(context).inputLightGray,
                              ),
                              if (loggedIn == true)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'EditarPerfil',
                                      queryParameters: {
                                        'usuarioREF': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 12.0, 8.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              FFIcons.keditarUsuario,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Editar Perfil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (loggedIn == true)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (valueOrDefault(
                                            currentUserDocument?.perfil, '') ==
                                        'Usuario') {
                                      context.pushNamed(
                                        'NovoAnunciante',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 400),
                                          ),
                                        },
                                      );
                                    } else {
                                      _model.anuncianteReferencia =
                                          await queryAnuncianteRecordOnce(
                                        queryBuilder: (anuncianteRecord) =>
                                            anuncianteRecord.where(
                                          'aid',
                                          isEqualTo: valueOrDefault(
                                              currentUserDocument?.iDUser, ''),
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);

                                      context.pushNamed(
                                        'Anunciante',
                                        queryParameters: {
                                          'refAnunciante': serializeParam(
                                            _model.anuncianteReferencia
                                                ?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 12.0, 8.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kshop,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(
                                                            currentUserDocument
                                                                ?.perfil,
                                                            '') ==
                                                        'Usuario'
                                                    ? 'Cadastrar o meu negócio'
                                                    : 'Meu negócio',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 12.0, 8.0, 12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Suporte',
                                        queryParameters: {
                                          'usuarioRef': serializeParam(
                                            currentUserReference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.support_agent_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Suporte',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.pushNamedAuth(
                                        'Index', context.mounted);
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Icon(
                                                FFIcons.ksairLogout,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Sair',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (currentUserEmail == 'mauricio@meencontra.app')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('testeAtual');
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Icon(
                                                  Icons.devices_other_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Text(
                                                'TESTE ATUAL',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (isWeb == true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'meencontra v3.2.5',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    if (isWeb == false)
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'meencontra v',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 50.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 50.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .versaoAtualAppController,
                                                  focusNode: _model
                                                      .versaoAtualAppFocusNode,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                  validator: _model
                                                      .versaoAtualAppControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            endDrawer: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notificações',
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kclose,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                                _model.ultimaNotificacao =
                                    await queryNotificacaoRecordOnce(
                                  queryBuilder: (notificacaoRecord) =>
                                      notificacaoRecord.orderBy('data_criacao',
                                          descending: true),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                setState(() {
                                  FFAppState().ultimaNotificacao =
                                      getCurrentTimestamp;
                                });

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final notificacoes =
                                  feedNotificacaoRecordList.toList();
                              if (notificacoes.isEmpty) {
                                return Center(
                                  child: NehumaNotificacaoWidget(),
                                );
                              }
                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: notificacoes.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 8.0),
                                itemBuilder: (context, notificacoesIndex) {
                                  final notificacoesItem =
                                      notificacoes[notificacoesIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            notificacoesItem
                                                                .titulo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'relative',
                                                              notificacoesItem
                                                                  .dataCriacao!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                              if (notificacoesItem
                                                      .dataCriacao! >
                                                  FFAppState()
                                                      .ultimaNotificacao!)
                                                Container(
                                                  width: 8.0,
                                                  height: 8.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<CategoriasRecord>>(
                future: _model.categoriaFeed(
                  requestFn: () => queryCategoriasRecordOnce(
                    queryBuilder: (categoriasRecord) =>
                        categoriasRecord.orderBy('NomeDaCategoria'),
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
                  List<CategoriasRecord> aplicativofeedCategoriasRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: RefreshIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                      onRefresh: () async {
                        context.pushNamed('Feed');
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                child: Container(
                                  width: double.infinity,
                                  height: 44.0,
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
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
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder<List<AnunciosRecord>>(
                              stream: queryAnunciosRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AnunciosRecord> appAnunciosRecordList =
                                    snapshot.data!;
                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 1020.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child:
                                      // Lista de anúnciante
                                      StreamBuilder<List<AnuncianteRecord>>(
                                    stream: queryAnuncianteRecord(
                                      queryBuilder: (anuncianteRecord) =>
                                          anuncianteRecord.orderBy(
                                              'PlanoAssinatura',
                                              descending: true),
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
                                      List<AnuncianteRecord>
                                          containerAnuncianteRecordList =
                                          snapshot.data!;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            if ((_model.versaoAtualAppController
                                                        .text !=
                                                    FFAppState()
                                                        .ultimaAtualizacao) &&
                                                (isWeb == false))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState()
                                                            .ultimaAtualizacao =
                                                        _model
                                                            .versaoAtualAppController
                                                            .text;
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
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'vai levar para loja'),
                                                            content: Text(
                                                                'IOS ou Android'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Fechar'),
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .roxo,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lilas
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      end: AlignmentDirectional(
                                                          -1.0, 0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                12.0,
                                                                24.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Nova versão do aplicativo disponível! ',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'Atualize agora ',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                          ),
                                                        ),
                                                        if (isiOS == true)
                                                          Icon(
                                                            Icons.apple_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconOnPageLoadAnimation1']!),
                                                        if (isAndroid == true)
                                                          Icon(
                                                            Icons
                                                                .android_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconOnPageLoadAnimation2']!),
                                                      ].divide(
                                                          SizedBox(width: 2.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                      scaffoldKey
                                                                          .currentState!
                                                                          .openDrawer();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
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
                                                                            Duration(milliseconds: 200),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 200),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          currentUserPhoto,
                                                                          'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
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
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'containerOnPageLoadAnimation9']!),
                                                              ],
                                                            ),
                                                          ),
                                                          if (loggedIn == true)
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Text(
                                                                'Olá, ${currentUserDisplayName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium,
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (loggedIn ==
                                                                    false)
                                                                  Flexible(
                                                                    child: Text(
                                                                      'Faça login para acessar tudo que o meencontra oferece.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
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
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'Categorias');
                                                            },
                                                            child: Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                FFIcons.klupa,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Stack(
                                                            children: [
                                                              if ((feedNotificacaoRecordList
                                                                          .length >=
                                                                      1) &&
                                                                  (feedNotificacaoRecordList
                                                                          .first
                                                                          .dataCriacao! >
                                                                      FFAppState()
                                                                          .ultimaNotificacao!))
                                                                badges.Badge(
                                                                  badgeContent:
                                                                      Text(
                                                                    feedNotificacaoRecordList
                                                                        .where((e) =>
                                                                            feedNotificacaoRecordList.first.dataCriacao! >
                                                                            FFAppState().ultimaNotificacao!)
                                                                        .toList()
                                                                        .length
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  showBadge: (feedNotificacaoRecordList
                                                                              .length >=
                                                                          1) &&
                                                                      (feedNotificacaoRecordList
                                                                              .first
                                                                              .dataCriacao! >
                                                                          FFAppState()
                                                                              .ultimaNotificacao!),
                                                                  shape: badges
                                                                      .BadgeShape
                                                                      .circle,
                                                                  badgeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                  elevation:
                                                                      2.0,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  position: badges
                                                                          .BadgePosition
                                                                      .topEnd(),
                                                                  animationType:
                                                                      badges
                                                                          .BadgeAnimationType
                                                                          .scale,
                                                                  toAnimate:
                                                                      true,
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
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
                                                                        scaffoldKey
                                                                            .currentState!
                                                                            .openEndDrawer();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(6.0),
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidBell,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (feedNotificacaoRecordList
                                                                      .first
                                                                      .dataCriacao! <
                                                                  FFAppState()
                                                                      .ultimaNotificacao!)
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
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openEndDrawer();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .ksino,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Em destaque',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 400.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final carrousel = appAnunciosRecordList
                                                              .where((e) =>
                                                                  ((e.planoDoAnuncio == 'meimpulsionaPlus') ||
                                                                      (e.planoDoAnuncio ==
                                                                          'Turbo') ||
                                                                      (e.planoDoAnuncio ==
                                                                          'Premium')) &&
                                                                  (e.anunciado ==
                                                                      true))
                                                              .toList();
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height: 180.0,
                                                            child:
                                                                CarouselSlider
                                                                    .builder(
                                                              itemCount:
                                                                  carrousel
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  carrouselIndex,
                                                                  _) {
                                                                final carrouselItem =
                                                                    carrousel[
                                                                        carrouselIndex];
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
                                                                    context
                                                                        .pushNamed(
                                                                      'Anunciante',
                                                                      queryParameters:
                                                                          {
                                                                        'refAnunciante':
                                                                            serializeParam(
                                                                          carrouselItem
                                                                              .parentReference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        'italyImage',
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          CardPremiumFeedWidget(
                                                                        key: Key(
                                                                            'Keyphp_${carrouselIndex}_of_${carrousel.length}'),
                                                                        fotoAnuncio:
                                                                            carrouselItem.fotoAnuncio,
                                                                        descricao:
                                                                            carrouselItem.descricao,
                                                                        valor: carrouselItem
                                                                            .valor,
                                                                        imgLogo: containerAnuncianteRecordList
                                                                            .where((e) =>
                                                                                e.reference ==
                                                                                carrouselItem.parentReference)
                                                                            .toList()
                                                                            .first
                                                                            .logo,
                                                                        nomeFantasiaAnunciante: containerAnuncianteRecordList
                                                                            .where((e) =>
                                                                                e.reference ==
                                                                                carrouselItem.parentReference)
                                                                            .toList()
                                                                            .first
                                                                            .nomeFantasia,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              carouselController:
                                                                  _model.carouselTESTEController ??=
                                                                      CarouselController(),
                                                              options:
                                                                  CarouselOptions(
                                                                initialPage:
                                                                    min(
                                                                        valueOrDefault<
                                                                            int>(
                                                                          random_data.randomInteger(
                                                                              0,
                                                                              carrousel.length),
                                                                          0,
                                                                        ),
                                                                        carrousel.length -
                                                                            1),
                                                                viewportFraction:
                                                                    0.8,
                                                                disableCenter:
                                                                    true,
                                                                enlargeCenterPage:
                                                                    true,
                                                                enlargeFactor:
                                                                    0.15,
                                                                enableInfiniteScroll:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                autoPlay: true,
                                                                autoPlayAnimationDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            600),
                                                                autoPlayInterval: Duration(
                                                                    milliseconds:
                                                                        (600 +
                                                                            2600)),
                                                                autoPlayCurve:
                                                                    Curves
                                                                        .linear,
                                                                pauseAutoPlayInFiniteScroll:
                                                                    true,
                                                                onPageChanged: (index,
                                                                        _) =>
                                                                    _model.carouselTESTECurrentIndex =
                                                                        index,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Categorias',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                          InkWell(
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
                                                              context.pushNamed(
                                                                'Categorias',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
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
                                                                    context.pushNamed(
                                                                        'Categorias');
                                                                  },
                                                                  child: Text(
                                                                    'Ver todas ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final categoriaVar =
                                                            aplicativofeedCategoriasRecordList
                                                                .toList();
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: List.generate(
                                                                categoriaVar
                                                                    .length,
                                                                (categoriaVarIndex) {
                                                              final categoriaVarItem =
                                                                  categoriaVar[
                                                                      categoriaVarIndex];
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
                                                                  context
                                                                      .pushNamed(
                                                                    'SubCtegoria',
                                                                    queryParameters:
                                                                        {
                                                                      'subCategoria':
                                                                          serializeParam(
                                                                        categoriaVarItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      'italyImage',
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        CircleCategorieWidget(
                                                                      key: Key(
                                                                          'Keym1f_${categoriaVarIndex}_of_${categoriaVar.length}'),
                                                                      img: categoriaVarItem
                                                                          .imgBackgroundCategoria,
                                                                      name: categoriaVarItem
                                                                          .nomeDaCategoria,
                                                                      anuncianteRef:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'SubCtegoria',
                                                                          queryParameters:
                                                                              {
                                                                            'subCategoria':
                                                                                serializeParam(
                                                                              categoriaVarItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }).divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
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
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kmeInformaON,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.9,
                                                                        0.0),
                                                                child: Text(
                                                                  'me',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.9,
                                                                        0.0),
                                                                child: Text(
                                                                  'informa',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: InkWell(
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
                                                              context.pushNamed(
                                                                  'meInforma');
                                                            },
                                                            child: Text(
                                                              'Ver todas ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      indent: 24.0,
                                                      endIndent: 24.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 280.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                MateriasRecord>>(
                                                          stream:
                                                              queryMateriasRecord(
                                                            queryBuilder: (materiasRecord) =>
                                                                materiasRecord.orderBy(
                                                                    'DataPublicacaoMateria',
                                                                    descending:
                                                                        true),
                                                            limit: 7,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<MateriasRecord>
                                                                horizontalListMateriasRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  horizontalListMateriasRecordList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      width:
                                                                          12.0),
                                                              itemBuilder: (context,
                                                                  horizontalListIndex) {
                                                                final horizontalListMateriasRecord =
                                                                    horizontalListMateriasRecordList[
                                                                        horizontalListIndex];
                                                                return MeInformaCardFeedWidget(
                                                                  key: Key(
                                                                      'Keysd5_${horizontalListIndex}_of_${horizontalListMateriasRecordList.length}'),
                                                                  parameter1:
                                                                      horizontalListMateriasRecord
                                                                          .imagemCapa,
                                                                  parameter2:
                                                                      horizontalListMateriasRecord
                                                                          .categoria,
                                                                  parameter3:
                                                                      horizontalListMateriasRecord
                                                                          .tituloMateria,
                                                                  parameter4:
                                                                      horizontalListMateriasRecord
                                                                          .reference,
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 4.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Recomendados',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final meImpulsiona = appAnunciosRecordList
                                                              .where((e) =>
                                                                  ((e.planoDoAnuncio == 'meimpulsiona') ||
                                                                      (e.planoDoAnuncio ==
                                                                          'Master') ||
                                                                      (e.planoDoAnuncio ==
                                                                          'Gold')) &&
                                                                  (e.anunciado ==
                                                                      true))
                                                              .toList();
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                CarouselSlider
                                                                    .builder(
                                                              itemCount:
                                                                  meImpulsiona
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  meImpulsionaIndex,
                                                                  _) {
                                                                final meImpulsionaItem =
                                                                    meImpulsiona[
                                                                        meImpulsionaIndex];
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
                                                                    if (loggedIn ==
                                                                        true) {
                                                                      context
                                                                          .pushNamed(
                                                                        'Anunciante',
                                                                        queryParameters:
                                                                            {
                                                                          'refAnunciante':
                                                                              serializeParam(
                                                                            meImpulsionaItem.parentReference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
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
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                usoExclusivo: true,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  },
                                                                  child: Hero(
                                                                    tag:
                                                                        'italyImage',
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          CardEssencialWidget(
                                                                        key: Key(
                                                                            'Keyqgm_${meImpulsionaIndex}_of_${meImpulsiona.length}'),
                                                                        fotoAnuncioEssencial:
                                                                            meImpulsionaItem.fotoAnuncio,
                                                                        logoImg: containerAnuncianteRecordList
                                                                            .where((e) =>
                                                                                e.reference ==
                                                                                meImpulsionaItem.parentReference)
                                                                            .toList()
                                                                            .first
                                                                            .logo,
                                                                        nomeFantasiaAnunciante: containerAnuncianteRecordList
                                                                            .where((e) =>
                                                                                e.reference ==
                                                                                meImpulsionaItem.parentReference)
                                                                            .toList()
                                                                            .first
                                                                            .nomeFantasia,
                                                                        anuncianteRefAcao:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'Anunciante',
                                                                            queryParameters:
                                                                                {
                                                                              'refAnunciante': serializeParam(
                                                                                meImpulsionaItem.parentReference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              carouselController:
                                                                  _model.carouselController ??=
                                                                      CarouselController(),
                                                              options:
                                                                  CarouselOptions(
                                                                initialPage:
                                                                    min(
                                                                        valueOrDefault<
                                                                            int>(
                                                                          random_data.randomInteger(
                                                                              0,
                                                                              meImpulsiona.length),
                                                                          0,
                                                                        ),
                                                                        meImpulsiona.length -
                                                                            1),
                                                                viewportFraction:
                                                                    0.5,
                                                                disableCenter:
                                                                    false,
                                                                enlargeCenterPage:
                                                                    false,
                                                                enlargeFactor:
                                                                    0.0,
                                                                enableInfiniteScroll:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                autoPlay: true,
                                                                autoPlayAnimationDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            600),
                                                                autoPlayInterval: Duration(
                                                                    milliseconds:
                                                                        (600 +
                                                                            2600)),
                                                                autoPlayCurve:
                                                                    Curves
                                                                        .linear,
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
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
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
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kmeDivirtaON,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.9,
                                                                        0.0),
                                                                child: Text(
                                                                  'me',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.9,
                                                                        0.0),
                                                                child: Text(
                                                                  'divirta',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: InkWell(
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
                                                              context.pushNamed(
                                                                  'meDivirta');
                                                            },
                                                            child: Text(
                                                              'Ver todas ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      indent: 24.0,
                                                      endIndent: 24.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 274.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MeDiverteRecord>>(
                                                            stream:
                                                                queryMeDiverteRecord(
                                                              queryBuilder: (meDiverteRecord) =>
                                                                  meDiverteRecord
                                                                      .orderBy(
                                                                          'Data_Hora'),
                                                              limit: 5,
                                                            ),
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
                                                              List<MeDiverteRecord>
                                                                  horizontalListMeDiverteRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    horizontalListMeDiverteRecordList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        width:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        horizontalListIndex) {
                                                                  final horizontalListMeDiverteRecord =
                                                                      horizontalListMeDiverteRecordList[
                                                                          horizontalListIndex];
                                                                  return MedivirtaFeedWidget(
                                                                    key: Key(
                                                                        'Keydgf_${horizontalListIndex}_of_${horizontalListMeDiverteRecordList.length}'),
                                                                    parameter1:
                                                                        horizontalListMeDiverteRecord
                                                                            .imagemCapa,
                                                                    parameter2:
                                                                        dateTimeFormat(
                                                                      'd',
                                                                      horizontalListMeDiverteRecord
                                                                          .dataHora!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    parameter3:
                                                                        dateTimeFormat(
                                                                      'MMM',
                                                                      horizontalListMeDiverteRecord
                                                                          .dataHora!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    parameter4:
                                                                        horizontalListMeDiverteRecord
                                                                            .ingressoURL,
                                                                    parameter5:
                                                                        horizontalListMeDiverteRecord
                                                                            .nomeEvento,
                                                                    parameter6:
                                                                        horizontalListMeDiverteRecord
                                                                            .reference,
                                                                    parameter7:
                                                                        dateTimeFormat(
                                                                      'EEEE',
                                                                      horizontalListMeDiverteRecord
                                                                          .dataHora!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    parameter8:
                                                                        dateTimeFormat(
                                                                      'Hm',
                                                                      horizontalListMeDiverteRecord
                                                                          .dataHora!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    parameter9:
                                                                        horizontalListMeDiverteRecord
                                                                            .local,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 12.0, 0.0, 12.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
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
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .fastfood_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              'Alimentação',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
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
                                                            context.pushNamed(
                                                              'SubCtegoria',
                                                              queryParameters: {
                                                                'subCategoria':
                                                                    serializeParam(
                                                                  aplicativofeedCategoriasRecordList
                                                                      .where((e) =>
                                                                          e.nomeDaCategoria ==
                                                                          'Alimentação')
                                                                      .toList()
                                                                      .first
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Ver todas ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final alimentacao =
                                                            containerAnuncianteRecordList
                                                                .where((e) =>
                                                                    e.categoria ==
                                                                    'Alimentação')
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
                                                            children: List.generate(
                                                                alimentacao
                                                                    .length,
                                                                (alimentacaoIndex) {
                                                              final alimentacaoItem =
                                                                  alimentacao[
                                                                      alimentacaoIndex];
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
                                                                  context
                                                                      .pushNamed(
                                                                    'Anunciante',
                                                                    queryParameters:
                                                                        {
                                                                      'refAnunciante':
                                                                          serializeParam(
                                                                        alimentacaoItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    CircleCategorieWidget(
                                                                  key: Key(
                                                                      'Keyfpp_${alimentacaoIndex}_of_${alimentacao.length}'),
                                                                  img: valueOrDefault<
                                                                      String>(
                                                                    alimentacaoItem
                                                                        .logo,
                                                                    'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png',
                                                                  ),
                                                                  name: alimentacaoItem
                                                                      .nomeFantasia,
                                                                  anuncianteRef:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'Anunciante',
                                                                      queryParameters:
                                                                          {
                                                                        'refAnunciante':
                                                                            serializeParam(
                                                                          alimentacaoItem
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }).divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kmeContrataOFF,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.9,
                                                                          0.0),
                                                                  child: Text(
                                                                    'me',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.9,
                                                                          0.0),
                                                                  child: Text(
                                                                    'contrata',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: InkWell(
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
                                                                context.pushNamed(
                                                                    'meContrata');
                                                              },
                                                              child: Text(
                                                                'Ver todas ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      indent: 24.0,
                                                      endIndent: 24.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 250.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MeContrataVAGASRecord>>(
                                                            stream:
                                                                queryMeContrataVAGASRecord(
                                                              queryBuilder: (meContrataVAGASRecord) =>
                                                                  meContrataVAGASRecord
                                                                      .where(
                                                                        'Status',
                                                                        isEqualTo:
                                                                            'Ativo',
                                                                      )
                                                                      .orderBy(
                                                                          'Publicado',
                                                                          descending:
                                                                              true),
                                                              limit: 4,
                                                            ),
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
                                                              List<MeContrataVAGASRecord>
                                                                  horizontalListMeContrataVAGASRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    horizontalListMeContrataVAGASRecordList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        width:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        horizontalListIndex) {
                                                                  final horizontalListMeContrataVAGASRecord =
                                                                      horizontalListMeContrataVAGASRecordList[
                                                                          horizontalListIndex];
                                                                  return MecontrataFeedWidget(
                                                                    key: Key(
                                                                        'Keyqw2_${horizontalListIndex}_of_${horizontalListMeContrataVAGASRecordList.length}'),
                                                                    parameter1:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .logoEmpresa,
                                                                    parameter2:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .nomeVaga,
                                                                    parameter3:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .nomeEmpresa,
                                                                    parameter4:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .reference,
                                                                    parameter5:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .descricao,
                                                                    parameter6:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .localidade,
                                                                    parameter7:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .salario,
                                                                    parameter8:
                                                                        horizontalListMeContrataVAGASRecord
                                                                            .contratoTrabalho,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 12.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
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
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.medication,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              'Farmácia',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
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
                                                            context.pushNamed(
                                                              'SubCtegoria',
                                                              queryParameters: {
                                                                'subCategoria':
                                                                    serializeParam(
                                                                  aplicativofeedCategoriasRecordList
                                                                      .where((e) =>
                                                                          e.nomeDaCategoria ==
                                                                          'Farmácia')
                                                                      .toList()
                                                                      .first
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Ver todas ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final farmacia =
                                                            containerAnuncianteRecordList
                                                                .where((e) =>
                                                                    e.categoria ==
                                                                    'Farmácia')
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
                                                            children: List.generate(
                                                                farmacia.length,
                                                                (farmaciaIndex) {
                                                              final farmaciaItem =
                                                                  farmacia[
                                                                      farmaciaIndex];
                                                              return CircleCategorieWidget(
                                                                key: Key(
                                                                    'Key3r6_${farmaciaIndex}_of_${farmacia.length}'),
                                                                img:
                                                                    farmaciaItem
                                                                        .logo,
                                                                name: farmaciaItem
                                                                    .nomeFantasia,
                                                                anuncianteRef:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'Anunciante',
                                                                    queryParameters:
                                                                        {
                                                                      'refAnunciante':
                                                                          serializeParam(
                                                                        farmaciaItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              );
                                                            }).divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
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
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .shopping_cart_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            Text(
                                                              'Mercado',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
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
                                                            context.pushNamed(
                                                              'SubCtegoria',
                                                              queryParameters: {
                                                                'subCategoria':
                                                                    serializeParam(
                                                                  aplicativofeedCategoriasRecordList
                                                                      .where((e) =>
                                                                          e.nomeDaCategoria ==
                                                                          'Mercado')
                                                                      .toList()
                                                                      .first
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            'Ver todas ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final mercado =
                                                            containerAnuncianteRecordList
                                                                .where((e) =>
                                                                    e.categoria ==
                                                                    'Mercado')
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
                                                            children: List.generate(
                                                                mercado.length,
                                                                (mercadoIndex) {
                                                              final mercadoItem =
                                                                  mercado[
                                                                      mercadoIndex];
                                                              return CircleCategorieWidget(
                                                                key: Key(
                                                                    'Keyetw_${mercadoIndex}_of_${mercado.length}'),
                                                                img: mercadoItem
                                                                    .logo,
                                                                name: mercadoItem
                                                                    .nomeFantasia,
                                                                anuncianteRef:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'Anunciante',
                                                                    queryParameters:
                                                                        {
                                                                      'refAnunciante':
                                                                          serializeParam(
                                                                        mercadoItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              );
                                                            }).divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 12.0)),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 24.0))
                                              .addToEnd(SizedBox(height: 24.0)),
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
            ),
          ),
        );
      },
    );
  }
}
