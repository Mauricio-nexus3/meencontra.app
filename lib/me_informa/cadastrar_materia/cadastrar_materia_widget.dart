import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cadastrar_materia_model.dart';
export 'cadastrar_materia_model.dart';

class CadastrarMateriaWidget extends StatefulWidget {
  const CadastrarMateriaWidget({
    super.key,
    required this.status,
    this.materiaDoc,
  });

  final Status? status;
  final MateriasRecord? materiaDoc;

  @override
  State<CadastrarMateriaWidget> createState() => _CadastrarMateriaWidgetState();
}

class _CadastrarMateriaWidgetState extends State<CadastrarMateriaWidget>
    with TickerProviderStateMixin {
  late CadastrarMateriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarMateriaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cadastrarMateria'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CADASTRAR_MATERIA_cadastrarMateria_ON_IN');
      _model.tabBarb = 0;
      safeSetState(() {});
      // if editar, ele vai preencher os campos
      if (widget!.status == Status.editar) {
        safeSetState(() {
          _model.descricaoFotoTextController?.text =
              widget!.materiaDoc!.descricaoImg;
          _model.descricaoFotoTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.descricaoFotoTextController!.text.length);
        });
        safeSetState(() {
          _model.creditosImgTextController?.text =
              widget!.materiaDoc!.creditosImagem;
          _model.creditosImgTextController?.selection = TextSelection.collapsed(
              offset: _model.creditosImgTextController!.text.length);
        });
        safeSetState(() {
          _model.tituloTextController?.text = widget!.materiaDoc!.tituloMateria;
          _model.tituloTextController?.selection = TextSelection.collapsed(
              offset: _model.tituloTextController!.text.length);
        });
        safeSetState(() {
          _model.conteudoTextController?.text =
              widget!.materiaDoc!.conteudoMateria;
          _model.conteudoTextController?.selection = TextSelection.collapsed(
              offset: _model.conteudoTextController!.text.length);
        });
        safeSetState(() {
          _model.dropDownCategoriaValueController?.value =
              widget!.materiaDoc!.categoria;
        });
        safeSetState(() {
          _model.destaqueValue = widget!.materiaDoc!.materiaDestaque;
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.descricaoFotoTextController ??= TextEditingController();
    _model.descricaoFotoFocusNode ??= FocusNode();

    _model.creditosImgTextController ??= TextEditingController();
    _model.creditosImgFocusNode ??= FocusNode();

    _model.escritoPorTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      'Redação ${FFAppState().fonteMeinforma.where((e) => e.nome == _model.dropDownFonteValue).toList().first.nome}',
      'Redação meencontra',
    ));
    _model.escritoPorFocusNode ??= FocusNode();

    _model.tituloTextController ??= TextEditingController();
    _model.tituloFocusNode ??= FocusNode();

    _model.conteudoTextController ??= TextEditingController();
    _model.conteudoFocusNode ??= FocusNode();

    _model.destaqueValue = false;
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
        title: 'cadastrarMateria',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CADASTRAR_MATERIA_arrow_back_ios_rounded');
                  context.pop();
                },
              ),
              title: Text(
                'Nova matéria',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 800.0,
                  ),
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
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
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
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
                                            padding: EdgeInsets.all(4.0),
                                            tabs: [
                                              Tab(
                                                text: 'URL',
                                              ),
                                              Tab(
                                                text: 'imagem',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {
                                                  logFirebaseEvent(
                                                      'CADASTRAR_MATERIA_PAGE_url_image_ON_TAP');
                                                  _model.tabBarb = 0;
                                                  safeSetState(() {});
                                                },
                                                () async {
                                                  logFirebaseEvent(
                                                      'CADASTRAR_MATERIA_upload_image_ON_TAP');
                                                  _model.tabBarb = 1;
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController1,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'URL da imagem no seu site',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CADASTRAR_MATERIA_PAGE_uploadImg_ON_TAP');
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1080.00,
                                                    maxHeight: 1080.00,
                                                    imageQuality: 90,
                                                    includeDimensions: true,
                                                    mediaSource: MediaSource
                                                        .photoGallery,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading1 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading1 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile1 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    children: [
                                                      if (_model.uploadedLocalFile1 ==
                                                              null ||
                                                          (_model
                                                                  .uploadedLocalFile1
                                                                  .bytes
                                                                  ?.isEmpty ??
                                                              true))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/il24hbpde2nh/informame.png',
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if (_model.uploadedLocalFile1 !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile1
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false))
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.memory(
                                                            _model.uploadedLocalFile1
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            fit: BoxFit.contain,
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
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          controller: _model
                                              .descricaoFotoTextController,
                                          focusNode:
                                              _model.descricaoFotoFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'De uma descrição da imagem',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 2,
                                          minLines: 1,
                                          validator: _model
                                              .descricaoFotoTextControllerValidator
                                              .asValidator(context),
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.creditosImgTextController,
                                          focusNode:
                                              _model.creditosImgFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'De quem é os créditos da imagem?',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 5,
                                          minLines: 1,
                                          validator: _model
                                              .creditosImgTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller: _model
                                          .dropDownCategoriaValueController ??=
                                      FormFieldController<String>(null),
                                  options: FFAppConstants.CategoriaMaterias,
                                  onChanged: (val) => safeSetState(() =>
                                      _model.dropDownCategoriaValue = val),
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Escolha uma categoria',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownFonteValueController ??=
                                          FormFieldController<String>(null),
                                  options: FFAppState()
                                      .fonteMeinforma
                                      .map((e) => e.nome)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.dropDownFonteValue = val),
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Escolha a fonte',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                TextFormField(
                                  controller: _model.escritoPorTextController,
                                  focusNode: _model.escritoPorFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Escrita por...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Redação meencontra',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .escritoPorTextControllerValidator
                                      .asValidator(context),
                                ),
                                TextFormField(
                                  controller: _model.tituloTextController,
                                  focusNode: _model.tituloFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Titulo da matéria',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 5,
                                  minLines: 1,
                                  validator: _model
                                      .tituloTextControllerValidator
                                      .asValidator(context),
                                ),
                                TextFormField(
                                  controller: _model.conteudoTextController,
                                  focusNode: _model.conteudoFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Conteudo da matéria',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    alignLabelWithHint: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 20,
                                  minLines: 4,
                                  validator: _model
                                      .conteudoTextControllerValidator
                                      .asValidator(context),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Matéria destaque?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.destaqueValue!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.destaqueValue = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                      ),
                                      Flexible(
                                        child: Text(
                                          _model.destaqueValue == true
                                              ? 'Sim'
                                              : 'Não',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    _model.destaqueValue == true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                fontSize:
                                                    _model.destaqueValue == true
                                                        ? 14.0
                                                        : 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    if (widget!.status == Status.novo) {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CADASTRAR_MATERIA_PUBLICAR_MATRIA_BTN_ON');
                                          var _shouldSetState = false;
                                          {
                                            safeSetState(() =>
                                                _model.isDataUploading2 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile1
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.uploadedLocalFile1]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                              );
                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading2 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile2 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl2 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          var materiasRecordReference =
                                              MateriasRecord.createDoc(widget!
                                                  .materiaDoc!.parentReference);
                                          await materiasRecordReference.set({
                                            ...createMateriasRecordData(
                                              creditosImagem: _model
                                                  .creditosImgTextController
                                                  .text,
                                              escritoPor: _model
                                                  .escritoPorTextController
                                                  .text,
                                              tituloMateria: _model
                                                  .tituloTextController.text,
                                              conteudoMateria: _model
                                                  .conteudoTextController.text,
                                              categoria:
                                                  _model.dropDownCategoriaValue,
                                              materiaDestaque:
                                                  _model.destaqueValue,
                                              dataPublicacaoMateria:
                                                  getCurrentTimestamp,
                                              imagemCapa: _model.tabBarb == 1
                                                  ? _model.uploadedFileUrl2
                                                  : _model.textController1.text,
                                              descricaoImg: _model
                                                  .descricaoFotoTextController
                                                  .text,
                                              notificacaoEnviada: false,
                                              fonteImprensa:
                                                  _model.dropDownFonteValue,
                                              logoUrl: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .img,
                                              instagram: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .arroba,
                                              site: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .site,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'N_Categorias_publicadas': [1],
                                              },
                                            ),
                                          });
                                          _model.materiaRef = MateriasRecord
                                              .getDocumentFromData({
                                            ...createMateriasRecordData(
                                              creditosImagem: _model
                                                  .creditosImgTextController
                                                  .text,
                                              escritoPor: _model
                                                  .escritoPorTextController
                                                  .text,
                                              tituloMateria: _model
                                                  .tituloTextController.text,
                                              conteudoMateria: _model
                                                  .conteudoTextController.text,
                                              categoria:
                                                  _model.dropDownCategoriaValue,
                                              materiaDestaque:
                                                  _model.destaqueValue,
                                              dataPublicacaoMateria:
                                                  getCurrentTimestamp,
                                              imagemCapa: _model.tabBarb == 1
                                                  ? _model.uploadedFileUrl2
                                                  : _model.textController1.text,
                                              descricaoImg: _model
                                                  .descricaoFotoTextController
                                                  .text,
                                              notificacaoEnviada: false,
                                              fonteImprensa:
                                                  _model.dropDownFonteValue,
                                              logoUrl: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .img,
                                              instagram: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .arroba,
                                              site: FFAppState()
                                                  .fonteMeinforma
                                                  .where((e) =>
                                                      e.nome ==
                                                      _model.dropDownFonteValue)
                                                  .toList()
                                                  .first
                                                  .site,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'N_Categorias_publicadas': [1],
                                              },
                                            ),
                                          }, materiasRecordReference);
                                          _shouldSetState = true;

                                          await _model.materiaRef!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'N_Categorias_publicadas':
                                                    FieldValue.arrayUnion([1]),
                                              },
                                            ),
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Matéria criada com sucesso'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_model.destaqueValue == true) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: Text(
                                                                'Enviar notificação?'),
                                                            content: Text(
                                                                'Essa matéria é um destaque, quer enviar uma notificação para informar os usuarios? *lembrence de usar esse recurso com cuidado'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Não enviar'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Sim, enviar notificação'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              _model.todosUsuarios =
                                                  await queryUsersRecordOnce();
                                              _shouldSetState = true;
                                              triggerPushNotification(
                                                notificationTitle: 'meinforma',
                                                notificationText: _model
                                                    .tituloTextController.text,
                                                notificationImageUrl:
                                                    _model.imgLogoMeinforma,
                                                notificationSound: 'default',
                                                userRefs: _model.todosUsuarios!
                                                    .map((e) => e.reference)
                                                    .toList(),
                                                initialPageName:
                                                    'meinformaDetalhesNoticia',
                                                parameterData: {
                                                  'materiadoc': _model
                                                      .materiaRef?.reference,
                                                },
                                              );

                                              await _model.materiaRef!.reference
                                                  .update(
                                                      createMateriasRecordData(
                                                notificacaoEnviada: true,
                                              ));
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text(
                                                          'Notificação enviada'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );

                                              context.pushNamed('meInforma');

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              context.pushNamed('meInforma');

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          } else {
                                            context.pushNamed('Feed');

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Publicar matéria',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    } else {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'CADASTRAR_MATERIA_SALVAR_ALTERAES_BTN_ON');
                                          {
                                            safeSetState(() =>
                                                _model.isDataUploading3 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];
                                            var selectedMedia =
                                                <SelectedFile>[];
                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles = _model
                                                      .uploadedLocalFile1
                                                      .bytes!
                                                      .isNotEmpty
                                                  ? [_model.uploadedLocalFile1]
                                                  : <FFUploadedFile>[];
                                              selectedMedia =
                                                  selectedFilesFromUploadedFiles(
                                                selectedUploadedFiles,
                                              );
                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading3 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile3 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl3 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          await widget!.materiaDoc!.reference
                                              .update(createMateriasRecordData(
                                            creditosImagem: _model
                                                .creditosImgTextController.text,
                                            escritoPor: _model
                                                .escritoPorTextController.text,
                                            tituloMateria: _model
                                                .tituloTextController.text,
                                            conteudoMateria: _model
                                                .conteudoTextController.text,
                                            categoria:
                                                _model.dropDownCategoriaValue,
                                            materiaDestaque:
                                                _model.destaqueValue,
                                            imagemCapa: _model.textController1
                                                            .text !=
                                                        null &&
                                                    _model.textController1
                                                            .text !=
                                                        ''
                                                ? _model.textController1.text
                                                : _model.uploadedFileUrl3,
                                            descricaoImg: _model
                                                .descricaoFotoTextController
                                                .text,
                                            logoUrl:
                                                _model.textController1.text,
                                          ));

                                          context.pushNamed(
                                            'meinformaDetalhesNoticia',
                                            queryParameters: {
                                              'materiadoc': serializeParam(
                                                widget!.materiaDoc,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'materiadoc': widget!.materiaDoc,
                                            },
                                          );
                                        },
                                        text: 'Salvar alterações',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ]
                                  .divide(SizedBox(height: 24.0))
                                  .around(SizedBox(height: 24.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
