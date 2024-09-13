import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/pop_up/acao_tabale/acao_tabale_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_informa/componentes/card_perfil_t_v_g_ooficial/card_perfil_t_v_g_ooficial_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'imprensa_model.dart';
export 'imprensa_model.dart';

class ImprensaWidget extends StatefulWidget {
  const ImprensaWidget({
    super.key,
    required this.imprensaRef,
  });

  final DocumentReference? imprensaRef;

  @override
  State<ImprensaWidget> createState() => _ImprensaWidgetState();
}

class _ImprensaWidgetState extends State<ImprensaWidget>
    with TickerProviderStateMixin {
  late ImprensaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImprensaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Imprensa'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 15,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MateriasRecord>>(
      stream: queryMateriasRecord(
        parent: widget!.imprensaRef,
        queryBuilder: (materiasRecord) =>
            materiasRecord.orderBy('DataPublicacaoMateria', descending: true),
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
        List<MateriasRecord> imprensaMateriasRecordList = snapshot.data!;

        return Title(
            title: 'Imprensa',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 54.0,
                    icon: Icon(
                      FFIcons.karrowBack,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('IMPRENSA_PAGE_arrowBack_ICN_ON_TAP');

                      context.pushNamed('Feed');
                    },
                  ),
                  title: Text(
                    'me informa',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Inter',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  width: 300.0,
                                  height: 300.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/il24hbpde2nh/informame.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                'me informa',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total de materias publicadas',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    imprensaMateriasRecordList.length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'IMPRENSA_PAGE_NOVA_MATERIA_BTN_ON_TAP');

                                  context.pushNamed(
                                    'Materia',
                                    queryParameters: {
                                      'status': serializeParam(
                                        BoolToString.Novo.name,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: 'Nova materia',
                                options: FFButtonOptions(
                                  width: 335.0,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 170),
                                    curve: Curves.easeIn,
                                    height: 68.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 12.0),
                                            tabs: [
                                              Tab(
                                                text: FFAppConstants
                                                    .CategoriaMaterias[0],
                                              ),
                                              Tab(
                                                text: 'Saúde',
                                              ),
                                              Tab(
                                                text: 'Segurança',
                                              ),
                                              Tab(
                                                text: 'Politica',
                                              ),
                                              Tab(
                                                text: 'Cidades',
                                              ),
                                              Tab(
                                                text: 'Esporte',
                                              ),
                                              Tab(
                                                text: 'Comunidade',
                                              ),
                                              Tab(
                                                text: 'Economia',
                                              ),
                                              Tab(
                                                text: 'Educação',
                                              ),
                                              Tab(
                                                text: 'Transporte',
                                              ),
                                              Tab(
                                                text: 'Arte e Cultura',
                                              ),
                                              Tab(
                                                text: 'Mundo',
                                              ),
                                              Tab(
                                                text: 'Meio Ambiente',
                                              ),
                                              Tab(
                                                text: 'Tempo',
                                              ),
                                              Tab(
                                                text: 'Eventos',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_politica_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Todas';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_saude_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Saúde';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_seguranca_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Segurança';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_esporte_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Politica';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_cidade_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Cidades';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_eventos_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Esporte';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_cominudade_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Comunidade';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_economia_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Economia';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_educacao_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Educação';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_transporte_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Transporte';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_arte-cultura_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Arte/Cultura';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_internacional_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Internacional';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_meioAmbiente_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Meio Ambiente';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_tempo_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Tempo';
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'IMPRENSA_PAGE_Tab_x6b8w8rm_ON_TAP');
                                                  _model.categoriaMateria =
                                                      'Eventos';
                                                  safeSetState(() {});
                                                }
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
                                              Container(),
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
                                    builder: (context) {
                                      if (_model.tabBarCurrentIndex
                                              .toString() !=
                                          '0') {
                                        return wrapWithModel(
                                          model:
                                              _model.cardPerfilTVGOoficialModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CardPerfilTVGOoficialWidget(
                                            numeroMaterias:
                                                imprensaMateriasRecordList
                                                    .where((e) =>
                                                        e.categoria ==
                                                        'Politica')
                                                    .toList()
                                                    .length,
                                            materiaRef:
                                                imprensaMateriasRecordList
                                                    .where((e) =>
                                                        e.categoria ==
                                                        _model.categoriaMateria)
                                                    .toList(),
                                          ),
                                        );
                                      } else {
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Text(
                                                        'Matéria',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ))
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'Publicação',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                    ))
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          'Categoria',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                    ))
                                                      Expanded(
                                                        child: Text(
                                                          'Nº leitores',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Text(
                                                        'Ações',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
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
                                                  final tabelaMeinforma =
                                                      imprensaMateriasRecordList
                                                          .toList()
                                                          .take(100)
                                                          .toList();

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        tabelaMeinforma.length,
                                                        (tabelaMeinformaIndex) {
                                                      final tabelaMeinformaItem =
                                                          tabelaMeinforma[
                                                              tabelaMeinformaIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    1.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: Color(
                                                                    0xFFF1F4F8),
                                                                offset: Offset(
                                                                  0.0,
                                                                  1.0,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 4,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            elevation:
                                                                                1.0,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                shape: BoxShape.rectangle,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                              ),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                child: Image.network(
                                                                                  tabelaMeinformaItem.imagemCapa,
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  tabelaMeinformaItem.tituloMateria,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          FFIcons
                                                                              .kcalendario,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "d/M/y",
                                                                            tabelaMeinformaItem.dataPublicacaoMateria!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kmeInformaON,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          tabelaMeinformaItem
                                                                              .categoria,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              32.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(40.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.group_add_outlined,
                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                size: 16.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                child: Text(
                                                                                  tabelaMeinformaItem.numTotalLeitoresMateria.toString(),
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              44.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.more_vert,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('IMPRENSA_PAGE_more_vert_ICN_ON_TAP');
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
                                                                                      onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                      child: AcaoTabaleWidget(
                                                                                        compartiharURL: () async {},
                                                                                        visualizar: () async {
                                                                                          context.pushNamed(
                                                                                            'meinformaDetalhesNoticia',
                                                                                            queryParameters: {
                                                                                              'materiadoc': serializeParam(
                                                                                                tabelaMeinformaItem,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'materiadoc': tabelaMeinformaItem,
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        editar: () async {
                                                                                          context.pushNamed(
                                                                                            'Materia',
                                                                                            queryParameters: {
                                                                                              'status': serializeParam(
                                                                                                BoolToString.Editar.name,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'materiaDoc': serializeParam(
                                                                                                tabelaMeinformaItem,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'materiaDoc': tabelaMeinformaItem,
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        excluir: () async {
                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                context: context,
                                                                                                builder: (alertDialogContext) {
                                                                                                  return WebViewAware(
                                                                                                    child: AlertDialog(
                                                                                                      title: Text('Excluir matéria?'),
                                                                                                      content: Text('Você tem certeza que você quer excluir essa matéria?'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancelar'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Sim, excluir'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ) ??
                                                                                              false;
                                                                                          if (confirmDialogResponse) {
                                                                                            await FirebaseStorage.instance.refFromURL(tabelaMeinformaItem.imagemCapa).delete();
                                                                                            await tabelaMeinformaItem.reference.delete();
                                                                                          } else {
                                                                                            return;
                                                                                          }
                                                                                        },
                                                                                        enviarNotificacao: () async {},
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 24.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
