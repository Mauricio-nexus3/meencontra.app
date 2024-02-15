import '/anunciante/comentarios/editar_comentario/editar_comentario_widget.dart';
import '/anunciante/comentarios/novo_comentario/novo_comentario_widget.dart';
import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'anunciante_model.dart';
export 'anunciante_model.dart';

class AnuncianteWidget extends StatefulWidget {
  const AnuncianteWidget({
    super.key,
    this.refAnunciante,
  });

  final DocumentReference? refAnunciante;

  @override
  State<AnuncianteWidget> createState() => _AnuncianteWidgetState();
}

class _AnuncianteWidgetState extends State<AnuncianteWidget>
    with TickerProviderStateMixin {
  late AnuncianteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(3.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnuncianteModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.newComentarioController1 ??= TextEditingController();
    _model.newComentarioFocusNode1 ??= FocusNode();

    _model.newComentarioController2 ??= TextEditingController();
    _model.newComentarioFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return StreamBuilder<AnuncianteRecord>(
      stream: AnuncianteRecord.getDocument(widget.refAnunciante!),
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
        final anuncianteAnuncianteRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: Visibility(
            visible: anuncianteAnuncianteRecord.aid ==
                valueOrDefault(currentUserDocument?.iDUser, ''),
            child: AuthUserStreamWidget(
              builder: (context) => FloatingActionButton(
                onPressed: () async {
                  context.pushNamed('Feed');
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  FFIcons.khomeOFFStroke,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ),
          ),
          drawer: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            child: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 100.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).gradient1180deg,
                              FlutterFlowTheme.of(context).gradient2
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 0.0),
                            end: AlignmentDirectional(-1.0, 0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Relatório',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kclose,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Conversar iniciadas',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 18.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                anuncianteAnuncianteRecord
                                                    .conversasWhatsapp
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Ligações iniciadas',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 18.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                anuncianteAnuncianteRecord
                                                    .ligacaoes
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 1.0, 12.0, 0.0),
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (anuncianteAnuncianteRecord.planoModelo01 !=
                                  'gratis')
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'DashboardAnuncios',
                                      queryParameters: {
                                        'dashboardAnuncios': serializeParam(
                                          widget.refAnunciante,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kanuncios,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Seus anuncios',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (anuncianteAnuncianteRecord.planoModelo01 !=
                                  'gratis')
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'DashboardCatalogo',
                                      queryParameters: {
                                        'dashMenuCatalogo': serializeParam(
                                          widget.refAnunciante,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kadd,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Catalogo ',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'ConcluirCadastro',
                                    queryParameters: {
                                      'anuncianteRef': serializeParam(
                                        widget.refAnunciante,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Icon(
                                            FFIcons.kconfiguracaoSettingROUND,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                        Text(
                                          'Informações',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'SuporteAnunciante',
                                    queryParameters: {
                                      'anuncianteRef': serializeParam(
                                        widget.refAnunciante,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.ksuporte,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Text(
                                              'Suporte',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF23037B),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kestatisticas,
                                              color: Color(0x68E0E0E0),
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Estatisticas',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0x68E0E0E0),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kcadeado,
                                            color: Color(0x68E0E0E0),
                                            size: 20.0,
                                          ),
                                          Text(
                                            'Em breve',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0x68E0E0E0),
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF23037B),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              Icons.account_circle_rounded,
                                              color: Color(0x68E0E0E0),
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            'Assinatura',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0x68E0E0E0),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kcadeado,
                                            color: Color(0x68E0E0E0),
                                            size: 20.0,
                                          ),
                                          Text(
                                            'Em breve',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0x68E0E0E0),
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 12.0))
                                .around(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (anuncianteAnuncianteRecord.aid ==
                                valueOrDefault(
                                    currentUserDocument?.iDUser, '')) {
                              return Container(
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0x4DFFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          scaffoldKey.currentState!
                                              .openDrawer();
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.alignLeft,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                      Text(
                                        'Dashboard',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 4.0, 24.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Container(
                                          width: 48.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_back_ios_new,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                // Alterar para bottosheet depois essa função
                                                if (loggedIn == true) {
                                                  _model.currentPageLink =
                                                      await generateCurrentPageLink(
                                                    context,
                                                    title:
                                                        'Serviço ${anuncianteAnuncianteRecord.nomeFantasia}',
                                                    imageUrl:
                                                        anuncianteAnuncianteRecord
                                                            .logo,
                                                    description:
                                                        anuncianteAnuncianteRecord
                                                            .descricao,
                                                  );

                                                  await launchURL(
                                                      _model.currentPageLink);
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              UsarDeslogadoUsoExclusivoCompWidget(
                                                            usoExclusivo: true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.ios_share,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AlignedTooltip(
                                              content: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'Resgatar estabele',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  )),
                                              offset: 4.0,
                                              preferredDirection:
                                                  AxisDirection.down,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              tailBaseWidth: 24.0,
                                              tailLength: 12.0,
                                              waitDuration:
                                                  Duration(milliseconds: 100),
                                              showDuration:
                                                  Duration(milliseconds: 1500),
                                              triggerMode:
                                                  TooltipTriggerMode.tap,
                                              child: Visibility(
                                                visible: (anuncianteAnuncianteRecord
                                                            .resgatado ==
                                                        false) &&
                                                    (valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAnunciante,
                                                            false) ==
                                                        false),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (loggedIn == true) {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: Text(
                                                                            'Resgatar o meu negócio'),
                                                                        content:
                                                                            Text('Você é o proprietário ou responsável deste estabelecimento? Ao confirmar, você terá controle total sobre o perfil, incluindo atualizações e personalizações. '),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Não, não sou'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Sim, Resgatar'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          context.pushNamed(
                                                            'PagamentoInterno',
                                                            queryParameters: {
                                                              'anuncianteREF':
                                                                  serializeParam(
                                                                widget
                                                                    .refAnunciante,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          return;
                                                        }
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    UsarDeslogadoUsoExclusivoCompWidget(
                                                                  usoExclusivo:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              FFIcons.kresgatar,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 1020.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              if (anuncianteAnuncianteRecord.planoModelo01 ==
                                  'Premium') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 250.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                70.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                70.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 220.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                anuncianteAnuncianteRecord
                                                                    .logo,
                                                                width: 20.0,
                                                                height: 160.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
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
                                                                    .primaryBackground,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: 120.0,
                                                              height: 120.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                anuncianteAnuncianteRecord
                                                                    .logo,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        anuncianteAnuncianteRecord
                                                            .nomeFantasia,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 22.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          if (true /* Warning: Trying to access variable not yet defined. */)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<RedeSocialRecord>>(
                                                stream: queryRedeSocialRecord(
                                                  parent: widget.refAnunciante,
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
                                                  List<RedeSocialRecord>
                                                      redeSociaisRedeSocialRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ),
                                                    child: Visibility(
                                                      visible:
                                                          redeSociaisRedeSocialRecordList
                                                                  .length >
                                                              0,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final listaRedeSocial =
                                                                redeSociaisRedeSocialRecordList
                                                                    .toList()
                                                                    .take(5)
                                                                    .toList();
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                      listaRedeSocial
                                                                          .length,
                                                                      (listaRedeSocialIndex) {
                                                                final listaRedeSocialItem =
                                                                    listaRedeSocial[
                                                                        listaRedeSocialIndex];
                                                                return Align(
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
                                                                      await launchURL(
                                                                          () {
                                                                        if (listaRedeSocialItem.nomeRedeSocial ==
                                                                            'Instagram') {
                                                                          return 'https://www.instagram.com/${listaRedeSocialItem.arroboDaRedeSocial}';
                                                                        } else if (listaRedeSocialItem.nomeRedeSocial ==
                                                                            'Facebook') {
                                                                          return 'https://www.facebook.com/${listaRedeSocialItem.arroboDaRedeSocial}';
                                                                        } else {
                                                                          return 'https://www.youtube.com/@${listaRedeSocialItem.arroboDaRedeSocial}';
                                                                        }
                                                                      }());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          48.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: listaRedeSocialItem.nomeRedeSocial ==
                                                                                'Instagram'
                                                                            ? Color(0xFFE1306C)
                                                                            : Color(0xFF2763E0),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (listaRedeSocialItem.nomeRedeSocial ==
                                                                              'Instagram')
                                                                            FaIcon(
                                                                              FontAwesomeIcons.instagram,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (listaRedeSocialItem.nomeRedeSocial ==
                                                                              'Facebook')
                                                                            FaIcon(
                                                                              FontAwesomeIcons.facebookF,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          8.0))
                                                                  .around(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                  size: 16.0,
                                                                ),
                                                                SelectionArea(
                                                                    child: Text(
                                                                  formatNumber(
                                                                    anuncianteAnuncianteRecord
                                                                        .notaMedia,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '0.0',
                                                                    locale:
                                                                        'br',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                )),
                                                              ].divide(SizedBox(
                                                                  width: 4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              HorarioAtendimentoRecord>>(
                                                        stream:
                                                            queryHorarioAtendimentoRecord(
                                                          parent: widget
                                                              .refAnunciante,
                                                          singleRecord: true,
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
                                                          List<HorarioAtendimentoRecord>
                                                              statusHorarioAtendimentoRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final statusHorarioAtendimentoRecord =
                                                              statusHorarioAtendimentoRecordList
                                                                      .isNotEmpty
                                                                  ? statusHorarioAtendimentoRecordList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (statusHorarioAtendimentoRecord
                                                                        ?.periodo ==
                                                                    '24 horas') {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Icon(
                                                                        FFIcons
                                                                            .ktimeTwentyFour,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                      Text(
                                                                        'horas',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  );
                                                                } else {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .clock,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${dateTimeFormat(
                                                                          'Hm',
                                                                          statusHorarioAtendimentoRecord
                                                                              ?.horaAbre,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}-${dateTimeFormat(
                                                                          'Hm',
                                                                          statusHorarioAtendimentoRecord
                                                                              ?.horaFecha,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapMarkerAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 16.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${formatNumber(
                                                                functions.distanceBetweenTwoPoints(
                                                                    anuncianteAnuncianteRecord
                                                                        .googleMaps,
                                                                    currentUserLocationValue),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '0.0',
                                                                locale: 'br',
                                                              )}Km',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 24.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await widget
                                                                .refAnunciante!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'ConversasWhatsapp':
                                                                      FieldValue
                                                                          .increment(
                                                                              1.0),
                                                                },
                                                              ),
                                                            });
                                                            await launchURL(
                                                                'https://wa.me/55${anuncianteAnuncianteRecord.whatsComercial}?text=Ol%C3%A1%2C+vim+atrav%C3%A9s+do+Me.encontra+app.+Meu+nome+${currentUserDisplayName}+tudo+bem%3F');
                                                          },
                                                          child: Container(
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF25D366),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Whatsapp',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .whatsapp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 8.0,
                                                        buttonSize: 45.0,
                                                        fillColor:
                                                            Color(0xFFC3FFDD),
                                                        icon: Icon(
                                                          Icons.call,
                                                          color:
                                                              Color(0xFF25D366),
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          if (isWeb == true) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Não é suportado na versão web',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                              ),
                                                            );
                                                            return;
                                                          }

                                                          await widget
                                                              .refAnunciante!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'Ligacaoes':
                                                                    FieldValue
                                                                        .increment(
                                                                            1.0),
                                                              },
                                                            ),
                                                          });
                                                          await launchUrl(Uri(
                                                            scheme: 'tel',
                                                            path: anuncianteAnuncianteRecord
                                                                .whatsComercial,
                                                          ));
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 8.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 45.0,
                                                        icon: Icon(
                                                          FFIcons.kmapMarker,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      MapGoogleWidget(
                                                                    google: anuncianteAnuncianteRecord
                                                                        .googleMaps!,
                                                                    endereco:
                                                                        anuncianteAnuncianteRecord
                                                                            .enderecoCompleto,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                          if (valueOrDefault(
                                                  currentUserDocument?.perfil,
                                                  '') ==
                                              'Admin')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 24.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Enviar notificação?'),
                                                                            content:
                                                                                Text('Tem certeza quer enviar uma notificação para os usuarios desse anunciante'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Não enviar'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Sim, enviar notificação'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              _model.usuariosRef =
                                                                  await queryUsersRecordOnce();
                                                              _shouldSetState =
                                                                  true;
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    'meimpulsiona plus',
                                                                notificationText:
                                                                    '${anuncianteAnuncianteRecord.nomeFantasia} Já é destaque em nosso aplicativo',
                                                                notificationImageUrl:
                                                                    anuncianteAnuncianteRecord
                                                                        .logo,
                                                                userRefs: _model
                                                                    .usuariosRef!
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                                initialPageName:
                                                                    'Anunciante',
                                                                parameterData: {
                                                                  'refAnunciante':
                                                                      widget
                                                                          .refAnunciante,
                                                                },
                                                              );
                                                              setState(() {
                                                                _model.ultimaNotificacao =
                                                                    getCurrentTimestamp;
                                                                _model.responsavelPorNotificacao =
                                                                    currentUserDisplayName;
                                                              });
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          'Notificação enviada'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          text:
                                                              'Enviar notificação',
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .solidBell,
                                                            size: 16.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                            elevation: 1.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Ultima notificacao: ${dateTimeFormat(
                                                            'd/M/y',
                                                            _model
                                                                .ultimaNotificacao,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )} - Enviado por: ${_model.responsavelPorNotificacao}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.mapPin,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 16.0,
                                                  ),
                                                  Text(
                                                    anuncianteAnuncianteRecord
                                                        .enderecoCompleto,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ),
                                          if (anuncianteAnuncianteRecord.site !=
                                                  null &&
                                              anuncianteAnuncianteRecord.site !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
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
                                                              .language_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 16.0,
                                                        ),
                                                        Text(
                                                          anuncianteAnuncianteRecord
                                                              .site,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'LinkExterno',
                                                          queryParameters: {
                                                            'linkExterno':
                                                                serializeParam(
                                                              anuncianteAnuncianteRecord
                                                                  .site,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Icon(
                                                        FFIcons.karrowRIght,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 16.0,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation']!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (anuncianteAnuncianteRecord
                                                      .telefoneFixo !=
                                                  null &&
                                              anuncianteAnuncianteRecord
                                                      .telefoneFixo !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.phone,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    Text(
                                                      anuncianteAnuncianteRecord
                                                          .telefoneFixo,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          if (anuncianteAnuncianteRecord
                                                      .emailComercial !=
                                                  null &&
                                              anuncianteAnuncianteRecord
                                                      .emailComercial !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.email,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 16.0,
                                                    ),
                                                    Text(
                                                      anuncianteAnuncianteRecord
                                                          .emailComercial,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          if (anuncianteAnuncianteRecord
                                                      .descricao !=
                                                  null &&
                                              anuncianteAnuncianteRecord
                                                      .descricao !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sobre:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            anuncianteAnuncianteRecord
                                                                .descricao,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 700.0,
                                      constraints: BoxConstraints(
                                        minHeight: 500.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment(0.0, 0),
                                                    child: TabBar(
                                                      isScrollable: true,
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      unselectedLabelStyle:
                                                          TextStyle(),
                                                      indicatorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      tabs: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons.kanuncios,
                                                              size: 24.0,
                                                            ),
                                                            Tab(
                                                              text: '',
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .kcatalogoANuncio,
                                                            ),
                                                            Tab(
                                                              text: '',
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .kcomentarios,
                                                            ),
                                                            Tab(
                                                              text: '',
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                      controller: _model
                                                          .tabBarController,
                                                      onTap: (i) async {
                                                        [
                                                          () async {},
                                                          () async {},
                                                          () async {}
                                                        ][i]();
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TabBarView(
                                                      controller: _model
                                                          .tabBarController,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                AnunciosRecord>>(
                                                          stream:
                                                              queryAnunciosRecord(
                                                            parent: widget
                                                                .refAnunciante,
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
                                                            List<AnunciosRecord>
                                                                containerAnunciosRecordList =
                                                                snapshot.data!;
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (containerAnunciosRecordList
                                                                            .length >
                                                                        0) {
                                                                      return Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final gridListaAnuncio = containerAnunciosRecordList
                                                                              .toList()
                                                                              .take(6)
                                                                              .toList();
                                                                          return GridView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            gridDelegate:
                                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                                              crossAxisCount: 2,
                                                                              crossAxisSpacing: 8.0,
                                                                              mainAxisSpacing: 8.0,
                                                                              childAspectRatio: 1.0,
                                                                            ),
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                gridListaAnuncio.length,
                                                                            itemBuilder:
                                                                                (context, gridListaAnuncioIndex) {
                                                                              final gridListaAnuncioItem = gridListaAnuncio[gridListaAnuncioIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 2.0,
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                  type: PageTransitionType.fade,
                                                                                                  child: FlutterFlowExpandedImageView(
                                                                                                    image: CachedNetworkImage(
                                                                                                      fadeInDuration: Duration(milliseconds: 500),
                                                                                                      fadeOutDuration: Duration(milliseconds: 500),
                                                                                                      imageUrl: gridListaAnuncioItem.fotoAnuncio,
                                                                                                      fit: BoxFit.contain,
                                                                                                    ),
                                                                                                    allowRotation: false,
                                                                                                    tag: gridListaAnuncioItem.fotoAnuncio,
                                                                                                    useHeroAnimation: true,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            child: Hero(
                                                                                              tag: gridListaAnuncioItem.fotoAnuncio,
                                                                                              transitionOnUserGestures: true,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                child: CachedNetworkImage(
                                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                                  imageUrl: gridListaAnuncioItem.fotoAnuncio,
                                                                                                  width: double.infinity,
                                                                                                  height: double.infinity,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if (currentUserReference == anuncianteAnuncianteRecord.anuncianteUser)
                                                                                      Flexible(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return WebViewAware(
                                                                                                        child: AlertDialog(
                                                                                                          title: Text('Ativar esse anúncio?'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                              child: Text('Cancelar'),
                                                                                                            ),
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                              child: Text('Ativar'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (confirmDialogResponse) {
                                                                                                if (containerAnunciosRecordList.where((e) => e.anunciado == true).toList().length != 0) {
                                                                                                  await containerAnunciosRecordList
                                                                                                      .where((e) => valueOrDefault<bool>(
                                                                                                            e.anunciado == true,
                                                                                                            false,
                                                                                                          ))
                                                                                                      .toList()
                                                                                                      .take(6)
                                                                                                      .toList()
                                                                                                      .first
                                                                                                      .reference
                                                                                                      .update(createAnunciosRecordData(
                                                                                                        anunciado: false,
                                                                                                      ));
                                                                                                }

                                                                                                await gridListaAnuncioItem.reference.update(createAnunciosRecordData(
                                                                                                  anunciado: true,
                                                                                                ));
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Status do anúncio atualizado',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              } else {
                                                                                                return;
                                                                                              }
                                                                                            },
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 40.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: gridListaAnuncioItem.anunciado == true ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).gradient2,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  gridListaAnuncioItem.anunciado == true ? 'Ao vivo' : 'Pausado',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    } else {
                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Nenhum anuncio publicado',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              if (anuncianteAnuncianteRecord.aid == valueOrDefault(currentUserDocument?.iDUser, ''))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(50.0, 50.0, 50.0, 0.0),
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Meu primeiro anúncio',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16.0,
                                                                                              ),
                                                                                        ),
                                                                                        FlutterFlowIconButton(
                                                                                          borderColor: Colors.transparent,
                                                                                          borderRadius: 20.0,
                                                                                          borderWidth: 1.0,
                                                                                          buttonSize: 45.0,
                                                                                          icon: Icon(
                                                                                            Icons.add_box,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 28.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            context.pushNamed(
                                                                                              'DashboardAnuncios',
                                                                                              queryParameters: {
                                                                                                'dashboardAnuncios': serializeParam(
                                                                                                  widget.refAnunciante,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ProdutoRecord>>(
                                                            stream:
                                                                queryProdutoRecord(
                                                              parent:
                                                                  anuncianteAnuncianteRecord
                                                                      .reference,
                                                              queryBuilder:
                                                                  (produtoRecord) =>
                                                                      produtoRecord
                                                                          .where(
                                                                'NomeDaCategoria',
                                                                isEqualTo: _model
                                                                    .choiceChipsValue1,
                                                              ),
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
                                                              List<ProdutoRecord>
                                                                  containerProdutoRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            CatalogoRecord>>(
                                                                      stream:
                                                                          queryCatalogoRecord(
                                                                        parent:
                                                                            widget.refAnunciante,
                                                                        limit:
                                                                            3,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<CatalogoRecord>
                                                                            containerCatalogoRecordList =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (containerProdutoRecordList.length > 0) {
                                                                                return Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                                                                          child: FlutterFlowChoiceChips(
                                                                                            options: containerCatalogoRecordList
                                                                                                .map((e) => valueOrDefault<String>(
                                                                                                      e.nomeCategoria,
                                                                                                      '0',
                                                                                                    ))
                                                                                                .toList()
                                                                                                .map((label) => ChipData(label))
                                                                                                .toList(),
                                                                                            onChanged: (val) => setState(() => _model.choiceChipsValue1 = val?.firstOrNull),
                                                                                            selectedChipStyle: ChipStyle(
                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  ),
                                                                                              iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                              iconSize: 18.0,
                                                                                              elevation: 4.0,
                                                                                            ),
                                                                                            unselectedChipStyle: ChipStyle(
                                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                              iconColor: FlutterFlowTheme.of(context).primary,
                                                                                              iconSize: 18.0,
                                                                                              elevation: 0.0,
                                                                                            ),
                                                                                            chipSpacing: 12.0,
                                                                                            rowSpacing: 12.0,
                                                                                            multiselect: false,
                                                                                            initialized: _model.choiceChipsValue1 != null,
                                                                                            alignment: WrapAlignment.start,
                                                                                            controller: _model.choiceChipsValueController1 ??= FormFieldController<List<String>>(
                                                                                              [
                                                                                                containerCatalogoRecordList.first.nomeCategoria
                                                                                              ],
                                                                                            ),
                                                                                            wrapped: true,
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          height: 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final listaProduto = containerProdutoRecordList.toList();
                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                                                                                primary: false,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: listaProduto.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(height: 4.0),
                                                                                                itemBuilder: (context, listaProdutoIndex) {
                                                                                                  final listaProdutoItem = listaProduto[listaProdutoIndex];
                                                                                                  return Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await Navigator.push(
                                                                                                                            context,
                                                                                                                            PageTransition(
                                                                                                                              type: PageTransitionType.fade,
                                                                                                                              child: FlutterFlowExpandedImageView(
                                                                                                                                image: CachedNetworkImage(
                                                                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                                                                  imageUrl: listaProdutoItem.fotoProduto,
                                                                                                                                  fit: BoxFit.contain,
                                                                                                                                ),
                                                                                                                                allowRotation: false,
                                                                                                                                tag: listaProdutoItem.fotoProduto,
                                                                                                                                useHeroAnimation: true,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                        child: Hero(
                                                                                                                          tag: listaProdutoItem.fotoProduto,
                                                                                                                          transitionOnUserGestures: true,
                                                                                                                          child: ClipRRect(
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            child: CachedNetworkImage(
                                                                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                                                                              imageUrl: listaProdutoItem.fotoProduto,
                                                                                                                              width: 70.0,
                                                                                                                              height: 70.0,
                                                                                                                              fit: BoxFit.cover,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    minWidth: 150.0,
                                                                                                                    maxWidth: 180.0,
                                                                                                                  ),
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          listaProdutoItem.nomeProduto,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'R\$ ${listaProdutoItem.valorProduto}',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                          ),
                                                                                                        ],
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
                                                                                );
                                                                              } else if ((containerProdutoRecordList.length < 1) && (containerCatalogoRecordList.length > 0)) {
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                                                                      child: FlutterFlowChoiceChips(
                                                                                        options: containerCatalogoRecordList
                                                                                            .map((e) => valueOrDefault<String>(
                                                                                                  e.nomeCategoria,
                                                                                                  '0',
                                                                                                ))
                                                                                            .toList()
                                                                                            .map((label) => ChipData(label))
                                                                                            .toList(),
                                                                                        onChanged: (val) => setState(() => _model.choiceChipsValue2 = val?.firstOrNull),
                                                                                        selectedChipStyle: ChipStyle(
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          iconSize: 18.0,
                                                                                          elevation: 4.0,
                                                                                        ),
                                                                                        unselectedChipStyle: ChipStyle(
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                          iconColor: FlutterFlowTheme.of(context).primary,
                                                                                          iconSize: 18.0,
                                                                                          elevation: 0.0,
                                                                                        ),
                                                                                        chipSpacing: 12.0,
                                                                                        rowSpacing: 12.0,
                                                                                        multiselect: false,
                                                                                        initialized: _model.choiceChipsValue2 != null,
                                                                                        alignment: WrapAlignment.start,
                                                                                        controller: _model.choiceChipsValueController2 ??= FormFieldController<List<String>>(
                                                                                          [
                                                                                            containerCatalogoRecordList.first.nomeCategoria
                                                                                          ],
                                                                                        ),
                                                                                        wrapped: true,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    'Essa categoria ainda não tem produto disponivel',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            if (anuncianteAnuncianteRecord.aid == valueOrDefault(currentUserDocument?.iDUser, ''))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                                child: AuthUserStreamWidget(
                                                                                                  builder: (context) => Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Adicionar produtos a categoria',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              fontSize: 16.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 20.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 45.0,
                                                                                                        icon: Icon(
                                                                                                          Icons.add_box,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 28.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          context.pushNamed(
                                                                                                            'DashboardCatalogo',
                                                                                                            queryParameters: {
                                                                                                              'dashMenuCatalogo': serializeParam(
                                                                                                                widget.refAnunciante,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              } else {
                                                                                return Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Text(
                                                                                              'O catalogo ainda não esta disponivel',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        if (currentUserReference == anuncianteAnuncianteRecord.anuncianteUser)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(50.0, 50.0, 50.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Adicione seu catalogo ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 16.0,
                                                                                                      ),
                                                                                                ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 20.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 45.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.add_box,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 28.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed(
                                                                                                      'DashboardCatalogo',
                                                                                                      queryParameters: {
                                                                                                        'dashMenuCatalogo': serializeParam(
                                                                                                          widget.refAnunciante,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ComentarioAvalicaoRecord>>(
                                                            stream:
                                                                queryComentarioAvalicaoRecord(
                                                              parent: widget
                                                                  .refAnunciante,
                                                              queryBuilder: (comentarioAvalicaoRecord) =>
                                                                  comentarioAvalicaoRecord.orderBy(
                                                                      'NotaQnt',
                                                                      descending:
                                                                          true),
                                                              limit: 15,
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
                                                              List<ComentarioAvalicaoRecord>
                                                                  comentariosComentarioAvalicaoRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          14.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (comentariosComentarioAvalicaoRecordList.length >
                                                                                0) {
                                                                              return Builder(
                                                                                builder: (context) {
                                                                                  if (anuncianteAnuncianteRecord.aid == valueOrDefault(currentUserDocument?.iDUser, '')) {
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (anuncianteAnuncianteRecord.aid == valueOrDefault(currentUserDocument?.iDUser, ''))
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 3.0,
                                                                                                    color: Color(0x39000000),
                                                                                                    offset: Offset(0.0, 1.0),
                                                                                                  )
                                                                                                ],
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 6.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                      child: Card(
                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.all(2.0),
                                                                                                          child: Container(
                                                                                                            width: 50.0,
                                                                                                            height: 50.0,
                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                            decoration: BoxDecoration(
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                            child: Image.network(
                                                                                                              currentUserPhoto,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 230.0,
                                                                                                          height: 100.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(4.0),
                                                                                                            child: TextFormField(
                                                                                                              controller: _model.newComentarioController1,
                                                                                                              focusNode: _model.newComentarioFocusNode1,
                                                                                                              autofocus: true,
                                                                                                              obscureText: false,
                                                                                                              decoration: InputDecoration(
                                                                                                                hintText: 'Comentar',
                                                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                enabledBorder: UnderlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Color(0x00000000),
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                                    topRight: Radius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                focusedBorder: UnderlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Color(0x00000000),
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                                    topRight: Radius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                errorBorder: UnderlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Color(0x00000000),
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                                    topRight: Radius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                focusedErrorBorder: UnderlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Color(0x00000000),
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    topLeft: Radius.circular(4.0),
                                                                                                                    topRight: Radius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                              maxLines: 5,
                                                                                                              validator: _model.newComentarioController1Validator.asValidator(context),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 240.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                  child: RatingBar.builder(
                                                                                                                    onRatingUpdate: (newValue) => setState(() => _model.ratingBarValue1 = newValue),
                                                                                                                    itemBuilder: (context, index) => Icon(
                                                                                                                      Icons.star_rounded,
                                                                                                                      color: Color(0xFFFFA130),
                                                                                                                    ),
                                                                                                                    direction: Axis.horizontal,
                                                                                                                    initialRating: _model.ratingBarValue1 ??= 3.0,
                                                                                                                    unratedColor: Color(0xFF95A1AC),
                                                                                                                    itemCount: 5,
                                                                                                                    itemSize: 24.0,
                                                                                                                    glowColor: Color(0xFFFFA130),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    await ComentarioAvalicaoRecord.createDoc(widget.refAnunciante!).set(createComentarioAvalicaoRecordData(
                                                                                                                      comentario: _model.newComentarioController1.text,
                                                                                                                      notaIndividual: _model.ratingBarValue1,
                                                                                                                      comentadoPor: currentUserReference,
                                                                                                                      notaQnt: _model.ratingBarValue1?.round(),
                                                                                                                      comentadoNoDIA: getCurrentTimestamp,
                                                                                                                    ));

                                                                                                                    await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                                      notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                                    ));
                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                      SnackBar(
                                                                                                                        content: Text(
                                                                                                                          'Comentario ralizado com sucesso',
                                                                                                                          style: TextStyle(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Text(
                                                                                                                    'Enviar',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Container(
                                                                                          height: 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final listComentario = comentariosComentarioAvalicaoRecordList.toList();
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: listComentario.length,
                                                                                                itemBuilder: (context, listComentarioIndex) {
                                                                                                  final listComentarioItem = listComentario[listComentarioIndex];
                                                                                                  return Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                                    child: StreamBuilder<List<UsersRecord>>(
                                                                                                      stream: queryUsersRecord(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: listComentarioItem.comentadoPor?.id,
                                                                                                        ),
                                                                                                        singleRecord: true,
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
                                                                                                        List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                                        return Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            boxShadow: [
                                                                                                              BoxShadow(
                                                                                                                blurRadius: 4.0,
                                                                                                                color: Color(0x33000000),
                                                                                                                offset: Offset(0.0, 2.0),
                                                                                                              )
                                                                                                            ],
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(4.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            containerUsersRecord!.displayName,
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                            child: RatingBarIndicator(
                                                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                                                Icons.star_rounded,
                                                                                                                                color: Color(0xFFFFA130),
                                                                                                                              ),
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              rating: listComentarioItem.notaQnt.toDouble(),
                                                                                                                              unratedColor: Color(0xFF95A1AC),
                                                                                                                              itemCount: 5,
                                                                                                                              itemSize: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Card(
                                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                        shape: RoundedRectangleBorder(
                                                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsets.all(2.0),
                                                                                                                          child: Container(
                                                                                                                            width: 50.0,
                                                                                                                            height: 50.0,
                                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              shape: BoxShape.circle,
                                                                                                                            ),
                                                                                                                            child: Image.network(
                                                                                                                              containerUsersRecord!.photoUrl,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Text(
                                                                                                                          listComentarioItem.comentario,
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if ((anuncianteAnuncianteRecord.anuncianteUser == currentUserReference) || (currentUserUid == listComentarioItem.comentadoPor?.id))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return WebViewAware(
                                                                                                                                      child: AlertDialog(
                                                                                                                                        title: Text('Deletar comentario'),
                                                                                                                                        content: Text('Você tem certeza que deseja deletar esse comentario?'),
                                                                                                                                        actions: [
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                            child: Text('Cancelar'),
                                                                                                                                          ),
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                            child: Text('Confirmar'),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ) ??
                                                                                                                                false;
                                                                                                                            await listComentarioItem.reference.delete();

                                                                                                                            await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                                              notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                                            ));
                                                                                                                          },
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.trashAlt,
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  } else {
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (comentariosComentarioAvalicaoRecordList.where((e) => e.comentadoPor == currentUserReference).toList().length < 2)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 12.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              height: 35.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Total:',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      comentariosComentarioAvalicaoRecordList.length.toString(),
                                                                                                                      '0',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Inter',
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return WebViewAware(
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: NovoComentarioWidget(
                                                                                                                    anuncianteRef: widget.refAnunciante!,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 120.0,
                                                                                                          height: 35.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Comentar',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Icon(
                                                                                                                Icons.send_rounded,
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                size: 28.0,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 2.0,
                                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        Container(
                                                                                          height: 500.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final listComentario = comentariosComentarioAvalicaoRecordList.toList();
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: listComentario.length,
                                                                                                itemBuilder: (context, listComentarioIndex) {
                                                                                                  final listComentarioItem = listComentario[listComentarioIndex];
                                                                                                  return Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                                    child: StreamBuilder<List<UsersRecord>>(
                                                                                                      stream: queryUsersRecord(
                                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                                          'uid',
                                                                                                          isEqualTo: listComentarioItem.comentadoPor?.id,
                                                                                                        ),
                                                                                                        singleRecord: true,
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
                                                                                                        List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                                        return Container(
                                                                                                          width: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            boxShadow: [
                                                                                                              BoxShadow(
                                                                                                                blurRadius: 4.0,
                                                                                                                color: Color(0x33000000),
                                                                                                                offset: Offset(0.0, 2.0),
                                                                                                              )
                                                                                                            ],
                                                                                                            borderRadius: BorderRadius.circular(16.0),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(4.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            containerUsersRecord!.displayName,
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                                          ),
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                                            child: RatingBarIndicator(
                                                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                                                Icons.star_rounded,
                                                                                                                                color: Color(0xFFFFA130),
                                                                                                                              ),
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              rating: listComentarioItem.notaQnt.toDouble(),
                                                                                                                              unratedColor: Color(0xFF95A1AC),
                                                                                                                              itemCount: 5,
                                                                                                                              itemSize: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Card(
                                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                        shape: RoundedRectangleBorder(
                                                                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsets.all(2.0),
                                                                                                                          child: Container(
                                                                                                                            width: 50.0,
                                                                                                                            height: 50.0,
                                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              shape: BoxShape.circle,
                                                                                                                            ),
                                                                                                                            child: Image.network(
                                                                                                                              containerUsersRecord!.photoUrl,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Text(
                                                                                                                          listComentarioItem.comentario,
                                                                                                                          style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                if ((anuncianteAnuncianteRecord.anuncianteUser == currentUserReference) || (currentUserUid == listComentarioItem.comentadoPor?.id))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              await showModalBottomSheet(
                                                                                                                                isScrollControlled: true,
                                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                                enableDrag: false,
                                                                                                                                context: context,
                                                                                                                                builder: (context) {
                                                                                                                                  return WebViewAware(
                                                                                                                                    child: Padding(
                                                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                      child: EditarComentarioWidget(
                                                                                                                                        comentarioRef: listComentarioItem.reference,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ).then((value) => safeSetState(() {}));
                                                                                                                            },
                                                                                                                            child: Icon(
                                                                                                                              FFIcons.kpencil,
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return WebViewAware(
                                                                                                                                      child: AlertDialog(
                                                                                                                                        title: Text('Deletar comentario'),
                                                                                                                                        content: Text('Você tem certeza que deseja deletar esse comentario?'),
                                                                                                                                        actions: [
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                            child: Text('Cancelar'),
                                                                                                                                          ),
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                            child: Text('Confirmar'),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ) ??
                                                                                                                                false;
                                                                                                                            await listComentarioItem.reference.delete();

                                                                                                                            await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                                              notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                                            ));
                                                                                                                          },
                                                                                                                          child: FaIcon(
                                                                                                                            FontAwesomeIcons.trashAlt,
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  }
                                                                                },
                                                                              );
                                                                            } else {
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (anuncianteAnuncianteRecord.aid != valueOrDefault(currentUserDocument?.iDUser, ''))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 12.0),
                                                                                      child: AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          height: 35.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Total:',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  comentariosComentarioAvalicaoRecordList.length.toString(),
                                                                                                                  '0',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      if (loggedIn == true) {
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return WebViewAware(
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: NovoComentarioWidget(
                                                                                                                  anuncianteRef: widget.refAnunciante!,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      } else {
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return WebViewAware(
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                                                  usoExclusivo: true,
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      }
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 120.0,
                                                                                                      height: 35.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                            child: Text(
                                                                                                              'Comentar',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          FaIcon(
                                                                                                            FontAwesomeIcons.commentDots,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 2.0,
                                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if (comentariosComentarioAvalicaoRecordList.length < 1)
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
                                                                                      child: Text(
                                                                                        currentUserReference == anuncianteAnuncianteRecord.anuncianteUser ? 'Você ainda não possui comentários' : 'Esse estabelecimento ainda não possui comentarios, seja o primeiro',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              );
                                                                            }
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      48.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  anuncianteAnuncianteRecord
                                                                      .logo,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  anuncianteAnuncianteRecord
                                                      .nomeFantasia,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 22.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 16.0,
                                                          ),
                                                          SelectionArea(
                                                              child: Text(
                                                            formatNumber(
                                                              anuncianteAnuncianteRecord
                                                                  .notaMedia,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '0.0',
                                                              locale: 'br',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          )),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        anuncianteAnuncianteRecord
                                                            .categoria,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 24.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    height: 48.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFA3A2A2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            anuncianteAnuncianteRecord
                                                                .whatsComercial,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.mapPin,
                                                    color: Color(0xFFA3A2A2),
                                                    size: 16.0,
                                                  ),
                                                  Text(
                                                    anuncianteAnuncianteRecord
                                                        .enderecoCompleto,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child:
                                          StreamBuilder<List<AnunciosRecord>>(
                                        stream: queryAnunciosRecord(),
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
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (containerAnunciosRecordList
                                                        .where((e) =>
                                                            e.categoria ==
                                                            anuncianteAnuncianteRecord
                                                                .categoria)
                                                        .toList()
                                                        .length >=
                                                    1)
                                                  Text(
                                                    'Os mais bem avaliado dessa Categoria',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    final concorrentes =
                                                        containerAnunciosRecordList
                                                            .where((e) =>
                                                                e.categoria ==
                                                                anuncianteAnuncianteRecord
                                                                    .categoria)
                                                            .toList()
                                                            .take(6)
                                                            .toList();
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            concorrentes.length,
                                                            (concorrentesIndex) {
                                                          final concorrentesItem =
                                                              concorrentes[
                                                                  concorrentesIndex];
                                                          return StreamBuilder<
                                                              AnuncianteRecord>(
                                                            stream: AnuncianteRecord
                                                                .getDocument(
                                                                    concorrentesItem
                                                                        .parentReference),
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
                                                              final containerAnuncianteRecord =
                                                                  snapshot
                                                                      .data!;
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
                                                                        concorrentesItem
                                                                            .parentReference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      0.5,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        164.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    containerAnuncianteRecord.logo,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    containerAnuncianteRecord.nomeFantasia,
                                                                                    style: FlutterFlowTheme.of(context).bodySmall,
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_outward,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              164.0,
                                                                          height:
                                                                              192.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              concorrentesItem.fotoAnuncio,
                                                                              width: 300.0,
                                                                              height: 200.0,
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
                                                        }).divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: StreamBuilder<
                                          List<ComentarioAvalicaoRecord>>(
                                        stream: queryComentarioAvalicaoRecord(
                                          parent: widget.refAnunciante,
                                          queryBuilder:
                                              (comentarioAvalicaoRecord) =>
                                                  comentarioAvalicaoRecord
                                                      .orderBy('NotaQnt',
                                                          descending: true),
                                          limit: 15,
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
                                          List<ComentarioAvalicaoRecord>
                                              comentariosComentarioAvalicaoRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 14.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (comentariosComentarioAvalicaoRecordList
                                                                .length >
                                                            0) {
                                                          return Builder(
                                                            builder: (context) {
                                                              if (anuncianteAnuncianteRecord
                                                                      .anuncianteUser ==
                                                                  currentUserReference) {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (anuncianteAnuncianteRecord
                                                                            .anuncianteUser !=
                                                                        currentUserReference)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x39000000),
                                                                                offset: Offset(0.0, 1.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                6.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(2.0),
                                                                                      child: AuthUserStreamWidget(
                                                                                        builder: (context) => Container(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.network(
                                                                                            currentUserPhoto,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 230.0,
                                                                                      height: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: TextFormField(
                                                                                          controller: _model.newComentarioController2,
                                                                                          focusNode: _model.newComentarioFocusNode2,
                                                                                          autofocus: true,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: 'Comentar',
                                                                                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                                            enabledBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            focusedBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            errorBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                            focusedErrorBorder: UnderlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                topLeft: Radius.circular(4.0),
                                                                                                topRight: Radius.circular(4.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          maxLines: 5,
                                                                                          validator: _model.newComentarioController2Validator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 240.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                              child: RatingBar.builder(
                                                                                                onRatingUpdate: (newValue) => setState(() => _model.ratingBarValue4 = newValue),
                                                                                                itemBuilder: (context, index) => Icon(
                                                                                                  Icons.star_rounded,
                                                                                                  color: Color(0xFFFFA130),
                                                                                                ),
                                                                                                direction: Axis.horizontal,
                                                                                                initialRating: _model.ratingBarValue4 ??= 3.0,
                                                                                                unratedColor: Color(0xFF95A1AC),
                                                                                                itemCount: 5,
                                                                                                itemSize: 24.0,
                                                                                                glowColor: Color(0xFFFFA130),
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await ComentarioAvalicaoRecord.createDoc(widget.refAnunciante!).set(createComentarioAvalicaoRecordData(
                                                                                                  comentario: _model.newComentarioController2.text,
                                                                                                  notaIndividual: _model.ratingBarValue4,
                                                                                                  comentadoPor: currentUserReference,
                                                                                                  notaQnt: _model.ratingBarValue4?.round(),
                                                                                                  comentadoNoDIA: getCurrentTimestamp,
                                                                                                ));

                                                                                                await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                  notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                ));
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Comentario ralizado com sucesso',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              child: Text(
                                                                                                'Enviar',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Container(
                                                                      height:
                                                                          500.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final listComentario =
                                                                              comentariosComentarioAvalicaoRecordList.toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listComentario.length,
                                                                            itemBuilder:
                                                                                (context, listComentarioIndex) {
                                                                              final listComentarioItem = listComentario[listComentarioIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                child: StreamBuilder<List<UsersRecord>>(
                                                                                  stream: queryUsersRecord(
                                                                                    queryBuilder: (usersRecord) => usersRecord.where(
                                                                                      'uid',
                                                                                      isEqualTo: listComentarioItem.comentadoPor?.id,
                                                                                    ),
                                                                                    singleRecord: true,
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
                                                                                    List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                    // Return an empty Container when the item does not exist.
                                                                                    if (snapshot.data!.isEmpty) {
                                                                                      return Container();
                                                                                    }
                                                                                    final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        containerUsersRecord!.displayName,
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                        child: RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: Color(0xFFFFA130),
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: listComentarioItem.notaQnt.toDouble(),
                                                                                                          unratedColor: Color(0xFF95A1AC),
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Card(
                                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsets.all(2.0),
                                                                                                      child: Container(
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                        decoration: BoxDecoration(
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Image.network(
                                                                                                          containerUsersRecord!.photoUrl,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      listComentarioItem.comentario,
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            if ((anuncianteAnuncianteRecord.anuncianteUser == currentUserReference) || (currentUserUid == listComentarioItem.comentadoPor?.id))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    title: Text('Deletar comentario'),
                                                                                                                    content: Text('Você tem certeza que deseja deletar esse comentario?'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                        child: Text('Cancelar'),
                                                                                                                      ),
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                        child: Text('Confirmar'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ) ??
                                                                                                            false;
                                                                                                        await listComentarioItem.reference.delete();

                                                                                                        await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                          notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                        ));
                                                                                                      },
                                                                                                      child: FaIcon(
                                                                                                        FontAwesomeIcons.trashAlt,
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              } else {
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (comentariosComentarioAvalicaoRecordList
                                                                            .where((e) =>
                                                                                e.comentadoPor ==
                                                                                currentUserReference)
                                                                            .toList()
                                                                            .length <
                                                                        2)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            12.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Total:',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  comentariosComentarioAvalicaoRecordList.length.toString(),
                                                                                                  '0',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: NovoComentarioWidget(
                                                                                                anuncianteRef: widget.refAnunciante!,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 120.0,
                                                                                      height: 35.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                            child: Text(
                                                                                              'Comentar',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.send_rounded,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 28.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Divider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).accent3,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Container(
                                                                      height:
                                                                          500.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final listComentario =
                                                                              comentariosComentarioAvalicaoRecordList.toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listComentario.length,
                                                                            itemBuilder:
                                                                                (context, listComentarioIndex) {
                                                                              final listComentarioItem = listComentario[listComentarioIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                child: StreamBuilder<List<UsersRecord>>(
                                                                                  stream: queryUsersRecord(
                                                                                    queryBuilder: (usersRecord) => usersRecord.where(
                                                                                      'uid',
                                                                                      isEqualTo: listComentarioItem.comentadoPor?.id,
                                                                                    ),
                                                                                    singleRecord: true,
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
                                                                                    List<UsersRecord> containerUsersRecordList = snapshot.data!;
                                                                                    // Return an empty Container when the item does not exist.
                                                                                    if (snapshot.data!.isEmpty) {
                                                                                      return Container();
                                                                                    }
                                                                                    final containerUsersRecord = containerUsersRecordList.isNotEmpty ? containerUsersRecordList.first : null;
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        containerUsersRecord!.displayName,
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium,
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                                        child: RatingBarIndicator(
                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                            Icons.star_rounded,
                                                                                                            color: Color(0xFFFFA130),
                                                                                                          ),
                                                                                                          direction: Axis.horizontal,
                                                                                                          rating: listComentarioItem.notaQnt.toDouble(),
                                                                                                          unratedColor: Color(0xFF95A1AC),
                                                                                                          itemCount: 5,
                                                                                                          itemSize: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Card(
                                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsets.all(2.0),
                                                                                                      child: Container(
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        clipBehavior: Clip.antiAlias,
                                                                                                        decoration: BoxDecoration(
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Image.network(
                                                                                                          containerUsersRecord!.photoUrl,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Text(
                                                                                                      listComentarioItem.comentario,
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            if ((anuncianteAnuncianteRecord.anuncianteUser == currentUserReference) || (currentUserUid == listComentarioItem.comentadoPor?.id))
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return WebViewAware(
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: EditarComentarioWidget(
                                                                                                                    comentarioRef: listComentarioItem.reference,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          FFIcons.kpencil,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    title: Text('Deletar comentario'),
                                                                                                                    content: Text('Você tem certeza que deseja deletar esse comentario?'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                        child: Text('Cancelar'),
                                                                                                                      ),
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                        child: Text('Confirmar'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ) ??
                                                                                                            false;
                                                                                                        await listComentarioItem.reference.delete();

                                                                                                        await widget.refAnunciante!.update(createAnuncianteRecordData(
                                                                                                          notaMedia: functions.getAverageRating(comentariosComentarioAvalicaoRecordList.map((e) => e.notaQnt).toList()),
                                                                                                        ));
                                                                                                      },
                                                                                                      child: FaIcon(
                                                                                                        FontAwesomeIcons.trashAlt,
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          );
                                                        } else {
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (currentUserReference !=
                                                                  anuncianteAnuncianteRecord
                                                                      .anuncianteUser)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                          child: Text(
                                                                                            'Total:',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            comentariosComentarioAvalicaoRecordList.length.toString(),
                                                                                            '0',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (loggedIn == true) {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: NovoComentarioWidget(
                                                                                            anuncianteRef: widget.refAnunciante!,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                } else {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: UsarDeslogadoUsoExclusivoCompWidget(
                                                                                            usoExclusivo: true,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                width: 120.0,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                      child: Text(
                                                                                        'Comentar',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    FaIcon(
                                                                                      FontAwesomeIcons.commentDots,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              2.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (comentariosComentarioAvalicaoRecordList
                                                                      .length <
                                                                  1)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          50.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    currentUserReference ==
                                                                            anuncianteAnuncianteRecord.anuncianteUser
                                                                        ? 'Você ainda não possui comentários'
                                                                        : 'Esse estabelecimento ainda não possui comentarios, seja o primeiro',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                            ],
                                                          );
                                                        }
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
                                  ].divide(SizedBox(height: 24.0)),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
