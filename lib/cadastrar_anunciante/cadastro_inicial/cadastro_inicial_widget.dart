import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cadastro_inicial_model.dart';
export 'cadastro_inicial_model.dart';

class CadastroInicialWidget extends StatefulWidget {
  const CadastroInicialWidget({super.key});

  @override
  State<CadastroInicialWidget> createState() => _CadastroInicialWidgetState();
}

class _CadastroInicialWidgetState extends State<CadastroInicialWidget> {
  late CadastroInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroInicialModel());

    _model.nomeFantasiaObrigatorioController ??= TextEditingController();
    _model.nomeFantasiaObrigatorioFocusNode ??= FocusNode();

    _model.whatsComercialController ??= TextEditingController();
    _model.whatsComercialFocusNode ??= FocusNode();

    _model.enderecoController ??= TextEditingController();
    _model.enderecoFocusNode ??= FocusNode();

    _model.cidadeController ??= TextEditingController();
    _model.cidadeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.cidadeController?.text = 'Guaíba';
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
              context.pushNamed('Feed');
            },
          ),
          title: Text(
            'Cadastrar anunciante',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
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
                maxWidth: 1020.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: _model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != ''
                                  ? FlutterFlowTheme.of(context).secondary
                                  : FlutterFlowTheme.of(context).primary,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/emptyState@2x.png',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6.0,
                                  color: Color(0x0D000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  maxWidth: 1080.00,
                                  maxHeight: 1080.00,
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    _model.uploadedFileUrl,
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO3Ezfigq4ptVp4wTeixdD5XwWZIxMoHm_Ca7inX3uYQ&s',
                                  ),
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          if (_model.uploadedFileUrl == null ||
                              _model.uploadedFileUrl == '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Insira seu logo',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: TextFormField(
                        controller: _model.nomeFantasiaObrigatorioController,
                        focusNode: _model.nomeFantasiaObrigatorioFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: '*Nome',
                          hintText: 'Nome Fantasia*',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                          prefixIcon: Icon(
                            FFIcons.kshop,
                            color: FlutterFlowTheme.of(context).accent2,
                            size: 20.0,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model
                            .nomeFantasiaObrigatorioControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _model.whatsComercialController,
                          focusNode: _model.whatsComercialFocusNode,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.send,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: '*Whatsapp comercial',
                            hintText: '519xxxxxxxx',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 32.0, 20.0, 12.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          validator: _model.whatsComercialControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.whatsComercialMask],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: TextFormField(
                        controller: _model.enderecoController,
                        focusNode: _model.enderecoFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Endereço completo',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: 'R. São José, nº 1000. Centro ',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.enderecoControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: TextFormField(
                        controller: _model.cidadeController,
                        focusNode: _model.cidadeFocusNode,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Cidade',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.cidadeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: StreamBuilder<List<CategoriasRecord>>(
                            stream: queryCategoriasRecord(
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
                                  dropCategoriaCategoriasRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropCategoriaValueController ??=
                                        FormFieldController<String>(null),
                                options: dropCategoriaCategoriasRecordList
                                    .map((e) => e.nomeDaCategoria)
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.dropCategoriaValue = val),
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Categoria',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: StreamBuilder<List<SubCategoriasRecord>>(
                            stream: querySubCategoriasRecord(
                              queryBuilder: (subCategoriasRecord) =>
                                  subCategoriasRecord.where(
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
                              List<SubCategoriasRecord>
                                  dropDownSubCatg01ObrigatorioSubCategoriasRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model
                                        .dropDownSubCatg01ObrigatorioValueController ??=
                                    FormFieldController<String>(null),
                                options:
                                    dropDownSubCatg01ObrigatorioSubCategoriasRecordList
                                        .map((e) => e.nomeSubCategoria)
                                        .toList(),
                                onChanged: (val) => setState(() => _model
                                    .dropDownSubCatg01ObrigatorioValue = val),
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Escolha seu serviço',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                disabled: _model.dropCategoriaValue == null ||
                                    _model.dropCategoriaValue == '',
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 16.0,
                              ),
                              Text(
                                'Não encontrou sua categoria?',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Comunicar',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context).roxo,
                                    ),
                              ),
                              Icon(
                                FFIcons.ksuporte,
                                color: FlutterFlowTheme.of(context)
                                    .meencontraAntigo,
                                size: 16.0,
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if ((_model.uploadedFileUrl != null &&
                                  _model.uploadedFileUrl != '') &&
                              (_model.nomeFantasiaObrigatorioController.text !=
                                      null &&
                                  _model.nomeFantasiaObrigatorioController
                                          .text !=
                                      '') &&
                              (_model.whatsComercialController.text != null &&
                                  _model.whatsComercialController.text != '') &&
                              (_model.enderecoController.text != null &&
                                  _model.enderecoController.text != '') &&
                              (_model.dropCategoriaValue != null &&
                                  _model.dropCategoriaValue != '') &&
                              (_model.dropDownSubCatg01ObrigatorioValue !=
                                      null &&
                                  _model.dropDownSubCatg01ObrigatorioValue !=
                                      '')) {
                            var anuncianteRecordReference =
                                AnuncianteRecord.collection.doc();
                            await anuncianteRecordReference
                                .set(createAnuncianteRecordData(
                              logo: _model.uploadedFileUrl,
                              nomeFantasia:
                                  _model.nomeFantasiaObrigatorioController.text,
                              whatsComercial:
                                  _model.whatsComercialController.text,
                              aid: random_data.randomString(
                                28,
                                28,
                                true,
                                true,
                                true,
                              ),
                              enderecoCompleto: _model.enderecoController.text,
                              cidade: _model.cidadeController.text,
                              categoria: _model.dropCategoriaValue,
                              nomeSubCategoria01:
                                  _model.dropDownSubCatg01ObrigatorioValue,
                              resgatado: false,
                              planoAssinatura: 'gratis',
                              planoModelo01: 'gratis',
                              nomeSubCategoria02: '',
                              statusCadastro: '',
                              contaCriada: getCurrentTimestamp,
                              cor: FlutterFlowTheme.of(context).primary,
                            ));
                            _model.adminAnuncianteRef =
                                AnuncianteRecord.getDocumentFromData(
                                    createAnuncianteRecordData(
                                      logo: _model.uploadedFileUrl,
                                      nomeFantasia: _model
                                          .nomeFantasiaObrigatorioController
                                          .text,
                                      whatsComercial:
                                          _model.whatsComercialController.text,
                                      aid: random_data.randomString(
                                        28,
                                        28,
                                        true,
                                        true,
                                        true,
                                      ),
                                      enderecoCompleto:
                                          _model.enderecoController.text,
                                      cidade: _model.cidadeController.text,
                                      categoria: _model.dropCategoriaValue,
                                      nomeSubCategoria01: _model
                                          .dropDownSubCatg01ObrigatorioValue,
                                      resgatado: false,
                                      planoAssinatura: 'gratis',
                                      planoModelo01: 'gratis',
                                      nomeSubCategoria02: '',
                                      statusCadastro: '',
                                      contaCriada: getCurrentTimestamp,
                                      cor: FlutterFlowTheme.of(context).primary,
                                    ),
                                    anuncianteRecordReference);
                            _shouldSetState = true;
                            if (valueOrDefault(
                                    currentUserDocument?.perfil, '') ==
                                'Admin') {
                              var confirmDialogResponse = await showDialog<
                                      bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text('Cadastrado com sucesso'),
                                          content:
                                              Text('O que quer fazer agora?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Pagina inicial'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text(
                                                  'Cadastrar outro negócio'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ) ??
                                  false;
                              if (confirmDialogResponse) {
                                context.pushNamed('CadastroInicial');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                context.pushNamed('Feed');

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              context.pushNamed(
                                'AnuncianteCopy',
                                queryParameters: {
                                  'documentoRefAnunciante': serializeParam(
                                    _model.adminAnuncianteRef,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'documentoRefAnunciante':
                                      _model.adminAnuncianteRef,
                                },
                              );
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('Campos obrigatórios'),
                                    content: Text(
                                        'Todos os campos dessa sessão são obrigatórios'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
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
                        text: 'Cadastrar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: EdgeInsets.all(0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .around(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
