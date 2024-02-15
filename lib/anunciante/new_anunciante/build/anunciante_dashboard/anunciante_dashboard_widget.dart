import '/anunciante/new_anunciante/build/selecinar_capa/selecinar_capa_widget.dart';
import '/anunciante/new_anunciante/build/templete_anunciante/templete_anunciante_widget.dart';
import '/anunciante/new_anunciante/build/upgrade/upgrade_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/anunciante/new_componentes/popup_excluir_capa/popup_excluir_capa_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/estrela_bloqueio_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'anunciante_dashboard_model.dart';
export 'anunciante_dashboard_model.dart';

class AnuncianteDashboardWidget extends StatefulWidget {
  const AnuncianteDashboardWidget({
    super.key,
    required this.documentoRefAnunciante,
  });

  final AnuncianteRecord? documentoRefAnunciante;

  @override
  State<AnuncianteDashboardWidget> createState() =>
      _AnuncianteDashboardWidgetState();
}

class _AnuncianteDashboardWidgetState extends State<AnuncianteDashboardWidget>
    with TickerProviderStateMixin {
  late AnuncianteDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnuncianteDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().corSelecionadaAnunciante = valueOrDefault<Color>(
          widget.documentoRefAnunciante?.cor,
          FlutterFlowTheme.of(context).primary,
        );
        FFAppState().templeteLayoutSelecionado =
            widget.documentoRefAnunciante?.templeteLayout != null &&
                    widget.documentoRefAnunciante?.templeteLayout != ''
                ? widget.documentoRefAnunciante!.templeteLayout
                : 'Padrao';
      });
      setState(() {
        _model.mostrarPerfil = true;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.cnpjLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.cnpjRg,
      'CNPJ',
    ));
    _model.cnpjLojaFocusNode ??= FocusNode();

    _model.nomeLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.nomeFantasia,
      'Nome Fantasia',
    ));
    _model.nomeLojaFocusNode ??= FocusNode();

    _model.descricaoLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.descricao,
      'Descrição',
    ));
    _model.descricaoLojaFocusNode ??= FocusNode();

    _model.enderecoCompletoController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.enderecoCompleto,
      'Endereço',
    ));
    _model.enderecoCompletoFocusNode ??= FocusNode();

    _model.cidadeEndLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.cidade,
      'Guaíba',
    ));
    _model.cidadeEndLojaFocusNode ??= FocusNode();

    _model.whatsapController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.whatsComercial,
      '51999998888',
    ));
    _model.whatsapFocusNode ??= FocusNode();

    _model.telefoneLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.telefoneFixo,
      'Telefone fixo',
    ));
    _model.telefoneLojaFocusNode ??= FocusNode();

    _model.instagramLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.instagram,
      'Instagram',
    ));
    _model.instagramLojaFocusNode ??= FocusNode();

    _model.facebookLojaController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.documentoRefAnunciante?.facebook,
      'Facebook',
    ));
    _model.facebookLojaFocusNode ??= FocusNode();

    _model.siteLojaController ??=
        TextEditingController(text: widget.documentoRefAnunciante?.site);
    _model.siteLojaFocusNode ??= FocusNode();

    _model.emailLojaController ??= TextEditingController(
        text: widget.documentoRefAnunciante?.emailComercial);
    _model.emailLojaFocusNode ??= FocusNode();

    _model.responsavelNomeCompletoLojaController ??= TextEditingController();
    _model.responsavelNomeCompletoLojaFocusNode ??= FocusNode();

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<List<CarrinhoDeComprasUsuarioRecord>>(
      future: queryCarrinhoDeComprasUsuarioRecordOnce(
        parent: currentUserReference,
        queryBuilder: (carrinhoDeComprasUsuarioRecord) =>
            carrinhoDeComprasUsuarioRecord.where(
          'anuncianteRef',
          isEqualTo: widget.documentoRefAnunciante?.reference,
        ),
        singleRecord: true,
      ),
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
        List<CarrinhoDeComprasUsuarioRecord>
            anuncianteDashboardCarrinhoDeComprasUsuarioRecordList =
            snapshot.data!;
        final anuncianteDashboardCarrinhoDeComprasUsuarioRecord =
            anuncianteDashboardCarrinhoDeComprasUsuarioRecordList.isNotEmpty
                ? anuncianteDashboardCarrinhoDeComprasUsuarioRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.newDashAnuncianteModel2,
                        updateCallback: () => setState(() {}),
                        child: NewDashAnuncianteWidget(
                          paginaAtual: 'meuNegocio',
                          anuncianteDoc: widget.documentoRefAnunciante!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            endDrawer: Container(
              width: 400.0,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56.0),
                              ),
                              child: Container(
                                width: 398.0,
                                height: 852.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(56.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 12.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(60.0),
                                                topRight: Radius.circular(60.0),
                                              ),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(60.0),
                                                  topRight:
                                                      Radius.circular(60.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              'Hm',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '18:45',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .signal_cellular_alt_rounded,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                          Icon(
                                                            Icons.wifi_rounded,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .batteryFull,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        height: 740.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(56.0),
                                            bottomRight: Radius.circular(56.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 0.0, 1.0, 4.0),
                                          child: wrapWithModel(
                                            model:
                                                _model.templeteAnuncianteModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: TempleteAnuncianteWidget(
                                              documentoAnunciante: widget
                                                  .documentoRefAnunciante!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(60.0),
                                                bottomRight:
                                                    Radius.circular(60.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 100.0,
                                                    height: 10.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                          FlutterFlowIconButton(
                            borderColor: valueOrDefault<Color>(
                              widget.documentoRefAnunciante?.cor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              Icons.close_rounded,
                              color: valueOrDefault<Color>(
                                widget.documentoRefAnunciante?.cor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                        child: wrapWithModel(
                          model: _model.newDashAnuncianteModel1,
                          updateCallback: () => setState(() {}),
                          child: NewDashAnuncianteWidget(
                            paginaAtual: 'meuNegocio',
                            anuncianteDoc: widget.documentoRefAnunciante!,
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                    ))
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(4.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              child: Icon(
                                                Icons.menu_rounded,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .corSelecionadaAnunciante,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                size: 32.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Editar meu negócio',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
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
                                      16.0, 16.0, 16.0, 12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 1.5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x2C000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                        .corSelecionadaAnunciante,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      widget
                                                          .documentoRefAnunciante!
                                                          .capa,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              buttonSize: 40.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              icon: Icon(
                                                                FFIcons
                                                                    .ktrashOutline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              PopupExcluirCapaWidget(
                                                                            excluircapa:
                                                                                widget.documentoRefAnunciante!,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
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
                                                                if (widget
                                                                        .documentoRefAnunciante
                                                                        ?.planoAssinatura !=
                                                                    'gratis') {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    useSafeArea:
                                                                        true,
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
                                                                                SelecinarCapaWidget(
                                                                              adicionarCapa: widget.documentoRefAnunciante!,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
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
                                                                                UpgradeWidget(
                                                                              mensagemMenu: 'meuNegocio',
                                                                              anunciantedoc: widget.documentoRefAnunciante!,
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
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          '${widget.documentoRefAnunciante?.capa != null && widget.documentoRefAnunciante?.capa != '' ? 'Alterar ' : 'Carregar '} imagem de capa',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .estrelaBloqueioModel1,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          EstrelaBloqueioWidget(
                                                                        planoGratis: widget
                                                                            .documentoRefAnunciante!
                                                                            .planoAssinatura,
                                                                        tamanho:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 8.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 1.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          widget
                                                                              .documentoRefAnunciante
                                                                              ?.logo,
                                                                          'logo',
                                                                        ),
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .documentoRefAnunciante
                                                                          ?.nomeFantasia,
                                                                      'Nome Fantasia',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'textOnPageLoadAnimation1']!),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget
                                                                            .documentoRefAnunciante
                                                                            ?.enderecoCompleto,
                                                                        'Rua São José, nº 73, Centro',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall,
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['textOnPageLoadAnimation2']!),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    if ((widget.documentoRefAnunciante
                                                                ?.planoAssinatura !=
                                                            'gratis') &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ))
                                                      Flexible(
                                                        flex: 2,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
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
                                                              scaffoldKey
                                                                  .currentState!
                                                                  .openEndDrawer();
                                                            },
                                                            child: Material(
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
                                                                width: 300.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .corSelecionadaAnunciante,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model.mostrarPerfil ==
                                                                              false)
                                                                            Icon(
                                                                              Icons.open_in_full,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          if (_model.mostrarPerfil ==
                                                                              true)
                                                                            Icon(
                                                                              Icons.close_fullscreen,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        '${_model.mostrarPerfil == true ? 'Esconder' : 'Mostrar'} meu negócio',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              if ((widget.documentoRefAnunciante
                                                          ?.planoAssinatura !=
                                                      'gratis') &&
                                                  responsiveVisibility(
                                                    context: context,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      scaffoldKey.currentState!
                                                          .openEndDrawer();
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                .corSelecionadaAnunciante,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      12.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (_model
                                                                          .mostrarPerfil ==
                                                                      false)
                                                                    Icon(
                                                                      Icons
                                                                          .open_in_full,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  if (_model
                                                                          .mostrarPerfil ==
                                                                      true)
                                                                    Icon(
                                                                      Icons
                                                                          .close_fullscreen,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                'Mostrar prévia do meu negócio',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                          Divider(
                                            height: 24.0,
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cadastrada em',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointSmall) {
                                                            return 12.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium) {
                                                            return 14.0;
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointLarge) {
                                                            return 16.0;
                                                          } else {
                                                            return 12.0;
                                                          }
                                                        }(),
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          'yMMMd',
                                                          widget
                                                              .documentoRefAnunciante
                                                              ?.contaCriada,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  FFAppState()
                                                                      .corSelecionadaAnunciante,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                fontSize: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 12.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 14.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 16.0;
                                                                  } else {
                                                                    return 12.0;
                                                                  }
                                                                }(),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0x2404A24C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                8.0, 4.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget
                                                            .documentoRefAnunciante
                                                            ?.planoAssinatura,
                                                        'gratis',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xFF04A24C),
                                                                fontSize: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 12.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 14.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointLarge) {
                                                                    return 16.0;
                                                                  } else {
                                                                    return 12.0;
                                                                  }
                                                                }(),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                ),
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: FlutterFlowButtonTabBar(
                                          useToggleButtonStyle: false,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    fontSize: 14.0,
                                                  ),
                                          unselectedLabelStyle: TextStyle(),
                                          labelColor: Colors.white,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent2,
                                          backgroundColor:
                                              valueOrDefault<Color>(
                                            FFAppState()
                                                .corSelecionadaAnunciante,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderColor: valueOrDefault<Color>(
                                            FFAppState()
                                                .corSelecionadaAnunciante,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          elevation: 0.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          buttonMargin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          padding: EdgeInsets.all(4.0),
                                          tabs: [
                                            Tab(
                                              text: ' Perfil',
                                              icon: Icon(
                                                FFIcons.kshop,
                                                size: 24.0,
                                              ),
                                              iconMargin: EdgeInsets.all(4.0),
                                            ),
                                            Tab(
                                              text: ' Contato',
                                              icon: Icon(
                                                Icons.phone_sharp,
                                                size: 24.0,
                                              ),
                                              iconMargin: EdgeInsets.all(4.0),
                                            ),
                                            Tab(
                                              text: ' Administradores',
                                              icon: Icon(
                                                Icons.people_alt,
                                                size: 24.0,
                                              ),
                                              iconMargin: EdgeInsets.all(4.0),
                                            ),
                                          ],
                                          controller: _model.tabBarController,
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
                                          controller: _model.tabBarController,
                                          children: [
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 5.0,
                                                                color: Color(
                                                                    0x34111417),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Pressione para salvar e ver o resultado',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Text(
                                                                    'Escolha um modelo para seu perfil',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              22.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    controller: _model
                                                                            .dropDownTemplateValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model
                                                                          .dropDownTemplateValue ??= widget.documentoRefAnunciante?.templeteLayout != null &&
                                                                              widget.documentoRefAnunciante?.templeteLayout !=
                                                                                  ''
                                                                          ? widget
                                                                              .documentoRefAnunciante
                                                                              ?.templeteLayout
                                                                          : 'Padrão',
                                                                    ),
                                                                    options: [
                                                                      'Padrão',
                                                                      'E-comerce',
                                                                      'Delivery',
                                                                      'Agencia',
                                                                      'Profissional'
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        setState(() =>
                                                                            _model.dropDownTemplateValue =
                                                                                val),
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        50.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    hintText:
                                                                        'Modelos',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .corSelecionadaAnunciante,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        valueOrDefault<
                                                                            Color>(
                                                                      FFAppState()
                                                                          .corSelecionadaAnunciante,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled: widget
                                                                            .documentoRefAnunciante
                                                                            ?.planoAssinatura ==
                                                                        'gratis',
                                                                    isOverButton:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Text(
                                                                    'Cor principal para o seu catálogo',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              22.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Wrap(
                                                                      spacing:
                                                                          12.0,
                                                                      runSpacing:
                                                                          12.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
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
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Cor atual selecionada',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                5.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 68.0,
                                                                              height: 68.0,
                                                                              decoration: BoxDecoration(
                                                                                color: valueOrDefault<Color>(
                                                                                  widget.documentoRefAnunciante?.cor,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(0.0),
                                                                                  topRight: Radius.circular(0.0),
                                                                                ),
                                                                                shape: BoxShape.rectangle,
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(2.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.check_rounded,
                                                                                    color: Colors.white,
                                                                                    size: 32.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              4.0,
                                                                          height:
                                                                              68.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = FlutterFlowTheme.of(context).primary;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == FlutterFlowTheme.of(context).primary,
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFFFDCA40);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFDCA40),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFFFDCA40),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFFFF8552);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFF8552),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFFFF8552),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFFFF4E4E);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFF4E4E),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFFFF4E4E),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFFD7A3BD);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFCE7DA5),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFFD7A3BD),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFF89BBFE);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF89BBFE),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFF89BBFE),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFF0D3B66);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF0D3B66),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFF0D3B66),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFF444E5E);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF444E5E),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFF444E5E),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFF2D2D2A);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF2D2D2A),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFF2D2D2A),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.corSelecionada = Color(0xFF82D173);
                                                                            });
                                                                          },
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              width: 60.0,
                                                                              height: 60.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF82D173),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: _model.corSelecionada == Color(0xFF82D173),
                                                                                child: Icon(
                                                                                  Icons.check_rounded,
                                                                                  color: Colors.white,
                                                                                  size: 32.0,
                                                                                ),
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
                                                                          16.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (widget.documentoRefAnunciante?.planoAssinatura != 'gratis') {
                                                                                await widget.documentoRefAnunciante!.reference.update(createAnuncianteRecordData(
                                                                                  cor: _model.corSelecionada,
                                                                                  templeteLayout: _model.dropDownTemplateValue,
                                                                                ));
                                                                                setState(() {
                                                                                  FFAppState().corSelecionadaAnunciante = _model.corSelecionada!;
                                                                                  FFAppState().templeteLayoutSelecionado = _model.dropDownTemplateValue!;
                                                                                });
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Alterado com sucesso',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                await Future.delayed(const Duration(milliseconds: 1500));
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
                                                                                          child: UpgradeWidget(
                                                                                            mensagemMenu: 'meuNegocio',
                                                                                            anunciantedoc: widget.documentoRefAnunciante!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));

                                                                                return;
                                                                              }
                                                                            },
                                                                            text:
                                                                                'Salvar',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 170.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().corSelecionadaAnunciante,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                              elevation: 2.0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            wrapWithModel(
                                                                          model:
                                                                              _model.estrelaBloqueioModel2,
                                                                          updateCallback: () =>
                                                                              setState(() {}),
                                                                          child:
                                                                              EstrelaBloqueioWidget(
                                                                            planoGratis:
                                                                                widget.documentoRefAnunciante!.planoAssinatura,
                                                                            tamanho:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'containerOnPageLoadAnimation2']!),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .estrelaBloqueioModel3,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              EstrelaBloqueioWidget(
                                                            planoGratis: widget
                                                                .documentoRefAnunciante!
                                                                .planoAssinatura,
                                                            tamanho: 2,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Logo da loja',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (_model.uploadedFileUrl !=
                                                                    null &&
                                                                _model.uploadedFileUrl !=
                                                                    '')
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        children: [
                                                                          Card(
                                                                            clipBehavior:
                                                                                Clip.antiAliasWithSaveLayer,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              child: Image.network(
                                                                                _model.uploadedFileUrl,
                                                                                width: 150.0,
                                                                                height: 150.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 20.0,
                                                                                buttonSize: 40.0,
                                                                                icon: Icon(
                                                                                  Icons.close_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  size: 24.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  setState(() {
                                                                                    _model.isDataUploading = false;
                                                                                    _model.uploadedLocalFile = FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                                    _model.uploadedFileUrl = '';
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            if (_model.uploadedFileUrl ==
                                                                    null ||
                                                                _model.uploadedFileUrl ==
                                                                    '')
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x127367F0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .corSelecionadaAnunciante,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            12.0,
                                                                            16.0,
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .cloud_upload_outlined,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().corSelecionadaAnunciante,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          size:
                                                                              44.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'Carregue sua logo',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              12.0),
                                                                          child:
                                                                              Text(
                                                                            'Suporta PNG, JPG e JPEG',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            final selectedMedia =
                                                                                await selectMediaWithSourceBottomSheet(
                                                                              context: context,
                                                                              maxWidth: 1020.00,
                                                                              maxHeight: 1020.00,
                                                                              allowPhoto: true,
                                                                              textColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              pickerFontFamily: 'Inter',
                                                                            );
                                                                            if (selectedMedia != null &&
                                                                                selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                              setState(() => _model.isDataUploading = true);
                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                              var downloadUrls = <String>[];
                                                                              try {
                                                                                selectedUploadedFiles = selectedMedia
                                                                                    .map((m) => FFUploadedFile(
                                                                                          name: m.storagePath.split('/').last,
                                                                                          bytes: m.bytes,
                                                                                          height: m.dimensions?.height,
                                                                                          width: m.dimensions?.width,
                                                                                          blurHash: m.blurHash,
                                                                                        ))
                                                                                    .toList();

                                                                                downloadUrls = (await Future.wait(
                                                                                  selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                  ),
                                                                                ))
                                                                                    .where((u) => u != null)
                                                                                    .map((u) => u!)
                                                                                    .toList();
                                                                              } finally {
                                                                                _model.isDataUploading = false;
                                                                              }
                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                setState(() {
                                                                                  _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl = downloadUrls.first;
                                                                                });
                                                                              } else {
                                                                                setState(() {});
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                          text:
                                                                              'Carregar imagem',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().corSelecionadaAnunciante,
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await FirebaseStorage
                                                                      .instance
                                                                      .refFromURL(widget
                                                                          .documentoRefAnunciante!
                                                                          .logo)
                                                                      .delete();

                                                                  await widget
                                                                      .documentoRefAnunciante!
                                                                      .reference
                                                                      .update(
                                                                          createAnuncianteRecordData(
                                                                    logo: _model
                                                                        .uploadedFileUrl,
                                                                  ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Alterado com sucesso',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                },
                                                                text: 'Salvar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 170.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .corSelecionadaAnunciante,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 8.0))
                                                              .around(SizedBox(
                                                                  height: 8.0)),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation3']!),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Sobre a loja',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cnpjLojaController,
                                                                focusNode: _model
                                                                    .cnpjLojaFocusNode,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'CNPJ (opcional)',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .corSelecionadaAnunciante,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                maxLines: null,
                                                                minLines: 1,
                                                                validator: _model
                                                                    .cnpjLojaControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .nomeLojaController,
                                                                focusNode: _model
                                                                    .nomeLojaFocusNode,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Nome da loja',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        FFAppState()
                                                                            .corSelecionadaAnunciante,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                maxLines: null,
                                                                minLines: 1,
                                                                validator: _model
                                                                    .nomeLojaControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
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
                                                                    if (widget
                                                                            .documentoRefAnunciante
                                                                            ?.planoAssinatura ==
                                                                        'gratis') {
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
                                                                                child: UpgradeWidget(
                                                                                  mensagemMenu: 'informacoes',
                                                                                  anunciantedoc: widget.documentoRefAnunciante!,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    } else {
                                                                      return;
                                                                    }
                                                                  },
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.descricaoLojaController,
                                                                          focusNode:
                                                                              _model.descricaoLojaFocusNode,
                                                                          readOnly:
                                                                              widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                'Descrição da sua loja',
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).accent4,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: valueOrDefault<Color>(
                                                                                  FFAppState().corSelecionadaAnunciante,
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            contentPadding:
                                                                                EdgeInsets.all(12.0),
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          maxLines:
                                                                              null,
                                                                          minLines:
                                                                              4,
                                                                          keyboardType:
                                                                              TextInputType.multiline,
                                                                          validator: _model
                                                                              .descricaoLojaControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .estrelaBloqueioModel4,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            EstrelaBloqueioWidget(
                                                                          planoGratis: widget
                                                                              .documentoRefAnunciante!
                                                                              .planoAssinatura,
                                                                          tamanho:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await widget
                                                                              .documentoRefAnunciante!
                                                                              .reference
                                                                              .update(createAnuncianteRecordData(
                                                                            nomeFantasia:
                                                                                '',
                                                                            cnpjRg:
                                                                                '',
                                                                            descricao:
                                                                                '',
                                                                          ));
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Alterado com sucesso',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Salvar',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              170.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().corSelecionadaAnunciante,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: Colors.white,
                                                                              ),
                                                                          elevation:
                                                                              2.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .estrelaBloqueioModel5,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        child:
                                                                            EstrelaBloqueioWidget(
                                                                          planoGratis: widget
                                                                              .documentoRefAnunciante!
                                                                              .planoAssinatura,
                                                                          tamanho:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation4']!),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Categoria',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.perfil,
                                                                    '') ==
                                                                'Admin')
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Visibility(
                                                                      visible: valueOrDefault(
                                                                              currentUserDocument?.perfil,
                                                                              '') ==
                                                                          'Admin',
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CategoriasRecord>>(
                                                                        stream:
                                                                            queryCategoriasRecord(
                                                                          queryBuilder: (categoriasRecord) =>
                                                                              categoriasRecord.orderBy('NomeDaCategoria'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                              dropCategoriaCategoriasRecordList =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropCategoriaValueController ??=
                                                                                FormFieldController<String>(null),
                                                                            options:
                                                                                dropCategoriaCategoriasRecordList.map((e) => e.nomeDaCategoria).toList(),
                                                                            onChanged: (val) =>
                                                                                setState(() => _model.dropCategoriaValue = val),
                                                                            height:
                                                                                50.0,
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            hintText:
                                                                                'Categoria',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 15.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().corSelecionadaAnunciante,
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        SubCategoriasRecord>>(
                                                                  stream:
                                                                      querySubCategoriasRecord(
                                                                    queryBuilder:
                                                                        (subCategoriasRecord) =>
                                                                            subCategoriasRecord.where(
                                                                      'NomeCategoriaPai',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropCategoriaValue,
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
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0xFF622AE2),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<SubCategoriasRecord>
                                                                        dropDownSubCatg01ObrigatorioSubCategoriasRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .dropDownSubCatg01ObrigatorioValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.dropDownSubCatg01ObrigatorioValue ??= widget
                                                                            .documentoRefAnunciante
                                                                            ?.nomeSubCategoria01,
                                                                      ),
                                                                      options: dropDownSubCatg01ObrigatorioSubCategoriasRecordList
                                                                          .map((e) =>
                                                                              e.nomeSubCategoria)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.dropDownSubCatg01ObrigatorioValue = val),
                                                                      height:
                                                                          50.0,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      hintText:
                                                                          'Escolha seu serviço',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          valueOrDefault<
                                                                              Color>(
                                                                        FFAppState()
                                                                            .corSelecionadaAnunciante,
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled: _model.dropCategoriaValue ==
                                                                              null ||
                                                                          _model.dropCategoriaValue ==
                                                                              '',
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          4.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.info_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          Text(
                                                                            'Caso você preste mais de um serviço.',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).accent2,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
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
                                                                              if (widget.documentoRefAnunciante?.planoAssinatura == 'gratis') {
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
                                                                                          child: UpgradeWidget(
                                                                                            mensagemMenu: 'meuNegocio',
                                                                                            anunciantedoc: widget.documentoRefAnunciante!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              } else {
                                                                                return;
                                                                              }
                                                                            },
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: StreamBuilder<List<SubCategoriasRecord>>(
                                                                                    stream: querySubCategoriasRecord(
                                                                                      queryBuilder: (subCategoriasRecord) => subCategoriasRecord.where(
                                                                                        'NomeCategoriaPai',
                                                                                        isEqualTo: _model.dropCategoriaValue,
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
                                                                                      List<SubCategoriasRecord> dropDownSubCatg02ObrigatorioSubCategoriasRecordList = snapshot.data!;
                                                                                      return FlutterFlowDropDown<String>(
                                                                                        controller: _model.dropDownSubCatg02ObrigatorioValueController ??= FormFieldController<String>(
                                                                                          _model.dropDownSubCatg02ObrigatorioValue ??= widget.documentoRefAnunciante?.nomeSubCategoria02,
                                                                                        ),
                                                                                        options: dropDownSubCatg02ObrigatorioSubCategoriasRecordList.map((e) => e.nomeSubCategoria).toList(),
                                                                                        onChanged: (val) => setState(() => _model.dropDownSubCatg02ObrigatorioValue = val),
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        hintText: 'Escolha mais de um serviço',
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        borderWidth: 2.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 12.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        disabled: (_model.dropCategoriaValue == null || _model.dropCategoriaValue == '') || (widget.documentoRefAnunciante?.planoAssinatura == 'gratis'),
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                wrapWithModel(
                                                                                  model: _model.estrelaBloqueioModel6,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: EstrelaBloqueioWidget(
                                                                                    planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                    tamanho: 1,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await widget
                                                                      .documentoRefAnunciante!
                                                                      .reference
                                                                      .update(
                                                                          createAnuncianteRecordData(
                                                                    categoria:
                                                                        _model
                                                                            .dropCategoriaValue,
                                                                    nomeSubCategoria01:
                                                                        _model
                                                                            .dropDownSubCatg01ObrigatorioValue,
                                                                    nomeSubCategoria02:
                                                                        _model
                                                                            .dropDownSubCatg02ObrigatorioValue,
                                                                  ));
                                                                },
                                                                text: 'Salvar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 170.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .corSelecionadaAnunciante,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 12.0)),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation5']!),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Endereço',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .enderecoCompletoController,
                                                                    focusNode:
                                                                        _model
                                                                            .enderecoCompletoFocusNode,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Rua, numero e Bairro',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().corSelecionadaAnunciante,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    maxLines:
                                                                        null,
                                                                    minLines: 1,
                                                                    validator: _model
                                                                        .enderecoCompletoControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            TextFormField(
                                                              controller: _model
                                                                  .cidadeEndLojaController,
                                                              focusNode: _model
                                                                  .cidadeEndLojaFocusNode,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Cidade',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState()
                                                                          .corSelecionadaAnunciante,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              maxLines: null,
                                                              minLines: 1,
                                                              validator: _model
                                                                  .cidadeEndLojaControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
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
                                                                          if (widget.documentoRefAnunciante?.planoAssinatura ==
                                                                              'gratis') {
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
                                                                                      child: UpgradeWidget(
                                                                                        mensagemMenu: 'localizacao',
                                                                                        anunciantedoc: widget.documentoRefAnunciante!,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Localização no mapa',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 22.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 300.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Builder(builder: (context) {
                                                                                final _googleMapMarker = _model.placePickerValue.latLng;
                                                                                return FlutterFlowGoogleMap(
                                                                                  controller: _model.googleMapsController,
                                                                                  onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                                                                                  initialLocation: _model.googleMapsCenter ??= LatLng(-30.1141, -51.32813),
                                                                                  markers: [
                                                                                    if (_googleMapMarker != null)
                                                                                      FlutterFlowMarker(
                                                                                        _googleMapMarker.serialize(),
                                                                                        _googleMapMarker,
                                                                                      ),
                                                                                  ],
                                                                                  markerColor: GoogleMarkerColor.violet,
                                                                                  mapType: MapType.normal,
                                                                                  style: GoogleMapStyle.standard,
                                                                                  initialZoom: 14.0,
                                                                                  allowInteraction: true,
                                                                                  allowZoom: true,
                                                                                  showZoomControls: true,
                                                                                  showLocation: true,
                                                                                  showCompass: false,
                                                                                  showMapToolbar: true,
                                                                                  showTraffic: false,
                                                                                  centerMapOnMarkerTap: true,
                                                                                );
                                                                              }),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (widget.documentoRefAnunciante?.planoAssinatura != 'gratis')
                                                                                      FlutterFlowPlacePicker(
                                                                                        iOSGoogleMapsApiKey: 'AIzaSyDXJ2ZVZNQhK13zv23H3suoulfpJUhqOnk',
                                                                                        androidGoogleMapsApiKey: 'AIzaSyCNld4qbgGKUHAT-zcAYq3ndxpjZuFzoZ8',
                                                                                        webGoogleMapsApiKey: 'AIzaSyDbiwZY1UrW9FZoJOmJDn7U4w0ALq0-XJM',
                                                                                        onSelect: (place) async {
                                                                                          setState(() => _model.placePickerValue = place);
                                                                                          (await _model.googleMapsController.future).animateCamera(CameraUpdate.newLatLng(place.latLng.toGoogleMaps()));
                                                                                        },
                                                                                        defaultText: 'Localização no mapa',
                                                                                        icon: Icon(
                                                                                          Icons.place,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                        buttonOptions: FFButtonOptions(
                                                                                          width: 200.0,
                                                                                          height: 40.0,
                                                                                          color: valueOrDefault<Color>(
                                                                                            FFAppState().corSelecionadaAnunciante,
                                                                                            FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                          elevation: 2.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: Colors.transparent,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    if (widget.documentoRefAnunciante?.planoAssinatura == 'gratis')
                                                                                      Stack(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                if (widget.documentoRefAnunciante?.planoAssinatura == 'gratis') {
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
                                                                                                            child: UpgradeWidget(
                                                                                                              mensagemMenu: 'panielAdministrativo',
                                                                                                              anunciantedoc: widget.documentoRefAnunciante!,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                } else {
                                                                                                  return;
                                                                                                }
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 2.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 200.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().corSelecionadaAnunciante,
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Icon(
                                                                                                          Icons.place,
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          size: 16.0,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Localização no mapa',
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          wrapWithModel(
                                                                                            model: _model.estrelaBloqueioModel7,
                                                                                            updateCallback: () => setState(() {}),
                                                                                            child: EstrelaBloqueioWidget(
                                                                                              planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                              tamanho: 1,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)).around(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .estrelaBloqueioModel8,
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      EstrelaBloqueioWidget(
                                                                    planoGratis: widget
                                                                        .documentoRefAnunciante!
                                                                        .planoAssinatura,
                                                                    tamanho: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await widget
                                                                      .documentoRefAnunciante!
                                                                      .reference
                                                                      .update(
                                                                          createAnuncianteRecordData(
                                                                    enderecoCompleto:
                                                                        _model
                                                                            .enderecoCompletoController
                                                                            .text,
                                                                    cidade: _model
                                                                        .cidadeEndLojaController
                                                                        .text,
                                                                    googleMaps: _model
                                                                        .placePickerValue
                                                                        .latLng,
                                                                  ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Alterado com sucesso',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                },
                                                                text: 'Salvar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 170.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .corSelecionadaAnunciante,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 12.0)),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation6']!),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 12.0))
                                                    .around(
                                                        SizedBox(height: 12.0)),
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Contato',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      TextFormField(
                                                                        controller:
                                                                            _model.whatsapController,
                                                                        focusNode:
                                                                            _model.whatsapFocusNode,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Telefone',
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().corSelecionadaAnunciante,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.all(12.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        maxLines:
                                                                            null,
                                                                        minLines:
                                                                            1,
                                                                        validator: _model
                                                                            .whatsapControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                                      if (widget
                                                                              .documentoRefAnunciante
                                                                              ?.planoAssinatura ==
                                                                          'gratis') {
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
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: UpgradeWidget(
                                                                                    mensagemMenu: 'informacoes',
                                                                                    anunciantedoc: widget.documentoRefAnunciante!,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.telefoneLojaController,
                                                                                  focusNode: _model.telefoneLojaFocusNode,
                                                                                  readOnly: widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: 'Telefone fixo',
                                                                                    hintText: 'Telefone fixo',
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsets.all(12.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  maxLines: null,
                                                                                  minLines: 1,
                                                                                  validator: _model.telefoneLojaControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.estrelaBloqueioModel9,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: EstrelaBloqueioWidget(
                                                                                  planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                  tamanho: 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.instagramLojaController,
                                                                                  focusNode: _model.instagramLojaFocusNode,
                                                                                  readOnly: widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'Instagram',
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsets.all(12.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  maxLines: null,
                                                                                  minLines: 1,
                                                                                  validator: _model.instagramLojaControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.estrelaBloqueioModel10,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: EstrelaBloqueioWidget(
                                                                                  planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                  tamanho: 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.facebookLojaController,
                                                                                  focusNode: _model.facebookLojaFocusNode,
                                                                                  readOnly: widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'Facebook',
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsets.all(12.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  maxLines: null,
                                                                                  minLines: 1,
                                                                                  validator: _model.facebookLojaControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.estrelaBloqueioModel11,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: EstrelaBloqueioWidget(
                                                                                  planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                  tamanho: 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.siteLojaController,
                                                                                  focusNode: _model.siteLojaFocusNode,
                                                                                  readOnly: widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'Facebook',
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsets.all(12.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  maxLines: null,
                                                                                  minLines: 1,
                                                                                  validator: _model.siteLojaControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.estrelaBloqueioModel12,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: EstrelaBloqueioWidget(
                                                                                  planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                  tamanho: 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.emailLojaController,
                                                                                  focusNode: _model.emailLojaFocusNode,
                                                                                  readOnly: widget.documentoRefAnunciante?.planoAssinatura == 'gratis',
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'E-mail de contato',
                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).accent2,
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: valueOrDefault<Color>(
                                                                                          FFAppState().corSelecionadaAnunciante,
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    errorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsets.all(12.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  maxLines: null,
                                                                                  minLines: 1,
                                                                                  validator: _model.emailLojaControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              wrapWithModel(
                                                                                model: _model.estrelaBloqueioModel13,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: EstrelaBloqueioWidget(
                                                                                  planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                  tamanho: 1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await widget
                                                                      .documentoRefAnunciante!
                                                                      .reference
                                                                      .update(
                                                                          createAnuncianteRecordData(
                                                                    nomeFantasia:
                                                                        '',
                                                                    whatsComercial:
                                                                        _model
                                                                            .whatsapController
                                                                            .text,
                                                                    telefoneFixo:
                                                                        _model
                                                                            .telefoneLojaController
                                                                            .text,
                                                                    instagram: _model
                                                                        .instagramLojaController
                                                                        .text,
                                                                    facebook: _model
                                                                        .facebookLojaController
                                                                        .text,
                                                                    site: _model
                                                                        .siteLojaController
                                                                        .text,
                                                                    emailComercial:
                                                                        _model
                                                                            .emailLojaController
                                                                            .text,
                                                                  ));
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Alterado com sucesso',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                    ),
                                                                  );
                                                                },
                                                                text: 'Salvar',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 170.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .corSelecionadaAnunciante,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 12.0)),
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation7']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 5.0,
                                                            color: Color(
                                                                0x34111417),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Administradores',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 22.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.responsavelNomeCompletoLojaController,
                                                                        focusNode:
                                                                            _model.responsavelNomeCompletoLojaFocusNode,
                                                                        readOnly:
                                                                            widget.documentoRefAnunciante?.planoAssinatura ==
                                                                                'gratis',
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'Email do colaborador',
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: valueOrDefault<Color>(
                                                                                FFAppState().corSelecionadaAnunciante,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.all(12.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        maxLines:
                                                                            null,
                                                                        minLines:
                                                                            1,
                                                                        validator: _model
                                                                            .responsavelNomeCompletoLojaControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/296/600',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Nome',
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                    ),
                                                                                    Text(
                                                                                      'nome@email.com.br',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/296/600',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Nome',
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                    ),
                                                                                    Text(
                                                                                      'nome@email.com.br',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    'https://picsum.photos/seed/296/600',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Nome',
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                    ),
                                                                                    Text(
                                                                                      'nome@email.com.br',
                                                                                      style: FlutterFlowTheme.of(context).labelMedium,
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              170.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) => Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      if (widget.documentoRefAnunciante?.planoAssinatura == 'gratis') {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                  child: UpgradeWidget(
                                                                                                    mensagemMenu: 'administradores',
                                                                                                    anunciantedoc: widget.documentoRefAnunciante!,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      }
                                                                                    },
                                                                                    text: 'Salvar',
                                                                                    options: FFButtonOptions(
                                                                                      width: 170.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: valueOrDefault<Color>(
                                                                                        FFAppState().corSelecionadaAnunciante,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(40.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            wrapWithModel(
                                                                              model: _model.estrelaBloqueioModel14,
                                                                              updateCallback: () => setState(() {}),
                                                                              child: EstrelaBloqueioWidget(
                                                                                planoGratis: widget.documentoRefAnunciante!.planoAssinatura,
                                                                                tamanho: 1,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation8']!),
                                                          ),
                                                          wrapWithModel(
                                                            model: _model
                                                                .estrelaBloqueioModel15,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                EstrelaBloqueioWidget(
                                                              planoGratis: widget
                                                                  .documentoRefAnunciante!
                                                                  .planoAssinatura,
                                                              tamanho: 2,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
