import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/menu_profile_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meuperfil_model.dart';
export 'meuperfil_model.dart';

class MeuperfilWidget extends StatefulWidget {
  const MeuperfilWidget({super.key});

  @override
  State<MeuperfilWidget> createState() => _MeuperfilWidgetState();
}

class _MeuperfilWidgetState extends State<MeuperfilWidget> {
  late MeuperfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeuperfilModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'meuperfil'});
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

    return Title(
        title: 'meuperfil',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                ),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).cinzaEscuro,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'MEUPERFIL_arrow_back_ios_rounded_ICN_ON_');
                    context.pop();
                  },
                ),
              ),
              title: Text(
                'Meu perfil',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Em breve o clube',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Clube cheio de vantagens vem aí',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 8.0))
                                              .around(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(
                                        () => _model.mouseRegionHovered = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered = false);
                                  }),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MEUPERFIL_PAGE_Container_b6fr7tin_ON_TAP');
                                    if (valueOrDefault(
                                            currentUserDocument?.perfil, '') ==
                                        PerfilUsuario.Anunciante.name) {
                                      context.pushNamed(
                                        'AnunciantePerfil',
                                        queryParameters: {
                                          'referenciaAnunciante':
                                              serializeParam(
                                            FFAppState().anunciante.ref,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed('NovoAnunciante');
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuProfileModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuProfileWidget(
                                      title: 'Meu negócio',
                                      icon: Icon(
                                        FFIcons.kresgatar,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.menuProfileModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MenuProfileWidget(
                                    title: 'Meus dados',
                                    icon: Icon(
                                      FFIcons.keditarUsuario,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.menuProfileModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MenuProfileWidget(
                                    title: 'Fale com meencontra',
                                    icon: Icon(
                                      FFIcons.kfone,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MEUPERFIL_PAGE_Container_gczbtd7o_ON_TAP');
                                    await launchURL(
                                        '${FFAppConstants.whatsapp}${FFAppConstants.WhatsSuporte}');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuProfileModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuProfileWidget(
                                      title: 'Anúncie seu negócio',
                                      icon: Icon(
                                        FFIcons.kanuncios,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                    logFirebaseEvent(
                                        'MEUPERFIL_PAGE_Container_05gnartc_ON_TAP');

                                    context.pushNamed('DashAnuncianteSuporte');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuProfileModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuProfileWidget(
                                      title: 'Suporte',
                                      icon: Icon(
                                        FFIcons.ksuporte,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                    logFirebaseEvent(
                                        'MEUPERFIL_PAGE_Container_flt76w8u_ON_TAP');

                                    context.goNamed('configuracoes');
                                  },
                                  child: wrapWithModel(
                                    model: _model.menuProfileModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MenuProfileWidget(
                                      title: 'Configurações',
                                      icon: Icon(
                                        FFIcons.kconfiguracaoSettingROUND,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.navbarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NavbarWidget(
                                paginaAtual: TelasMenuDrawer.perfil,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)).around(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ));
  }
}
