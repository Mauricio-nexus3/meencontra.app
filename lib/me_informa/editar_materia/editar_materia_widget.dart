import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'editar_materia_model.dart';
export 'editar_materia_model.dart';

class EditarMateriaWidget extends StatefulWidget {
  const EditarMateriaWidget({
    super.key,
    required this.materiaRef,
  });

  final DocumentReference? materiaRef;

  @override
  State<EditarMateriaWidget> createState() => _EditarMateriaWidgetState();
}

class _EditarMateriaWidgetState extends State<EditarMateriaWidget> {
  late EditarMateriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarMateriaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.modoExibicao = false;
      });
    });

    _model.descricaoFotoFocusNode ??= FocusNode();

    _model.creditosImgFocusNode ??= FocusNode();

    _model.escritoPorFocusNode ??= FocusNode();

    _model.tituloFocusNode ??= FocusNode();

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

    return StreamBuilder<MateriasRecord>(
      stream: MateriasRecord.getDocument(widget.materiaRef!),
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
        final editarMateriaMateriasRecord = snapshot.data!;
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
                          viewLeft: _model.modoExibicao == true
                              ? 'default'
                              : 'fechar',
                          viewRight: _model.modoExibicao == true
                              ? 'visualizar'
                              : 'criar',
                          title: _model.modoExibicao == true
                              ? 'Modo exibição'
                              : 'informa - Editar matéria',
                          tabbar: 'meinforma',
                          corText: _model.modoExibicao == true
                              ? FlutterFlowTheme.of(context).accent1
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          perfil:
                              valueOrDefault(currentUserDocument?.perfil, ''),
                          iconLeft: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('Cancelar as alterações?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: Text('Continuar alterado'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: Text('Sim, cancelar'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              context.safePop();
                              return;
                            } else {
                              return;
                            }
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
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 1020.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              _model.uploadedFileUrl != null &&
                                                      _model.uploadedFileUrl !=
                                                          ''
                                                  ? _model.uploadedFileUrl
                                                  : editarMateriaMateriasRecord
                                                      .imagemCapa,
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
                                                borderColor: Colors.transparent,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              _model.escritoPorController.text,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} ${dateTimeFormat(
                                                'Hm',
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                            Text(
                                              ' - ',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                    clipBehavior:
                                                        Clip.antiAlias,
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.facebook,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 24.0,
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 24.0,
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.youtube,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 24.0,
                                                  ),
                                                  FaIcon(
                                                    FontAwesomeIcons.chrome,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final selectedMedia =
                                              await selectMedia(
                                            maxWidth: 1600.00,
                                            maxHeight: 1200.00,
                                            imageQuality: 100,
                                            includeDimensions: true,
                                            mediaSource:
                                                MediaSource.photoGallery,
                                            multiImage: false,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  _model.uploadedFileUrl !=
                                                              null &&
                                                          _model.uploadedFileUrl !=
                                                              ''
                                                      ? _model.uploadedFileUrl
                                                      : editarMateriaMateriasRecord
                                                          .imagemCapa,
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 24.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    icon: Icon(
                                                      FFIcons.kpencil,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 8.0, 24.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                          .descricaoFotoController ??=
                                                      TextEditingController(
                                                    text:
                                                        editarMateriaMateriasRecord
                                                            .descricaoImg,
                                                  ),
                                                  focusNode: _model
                                                      .descricaoFotoFocusNode,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'De uma descrição da imagem',
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
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
                                                        UnderlineInputBorder(
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
                                                        UnderlineInputBorder(
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
                                                        UnderlineInputBorder(
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
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  maxLines: 2,
                                                  minLines: 1,
                                                  validator: _model
                                                      .descricaoFotoControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: _model
                                                        .creditosImgController ??=
                                                    TextEditingController(
                                                  text:
                                                      editarMateriaMateriasRecord
                                                          .creditosImagem,
                                                ),
                                                focusNode:
                                                    _model.creditosImgFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'De quem é os créditos da imagem?',
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
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
                                                      UnderlineInputBorder(
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
                                                      UnderlineInputBorder(
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
                                                      UnderlineInputBorder(
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
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownCategoriaValueController ??=
                                              FormFieldController<String>(
                                            _model.dropDownCategoriaValue ??=
                                                editarMateriaMateriasRecord
                                                    .categoria,
                                          ),
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
                                              _model.dropDownCategoriaValue =
                                                  val),
                                          width: double.infinity,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Escolha uma categoria',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.escritoPorController ??=
                                                  TextEditingController(
                                            text: editarMateriaMateriasRecord
                                                .escritoPor,
                                          ),
                                          focusNode: _model.escritoPorFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'A matéria esta sendo escrita por...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
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
                                                UnderlineInputBorder(
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
                                              .bodyMedium,
                                          validator: _model
                                              .escritoPorControllerValidator
                                              .asValidator(context),
                                        ),
                                        TextFormField(
                                          controller:
                                              _model.tituloController ??=
                                                  TextEditingController(
                                            text: editarMateriaMateriasRecord
                                                .tituloMateria,
                                          ),
                                          focusNode: _model.tituloFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Escreva o titulo da matéria',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
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
                                          controller:
                                              _model.conteudoController ??=
                                                  TextEditingController(
                                            text: editarMateriaMateriasRecord
                                                .conteudoMateria,
                                          ),
                                          focusNode: _model.conteudoFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Escreva o conteudo da matéria',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Switch.adaptive(
                                                value: _model.switchValue ??=
                                                    editarMateriaMateriasRecord
                                                        .materiaDestaque,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                      .switchValue = newValue!);
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
                                                _model.switchValue == true
                                                    ? 'Sim'
                                                    : 'Não',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: _model
                                                                  .switchValue ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      fontSize:
                                                          _model.switchValue ==
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
                                              await widget.materiaRef!.update(
                                                  createMateriasRecordData(
                                                creditosImagem: _model
                                                    .creditosImgController.text,
                                                escritoPor: _model
                                                    .escritoPorController.text,
                                                tituloMateria: _model
                                                    .tituloController.text,
                                                conteudoMateria: _model
                                                    .conteudoController.text,
                                                categoria: _model
                                                    .dropDownCategoriaValue,
                                                materiaDestaque:
                                                    _model.switchValue,
                                                imagemCapa: _model
                                                                .uploadedLocalFile !=
                                                            null &&
                                                        (_model
                                                                .uploadedLocalFile
                                                                .bytes
                                                                ?.isNotEmpty ??
                                                            false)
                                                    ? _model.uploadedFileUrl
                                                    : editarMateriaMateriasRecord
                                                        .imagemCapa,
                                                descricaoImg: _model
                                                    .creditosImgController.text,
                                              ));
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Matéria alterada com sucesso'),
                                                              content: Text(
                                                                  'O que quer fazer?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Ir para o perfil'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Ir para meinforma'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed('meInforma');
                                              } else {
                                                context.pushNamed(
                                                  'TVGON',
                                                  queryParameters: {
                                                    'imprensaRef':
                                                        serializeParam(
                                                      editarMateriaMateriasRecord
                                                          .parentReference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            text: 'Salvar alterações',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            );
                          }
                        },
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
