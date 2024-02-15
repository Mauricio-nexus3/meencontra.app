import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'criar_nova_materia_model.dart';
export 'criar_nova_materia_model.dart';

class CriarNovaMateriaWidget extends StatefulWidget {
  const CriarNovaMateriaWidget({
    super.key,
    required this.goRef,
  });

  final DocumentReference? goRef;

  @override
  State<CriarNovaMateriaWidget> createState() => _CriarNovaMateriaWidgetState();
}

class _CriarNovaMateriaWidgetState extends State<CriarNovaMateriaWidget> {
  late CriarNovaMateriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarNovaMateriaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.modoExibicao = false;
      });
    });

    _model.descricaoFotoController ??= TextEditingController();
    _model.descricaoFotoFocusNode ??= FocusNode();

    _model.creditosImgController ??= TextEditingController();
    _model.creditosImgFocusNode ??= FocusNode();

    _model.escritoPorController ??= TextEditingController();
    _model.escritoPorFocusNode ??= FocusNode();

    _model.tituloController ??= TextEditingController();
    _model.tituloFocusNode ??= FocusNode();

    _model.conteudoController ??= TextEditingController();
    _model.conteudoFocusNode ??= FocusNode();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.appbarGrupoMeModel,
                    updateCallback: () => setState(() {}),
                    child: AppbarGrupoMeWidget(
                      viewLeft:
                          _model.modoExibicao == true ? 'default' : 'fechar',
                      viewRight:
                          _model.modoExibicao == true ? 'visualizar' : 'criar',
                      title: _model.modoExibicao == true
                          ? 'Modo exibição'
                          : 'informa - Nova matéria',
                      tabbar: 'meinforma',
                      corText: _model.modoExibicao == true
                          ? FlutterFlowTheme.of(context).accent1
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      perfil: valueOrDefault(currentUserDocument?.perfil, ''),
                      iconLeft: () async {
                        context.safePop();
                      },
                      iconRight: () async {
                        if (_model.modoExibicao == true) {
                          setState(() {
                            _model.modoExibicao = false;
                          });
                        } else {
                          setState(() {
                            _model.modoExibicao = true;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (_model.modoExibicao == true) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 300.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 400.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 600.0;
                                        } else {
                                          return 650.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.uploadedFileUrl,
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfZ4oVWFXlvtkXcmMMnX-b2gCgJgRAgXD_3NdgtywBbd3YEGB31q0lS2SE5XkJ8uJmLyo&usqp=CAU',
                                          ),
                                          width: double.infinity,
                                          height: 300.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 24.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          icon: Icon(
                                            FFIcons.kpencil,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${_model.descricaoFotoController.text}— Foto:${_model.creditosImgController.text}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 1020.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '● ${_model.dropDownCategoriaValue}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFFB60924),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Por ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        _model.escritoPorController.text,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${dateTimeFormat(
                                          'd/M/y',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )} ${dateTimeFormat(
                                          'Hm',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      Text(
                                        ' - ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                      Text(
                                        'Atualizado há ${dateTimeFormat(
                                          'relative',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _model.tituloController.text,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                  ),
                                  Text(
                                    _model.conteudoController.text,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
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
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfZ4oVWFXlvtkXcmMMnX-b2gCgJgRAgXD_3NdgtywBbd3YEGB31q0lS2SE5XkJ8uJmLyo&usqp=CAU',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              'Redação TVGO',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.facebook,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.instagram,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.youtube,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.chrome,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
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
                        ],
                      );
                    } else {
                      return Container(
                        constraints: BoxConstraints(
                          maxWidth: 1020.0,
                        ),
                        decoration: BoxDecoration(),
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
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia = await selectMedia(
                                        maxWidth: 1600.00,
                                        maxHeight: 1200.00,
                                        imageQuality: 100,
                                        includeDimensions: true,
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

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
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          if (_model.uploadedFileUrl == null ||
                                              _model.uploadedFileUrl == '')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfZ4oVWFXlvtkXcmMMnX-b2gCgJgRAgXD_3NdgtywBbd3YEGB31q0lS2SE5XkJ8uJmLyo&usqp=CAU',
                                                width: double.infinity,
                                                height: 300.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (_model.uploadedFileUrl != null &&
                                              _model.uploadedFileUrl != '')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.memory(
                                                _model.uploadedLocalFile
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                width: double.infinity,
                                                height: 300.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 24.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                icon: Icon(
                                                  FFIcons.kpencil,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
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
                                          24.0, 8.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .descricaoFotoController,
                                              focusNode:
                                                  _model.descricaoFotoFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'De uma descrição da imagem',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            0.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              maxLines: 2,
                                              minLines: 1,
                                              validator: _model
                                                  .descricaoFotoControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          TextFormField(
                                            controller:
                                                _model.creditosImgController,
                                            focusNode:
                                                _model.creditosImgFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'De quem é os créditos da imagem?',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            maxLines: 5,
                                            minLines: 1,
                                            validator: _model
                                                .creditosImgControllerValidator
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownCategoriaValueController ??=
                                          FormFieldController<String>(null),
                                      options: [
                                        'Comunidade',
                                        'Meio ambiente',
                                        'Segurança',
                                        'Economia',
                                        'Politica',
                                        'Eventos',
                                        'Educação',
                                        'Saúde',
                                        'Esporte',
                                        'Tempo',
                                        'Transporte',
                                        'Arte/Cultura',
                                        'Cidades',
                                        'Internacional'
                                      ],
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownCategoriaValue = val),
                                      width: double.infinity,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Escolha uma categoria',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    TextFormField(
                                      controller: _model.escritoPorController,
                                      focusNode: _model.escritoPorFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'A matéria esta sendo escrita por...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                          .bodyMedium,
                                      validator: _model
                                          .escritoPorControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model.tituloController,
                                      focusNode: _model.tituloFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Escreva o titulo da matéria',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 5,
                                      minLines: 1,
                                      validator: _model
                                          .tituloControllerValidator
                                          .asValidator(context),
                                    ),
                                    TextFormField(
                                      controller: _model.conteudoController,
                                      focusNode: _model.conteudoFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Escreva o conteudo da matéria',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        alignLabelWithHint: true,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 20,
                                      minLines: 4,
                                      validator: _model
                                          .conteudoControllerValidator
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
                                                .bodyMedium,
                                          ),
                                          Switch.adaptive(
                                            value: _model.destaqueValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .destaqueValue = newValue!);
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
                                          Text(
                                            _model.destaqueValue == true
                                                ? 'Sim'
                                                : 'Não',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: _model.destaqueValue ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent1,
                                                  fontSize:
                                                      _model.destaqueValue ==
                                                              true
                                                          ? 14.0
                                                          : 12.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;

                                          var materiasRecordReference =
                                              MateriasRecord.createDoc(
                                                  widget.goRef!);
                                          await materiasRecordReference.set({
                                            ...createMateriasRecordData(
                                              creditosImagem: _model
                                                  .creditosImgController.text,
                                              escritoPor: _model
                                                  .escritoPorController.text,
                                              tituloMateria:
                                                  _model.tituloController.text,
                                              conteudoMateria: _model
                                                  .conteudoController.text,
                                              categoria:
                                                  _model.dropDownCategoriaValue,
                                              materiaDestaque:
                                                  _model.destaqueValue,
                                              dataPublicacaoMateria:
                                                  getCurrentTimestamp,
                                              imagemCapa:
                                                  _model.uploadedFileUrl,
                                              descricaoImg: _model
                                                  .descricaoFotoController.text,
                                              notificacaoEnviada: false,
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
                                                  .creditosImgController.text,
                                              escritoPor: _model
                                                  .escritoPorController.text,
                                              tituloMateria:
                                                  _model.tituloController.text,
                                              conteudoMateria: _model
                                                  .conteudoController.text,
                                              categoria:
                                                  _model.dropDownCategoriaValue,
                                              materiaDestaque:
                                                  _model.destaqueValue,
                                              dataPublicacaoMateria:
                                                  getCurrentTimestamp,
                                              imagemCapa:
                                                  _model.uploadedFileUrl,
                                              descricaoImg: _model
                                                  .descricaoFotoController.text,
                                              notificacaoEnviada: false,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'N_Categorias_publicadas': [1],
                                              },
                                            ),
                                          }, materiasRecordReference);
                                          _shouldSetState = true;

                                          await widget.goRef!.update({
                                            ...mapToFirestore(
                                              {
                                                'MateriasPublicadas':
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
                                                notificationTitle:
                                                    'meinforma: ${_model.tituloController.text}',
                                                notificationText: _model
                                                    .conteudoController.text,
                                                notificationImageUrl:
                                                    _model.uploadedFileUrl,
                                                notificationSound: 'default',
                                                userRefs: _model.todosUsuarios!
                                                    .map((e) => e.reference)
                                                    .toList(),
                                                initialPageName:
                                                    'meinformaDetalhesNoticia',
                                                parameterData: {
                                                  'materiaRef': _model
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

                                              context.pushNamed(
                                                'TVGON',
                                                queryParameters: {
                                                  'imprensaRef': serializeParam(
                                                    widget.goRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed(
                                                'TVGON',
                                                queryParameters: {
                                                  'imprensaRef': serializeParam(
                                                    widget.goRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          } else {
                                            context.pushNamed(
                                              'TVGON',
                                              queryParameters: {
                                                'imprensaRef': serializeParam(
                                                  widget.goRef,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
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
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 24.0))
                                      .around(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
