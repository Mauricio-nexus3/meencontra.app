import '/anunciante/new_anunciante/build/new_anuncio_lista_de_imgns/new_anuncio_lista_de_imgns_widget.dart';
import '/anunciante/new_anunciante/build/new_anuncio_produto_lista/new_anuncio_produto_lista_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dashboard_n_w_anuncios_model.dart';
export 'dashboard_n_w_anuncios_model.dart';

class DashboardNWAnunciosWidget extends StatefulWidget {
  const DashboardNWAnunciosWidget({
    super.key,
    this.anuncianteDoc,
  });

  final AnuncianteRecord? anuncianteDoc;

  @override
  State<DashboardNWAnunciosWidget> createState() =>
      _DashboardNWAnunciosWidgetState();
}

class _DashboardNWAnunciosWidgetState extends State<DashboardNWAnunciosWidget>
    with TickerProviderStateMixin {
  late DashboardNWAnunciosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(8.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(2.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-8.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardNWAnunciosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.tabBar = widget.anuncianteDoc?.planoAssinatura;
      });
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<AnunciosRecord>>(
      stream: queryAnunciosRecord(
        parent: widget.anuncianteDoc?.reference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<AnunciosRecord> dashboardNWAnunciosAnunciosRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.newDashAnuncianteModel2,
                  updateCallback: () => setState(() {}),
                  child: NewDashAnuncianteWidget(
                    paginaAtual: 'catalogo',
                    anuncianteDoc: widget.anuncianteDoc!,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.newDashAnuncianteModel1,
                              updateCallback: () => setState(() {}),
                              child: NewDashAnuncianteWidget(
                                paginaAtual: 'anuncios',
                                anuncianteDoc: widget.anuncianteDoc!,
                              ),
                            ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.7,
                              ),
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
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
                                                        scaffoldKey
                                                            .currentState!
                                                            .openDrawer();
                                                      },
                                                      child: Icon(
                                                        Icons.menu_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 32.0,
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: Text(
                                                    'Seus anúncios',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (widget.anuncianteDoc?.planoAssinatura !=
                                        'gratis')
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 24.0, 24.0, 0.0),
                                                child: Wrap(
                                                  spacing: 12.0,
                                                  runSpacing: 12.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment: WrapAlignment
                                                      .spaceBetween,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 360.0,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Formato de Anúncio',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.dropDownValue ??=
                                                              widget
                                                                  .anuncianteDoc
                                                                  ?.formatoAnuncio,
                                                        ),
                                                        options: [
                                                          'Post de imagens prontas',
                                                          'Lista de produtos'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .dropDownValue =
                                                              val);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Seleção confirmada',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );

                                                          await widget
                                                              .anuncianteDoc!
                                                              .reference
                                                              .update(
                                                                  createAnuncianteRecordData(
                                                            formatoAnuncio:
                                                                _model.dropDownValue ==
                                                                        'Lista de produtos'
                                                                    ? 'Produtos'
                                                                    : 'Imagem',
                                                          ));
                                                        },
                                                        width: 300.0,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        hintText: widget.anuncianteDoc
                                                                        ?.formatoAnuncio !=
                                                                    null &&
                                                                widget.anuncianteDoc
                                                                        ?.formatoAnuncio !=
                                                                    ''
                                                            ? widget
                                                                .anuncianteDoc
                                                                ?.formatoAnuncio
                                                            : 'Escolha uma opção para anunciar',
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            valueOrDefault<
                                                                Color>(
                                                          widget.anuncianteDoc
                                                              ?.cor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons.info_outline,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                        size: 16.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          'Refente a pagina principal:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .chevron_right_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                          size: 16.0,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            () {
                                                              if (_model
                                                                      .dropDownValue ==
                                                                  'Post de imagens prontas') {
                                                                return 'Esta opção faz seu anúncio ser exibido no formato Post igual rede social ocupado 80% da tela.';
                                                              } else if (_model
                                                                      .dropDownValue ==
                                                                  'Lista de produtos') {
                                                                return 'Esta opção faz seu anúncio ser exibido no formato de produtos igual aplicativos de deliverys e e-comerces, ocupado 50% da tela.';
                                                              } else {
                                                                return 'Selecione a opção que irá mostrar seu Anúncio';
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium,
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    Container(
                                      width: double.infinity,
                                      height: 800.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (widget.anuncianteDoc
                                                        ?.planoAssinatura ==
                                                    'medestacaCapa')
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
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
                                                        setState(() {
                                                          _model.tabBar =
                                                              'Capa';
                                                        });
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Capa da Categoria',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: _model
                                                                              .tabBar ==
                                                                          'Capa'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                ),
                                                          ),
                                                          if (_model.tabBar ==
                                                              'Capa')
                                                            SizedBox(
                                                              width: 160.0,
                                                              child: Divider(
                                                                thickness: 3.0,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget
                                                                      .anuncianteDoc
                                                                      ?.cor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'dividerOnActionTriggerAnimation1']!,
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsets.all(4.0),
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
                                                      if (widget.anuncianteDoc
                                                              ?.planoAssinatura !=
                                                          'gratis') {
                                                        setState(() {
                                                          _model.tabBar =
                                                              'Imagens';
                                                        });
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Imagens',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: _model
                                                                            .tabBar ==
                                                                        'Imagens'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                              ),
                                                        ),
                                                        if (_model.tabBar ==
                                                            'Imagens')
                                                          SizedBox(
                                                            width: 120.0,
                                                            child: Divider(
                                                              thickness: 3.0,
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                widget
                                                                    .anuncianteDoc
                                                                    ?.cor,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'dividerOnActionTriggerAnimation2']!,
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                if (widget.anuncianteDoc
                                                        ?.planoAssinatura !=
                                                    'gratis')
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
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
                                                        setState(() {
                                                          _model.tabBar =
                                                              'Produtos';
                                                        });
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Produtos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: _model
                                                                              .tabBar ==
                                                                          'Produtos'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                ),
                                                          ),
                                                          if (_model.tabBar ==
                                                              'Produtos')
                                                            SizedBox(
                                                              width: 120.0,
                                                              child: Divider(
                                                                thickness: 3.0,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget
                                                                      .anuncianteDoc
                                                                      ?.cor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'dividerOnActionTriggerAnimation3']!,
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 24.0)),
                                            ),
                                          ),
                                          if (_model.tabBar == 'Capa')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Wrap(
                                                          spacing: 12.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .center,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .spaceBetween,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 400.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .info_outline,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          'Seu plano possui a opção de ter uma capa em destaque na categoria, além de produtos e Post. Torne sua presença ainda mais impactante e atraia mais clientes com uma imagem chamativa. Experimente agora.',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).labelMedium,
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Status: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleSmall,
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x2404A24C),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              4.0,
                                                                              8.0,
                                                                              4.0),
                                                                          child:
                                                                              Text(
                                                                            dashboardNWAnunciosAnunciosRecordList.where((e) => e.isCapaCategoria == true).toList().length == 1
                                                                                ? 'AO VIVO'
                                                                                : 'Em espera',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: dashboardNWAnunciosAnunciosRecordList.where((e) => e.isCapaCategoria == true).toList().length == 1 ? Color(0xFF04A24C) : FlutterFlowTheme.of(context).accent2,
                                                                                  fontSize: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 12.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 14.0;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 16.0;
                                                                                    } else {
                                                                                      return 12.0;
                                                                                    }
                                                                                  }(),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                            Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 400.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (dashboardNWAnunciosAnunciosRecordList
                                                                          .where((e) =>
                                                                              e.isCapaCategoria ==
                                                                              true)
                                                                          .toList()
                                                                          .length <
                                                                      1) {
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
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: NewAnuncioListaDeImgnsWidget(
                                                                                adicionarAnuncio: widget.anuncianteDoc!,
                                                                                iscapa: true,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Imagem já selecionada'),
                                                                            content:
                                                                                Text('Você só pode adicionar 1 imagem'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Entendi'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                                text:
                                                                    'Imagem da Capa',
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  size: 15.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 300.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 220.0;
                                                                    } else {
                                                                      return 220.0;
                                                                    }
                                                                  }(),
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
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
                                                                    widget
                                                                        .anuncianteDoc
                                                                        ?.cor,
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
                                                                      3.0,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        height: 500.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final isCapaCategoria =
                                                                  dashboardNWAnunciosAnunciosRecordList
                                                                      .where((e) =>
                                                                          e.isCapaCategoria ==
                                                                          true)
                                                                      .toList()
                                                                      .take(1)
                                                                      .toList();
                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    isCapaCategoria
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        isCapaCategoriaIndex) {
                                                                  final isCapaCategoriaItem =
                                                                      isCapaCategoria[
                                                                          isCapaCategoriaIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x4C4B39EF),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFF4B39EF),
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(2.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                      child: Image.network(
                                                                                        isCapaCategoriaItem.fotoAnuncio,
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Text(
                                                                                    'Seu anúncio é capa da categoria: ${widget.anuncianteDoc?.categoria}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-0.35, 0.1),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
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
                                                                                                        title: Text('Você tem certeza que quer remover esse anúncio'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                            child: Text('Cancelar'),
                                                                                                          ),
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                            child: Text('Remover'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ) ??
                                                                                                false;
                                                                                            if (confirmDialogResponse) {
                                                                                              await FirebaseStorage.instance.refFromURL(isCapaCategoriaItem.fotoAnuncio).delete();
                                                                                              await isCapaCategoriaItem.reference.delete();
                                                                                            } else {
                                                                                              return;
                                                                                            }
                                                                                          },
                                                                                          child: Icon(
                                                                                            FFIcons.ktrashOutline,
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Divider(
                                                                        thickness:
                                                                            1.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            6.0)),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 32.0)),
                                                ),
                                              ),
                                            ),
                                          if ((_model.tabBar != 'Capa') ||
                                              (_model.tabBar != 'Produtos'))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Wrap(
                                                        spacing: 12.0,
                                                        runSpacing: 24.0,
                                                        alignment: WrapAlignment
                                                            .spaceBetween,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment
                                                                .spaceBetween,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 400.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .info_outline,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        'Utilize imagens envolventes e textos cativantes para atrair a atenção dos usuários. Recomendamos o uso da mesma imagem utilizada em suas redes sociais para manter uma identidade visual consistente e fortalecer o reconhecimento da sua marca.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Status: ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall,
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x2404A24C),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          widget.anuncianteDoc?.formatoAnuncio == 'Imagem'
                                                                              ? 'AO VIVO'
                                                                              : 'Em espera',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: widget.anuncianteDoc?.formatoAnuncio == 'Imagem' ? Color(0xFF04A24C) : FlutterFlowTheme.of(context).accent2,
                                                                                fontSize: () {
                                                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                    return 12.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                    return 14.0;
                                                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                    return 16.0;
                                                                                  } else {
                                                                                    return 12.0;
                                                                                  }
                                                                                }(),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 400.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
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
                                                                              NewAnuncioListaDeImgnsWidget(
                                                                            adicionarAnuncio:
                                                                                widget.anuncianteDoc!,
                                                                            iscapa:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));

                                                                if (((widget.anuncianteDoc?.planoAssinatura !=
                                                                            'gratis') &&
                                                                        (dashboardNWAnunciosAnunciosRecordList.where((e) => e.isCapaCategoria == false).toList().length <
                                                                            4)) ||
                                                                    ((widget.anuncianteDoc?.planoAssinatura ==
                                                                            'gratis') &&
                                                                        (dashboardNWAnunciosAnunciosRecordList.where((e) => e.isCapaCategoria == false).toList().length <
                                                                            2))) {
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
                                                                                NewAnuncioListaDeImgnsWidget(
                                                                              adicionarAnuncio: widget.anuncianteDoc!,
                                                                              iscapa: true,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              Text('Limite de imagens '),
                                                                          content:
                                                                              Text('Ops! Parece que você atingiu o limite de imagens permitido. Para continuar adicionando novas imagens, exclua algumas das existentes e libere espaço. Estamos aqui para ajudar, caso precise de alguma orientação'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Entendi'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                              text:
                                                                  'Adicionar imagem ${valueOrDefault<String>(
                                                                dashboardNWAnunciosAnunciosRecordList
                                                                    .where((e) =>
                                                                        e.isCapaCategoria ==
                                                                        false)
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              )} / ${widget.anuncianteDoc?.planoAssinatura == 'gratis' ? '2' : '4'}',
                                                              icon: Icon(
                                                                Icons.add,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: () {
                                                                  if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointSmall) {
                                                                    return 300.0;
                                                                  } else if (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      kBreakpointMedium) {
                                                                    return 220.0;
                                                                  } else {
                                                                    return 220.0;
                                                                  }
                                                                }(),
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget
                                                                      .anuncianteDoc
                                                                      ?.cor,
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
                                                                elevation: 3.0,
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Container(
                                                      height: 500.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final listaDeAnuncios =
                                                                dashboardNWAnunciosAnunciosRecordList
                                                                    .where((e) =>
                                                                        e.isCapaCategoria ==
                                                                        false)
                                                                    .toList()
                                                                    .take(6)
                                                                    .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listaDeAnuncios
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          12.0),
                                                              itemBuilder: (context,
                                                                  listaDeAnunciosIndex) {
                                                                final listaDeAnunciosItem =
                                                                    listaDeAnuncios[
                                                                        listaDeAnunciosIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x4C4B39EF),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFF4B39EF),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(2.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                    child: Image.network(
                                                                                      listaDeAnunciosItem.fotoAnuncio,
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
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
                                                                                                    child: Text('Confirmar'),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      await listaDeAnunciosItem.reference.update(createAnunciosRecordData(
                                                                                        anunciado: false,
                                                                                      ));
                                                                                      // Pegamos o anuncio da lista atual e ativamos ele

                                                                                      await listaDeAnunciosItem.reference.update(createAnunciosRecordData(
                                                                                        anunciado: true,
                                                                                      ));
                                                                                      await Future.delayed(const Duration(milliseconds: 1200));
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Status de anúncio atualizado',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                        ),
                                                                                      );

                                                                                      context.pushNamed(
                                                                                        'DashboardNWAnuncios',
                                                                                        queryParameters: {
                                                                                          'anuncianteDoc': serializeParam(
                                                                                            widget.anuncianteDoc,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'anuncianteDoc': widget.anuncianteDoc,
                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                            hasTransition: true,
                                                                                            transitionType: PageTransitionType.fade,
                                                                                            duration: Duration(milliseconds: 0),
                                                                                          ),
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      return;
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: listaDeAnunciosItem.anunciado == true ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).gradient2,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: listaDeAnunciosItem.anunciado == true ? Color(0x34000000) : Colors.transparent,
                                                                                          offset: Offset(0.0, 2.0),
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Text(
                                                                                            listaDeAnunciosItem.anunciado == true ? 'AO VIVO' : 'Pausado',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: listaDeAnunciosItem.anunciado == true ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: listaDeAnunciosItem.anunciado == true ? 16.0 : 14.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-0.35, 0.1),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
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
                                                                                                      title: Text('Você tem certeza que quer remover esse anúncio'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancelar'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Remover'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ) ??
                                                                                              false;
                                                                                          if (confirmDialogResponse) {
                                                                                            await FirebaseStorage.instance.refFromURL(listaDeAnunciosItem.fotoAnuncio).delete();
                                                                                            await listaDeAnunciosItem.reference.delete();
                                                                                          } else {
                                                                                            return;
                                                                                          }
                                                                                        },
                                                                                        child: Icon(
                                                                                          FFIcons.ktrashOutline,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          6.0)),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 32.0)),
                                              ),
                                            ),
                                          if (_model.tabBar == 'Produtos')
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Wrap(
                                                                  spacing: 12.0,
                                                                  runSpacing:
                                                                      24.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .center,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .spaceBetween,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.none,
                                                                  children: [
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.info_outline,
                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                size: 16.0,
                                                                              ),
                                                                              Flexible(
                                                                                child: Text(
                                                                                  'Escolha até 6 itens do seu catálogo para serem exibidos em uma lista horizontal na página principal. É uma maneira eficiente de apresentar sua variedade de produtos diretamente aos usuários, facilitando o acesso e a visualização.',
                                                                                  style: FlutterFlowTheme.of(context).labelMedium,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Status: ',
                                                                                style: FlutterFlowTheme.of(context).titleSmall,
                                                                              ),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x2404A24C),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    widget.anuncianteDoc?.formatoAnuncio == 'Produtos' ? 'AO VIVO' : 'Em espera',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: widget.anuncianteDoc?.formatoAnuncio == 'Produtos' ? Color(0xFF04A24C) : FlutterFlowTheme.of(context).accent2,
                                                                                          fontSize: () {
                                                                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                              return 12.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                              return 14.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                              return 16.0;
                                                                                            } else {
                                                                                              return 12.0;
                                                                                            }
                                                                                          }(),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ].divide(SizedBox(height: 12.0)),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            useSafeArea:
                                                                                true,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: NewAnuncioProdutoListaWidget(
                                                                                      adicionarAnuncio: widget.anuncianteDoc!,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        },
                                                                        text:
                                                                            'Selecionar produtos  ${valueOrDefault<String>(
                                                                          dashboardNWAnunciosAnunciosRecordList
                                                                              .length
                                                                              .toString(),
                                                                          '0',
                                                                        )} / 4',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 300.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 220.0;
                                                                            } else {
                                                                              return 220.0;
                                                                            }
                                                                          }(),
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
                                                                            widget.anuncianteDoc?.cor,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: Colors.white,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                height: 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          ProdutoRecord>>(
                                                                    stream:
                                                                        queryProdutoRecord(
                                                                      parent: widget
                                                                          .anuncianteDoc
                                                                          ?.reference,
                                                                      queryBuilder:
                                                                          (produtoRecord) =>
                                                                              produtoRecord.where(
                                                                        'ProdutoAnunciado',
                                                                        isEqualTo:
                                                                            true,
                                                                      ),
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
                                                                            width:
                                                                                30.0,
                                                                            height:
                                                                                30.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                Color(0xFF622AE2),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ProdutoRecord>
                                                                          listViewProdutoRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        primary:
                                                                            false,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewProdutoRecordList.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 12.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewProdutoRecord =
                                                                              listViewProdutoRecordList[listViewIndex];
                                                                          return Material(
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
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        listViewProdutoRecord.imagensProduto.first,
                                                                                        width: 80.0,
                                                                                        height: 80.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            listViewProdutoRecord.nomeProduto,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                          ),
                                                                                          Text(
                                                                                            formatNumber(
                                                                                              listViewProdutoRecord.valorVenda,
                                                                                              formatType: FormatType.decimal,
                                                                                              decimalType: DecimalType.commaDecimal,
                                                                                              currency: 'R\$',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderColor: Colors.transparent,
                                                                                      borderRadius: 20.0,
                                                                                      buttonSize: 40.0,
                                                                                      icon: Icon(
                                                                                        FFIcons.ktrashOutline,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      onPressed: () {
                                                                                        print('IconButton pressed ...');
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
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
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 32.0)),
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
                                  ]
                                      .divide(SizedBox(height: 24.0))
                                      .around(SizedBox(height: 24.0)),
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
            ),
          ),
        );
      },
    );
  }
}
