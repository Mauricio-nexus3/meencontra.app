import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'criar_perfil_model.dart';
export 'criar_perfil_model.dart';

class CriarPerfilWidget extends StatefulWidget {
  const CriarPerfilWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<CriarPerfilWidget> createState() => _CriarPerfilWidgetState();
}

class _CriarPerfilWidgetState extends State<CriarPerfilWidget> {
  late CriarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarPerfilModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.statusCastro = 'perfil';
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.whatsappaController ??= TextEditingController();
    _model.whatsappaFocusNode ??= FocusNode();

    _model.tFildOutroController ??= TextEditingController();
    _model.tFildOutroFocusNode ??= FocusNode();

    _model.conviteAnuncianteController ??= TextEditingController();
    _model.conviteAnuncianteFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
          child: Builder(
            builder: (context) {
              if (_model.statusCastro == 'perfil') {
                return Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 800.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      _model.uploadedFileUrl != null &&
                                              _model.uploadedFileUrl != ''
                                          ? _model.uploadedFileUrl
                                          : 'https://surgassociates.com/wp-content/uploads/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg',
                                      'https://surgassociates.com/wp-content/uploads/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 1080.00,
                                      maxHeight: 1080.00,
                                      allowPhoto: true,
                                      includeBlurHash: true,
                                      pickerFontFamily: 'Inter',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
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
                                  text: 'Escolher foto de perfil',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.nomeController,
                                      focusNode: _model.nomeFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Seu nome',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
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
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      keyboardType: TextInputType.name,
                                      validator: _model.nomeControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.whatsappaController,
                                    focusNode: _model.whatsappaFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Whatsapp',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
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
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .whatsappaControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.whatsappaMask],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gênero',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                    Text(
                                      '*Isso não será divulgado em seu perfil',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownGeneroValueController ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          'Masculino',
                                          'Feminino',
                                          'Outro',
                                          'Prefiro não dizer'
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.dropDownGeneroValue = val),
                                        width: double.infinity,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'Seu gênero',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    if (_model.dropDownGeneroValue == 'Outro')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.tFildOutroController,
                                          focusNode: _model.tFildOutroFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Por favor, digite sua identidade de gênero aqui',
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
                                                        .accent1,
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
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .tFildOutroControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.info_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        size: 14.0,
                                      ),
                                      Flexible(
                                        child: RichText(
                                          textScaleFactor:
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Ao informar seu gênero nos ajuda a oferecer anúncios, vagas de emprego e recomendações que são mais significativas para você.\nLembramos que a sua ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: 'privacidade',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        context.pushNamed(
                                                          'LinkExterno',
                                                          queryParameters: {
                                                            'linkExterno':
                                                                serializeParam(
                                                              'https://meencontra.com.br/politica-de-privacidade/',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                              ),
                                              TextSpan(
                                                text:
                                                    ' é fundamental para nós, e todas as informações fornecidas serão tratadas com ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: 'total confidencialidade',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' e de acordo com nossa política de privacidade.',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        if ((isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible) ==
                            false)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).accent1,
                                  ),
                                  child: Checkbox(
                                    value: _model
                                        .liAceitoPoliticaTermosValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.liAceitoPoliticaTermosValue =
                                              newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                Flexible(
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Ao continuar, você concorda com os  ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: 'Termos de uso ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              context.pushNamed('TermosDeUso');
                                            },
                                        ),
                                        TextSpan(
                                          text: 'e ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: 'Politica de privacidade',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              context.pushNamed(
                                                  'PoliticaPrivacidade');
                                            },
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.nomeController.text == null ||
                                _model.nomeController.text == '') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Campo nome  vazio'),
                                      content:
                                          Text('Por favor diga o seu nome'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Entendi'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (_model.whatsappaController.text ==
                                    null ||
                                _model.whatsappaController.text == '') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Whatsapp não preenchido'),
                                      content: Text(
                                          'Por favor coloque seu whatsapp'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Entendi'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (_model.liAceitoPoliticaTermosValue ==
                                false) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Confirme os termos de uso'),
                                      content: Text(
                                          'Confirme que leu e aceita os termos de uso e politica de privacidade'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Entendi'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (_model.dropDownGeneroValue == null ||
                                _model.dropDownGeneroValue == '') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Genero não selecionado'),
                                      content: Text(
                                          'Escolha ao menos uma opção de genero'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Entendi'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (_model.uploadedFileUrl == null ||
                                _model.uploadedFileUrl == '') {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Foto de perfil'),
                                      content:
                                          Text('Escolha sua foto de perfil'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Entendi'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              setState(() {
                                _model.statusCastro = 'localizacao';
                              });
                            }
                          },
                          text: 'Avançar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                );
              } else if (_model.statusCastro == 'localizacao') {
                return Container(
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.network(
                          'https://live.staticflickr.com/2113/2292243983_890c58db93_b.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x33000000), Color(0x4C000000)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 800.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= 'Guaíba',
                                  ),
                                  options: ['Guaíba'],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue = val),
                                  width: 100.0,
                                  height: 45.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  hintText: 'Localização',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                  fillColor: Color(0x34FFFFFF),
                                  elevation: 0.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kpikerMap,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Text(
                                          'Guaíba',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                    Text(
                                      'Na palma da sua mão',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.userRef!.update({
                                      ...createUsersRecordData(
                                        displayName: _model.nomeController.text,
                                        photoUrl: _model.uploadedFileUrl,
                                        liAceitoTermosPrivacidade: true,
                                        whatsapp:
                                            _model.whatsappaController.text,
                                        genero: _model.dropDownGeneroValue,
                                        isAnunciante: false,
                                        cadastroAnuncianteAndamento: false,
                                        statusCadastroAnunciante: 'Usuario',
                                        isImprensa: false,
                                        localidade: _model.dropDownValue,
                                        perfil: 'Usuario',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'ultima_notificao_lida':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });

                                    context.pushNamed('Feed');
                                  },
                                  text: 'Confirmar',
                                  options: FFButtonOptions(
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(8.0),
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
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Escolha o modo',
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      ClipOval(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 100.0,
                                            sigmaY: 100.0,
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xD5272B2D),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.wb_sunny_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 34.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Tema claro',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Código promocional de Anunciante',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.9, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Esse espaço é para você  insirir o código caso tenha sido indicado por algum nossos anunciantes. \nAlém de  aproveitar descontos exclusivos e outras vantagens, você pode aumentar a popularidade desse estabelecimento.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 28.0, 0.0, 18.0),
                                      child: TextFormField(
                                        controller:
                                            _model.conviteAnuncianteController,
                                        focusNode:
                                            _model.conviteAnuncianteFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Opcional',
                                          hintText:
                                              'Digite o código de convite',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .inputLightGray,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding: EdgeInsets.all(6.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .conviteAnuncianteControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.9, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          'Caso não tenha um código, não se preocupe! Você ainda pode se cadastrar normalmente e aproveitar todas as funcionalidades do nosso aplicativo. Estamos felizes em ter você aqui!\"',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
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
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
