import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'suporte_model.dart';
export 'suporte_model.dart';

class SuporteWidget extends StatefulWidget {
  const SuporteWidget({
    super.key,
    required this.usuarioRef,
  });

  final DocumentReference? usuarioRef;

  @override
  State<SuporteWidget> createState() => _SuporteWidgetState();
}

class _SuporteWidgetState extends State<SuporteWidget>
    with TickerProviderStateMixin {
  late SuporteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0.0, 110.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuporteModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textFieldAssuntoController ??= TextEditingController();
    _model.textFieldAssuntoFocusNode ??= FocusNode();

    _model.textFieldConteudoController ??= TextEditingController();
    _model.textFieldConteudoFocusNode ??= FocusNode();

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Feed');
            },
          ),
          title: Text(
            'Suporte',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 650.0,
                  maxHeight: 800.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Text(
                            'Bem vindos a central de suporte',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).blackTextos,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Flexible(
                          child: FutureBuilder<UsersRecord>(
                            future:
                                UsersRecord.getDocumentOnce(widget.usuarioRef!),
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
                              final containerUsersRecord = snapshot.data!;
                              return Container(
                                height: 800.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          unselectedLabelStyle: TextStyle(),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          tabs: [
                                            Tab(
                                              text: 'Mensagem',
                                            ),
                                            Tab(
                                              text: 'FAQ',
                                            ),
                                          ],
                                          controller: _model.tabBarController,
                                          onTap: (i) async {
                                            [() async {}, () async {}][i]();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          controller: _model.tabBarController,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownTopicoValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: [
                                                          'Duvidas',
                                                          'Sugestão',
                                                          'Reportar erro'
                                                        ],
                                                        onChanged: (val) =>
                                                            setState(() => _model
                                                                    .dropDownTopicoValue =
                                                                val),
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        hintText:
                                                            'Escolha um tópico',
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        borderWidth: 0.0,
                                                        borderRadius: 0.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    12.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldAssuntoController,
                                                        focusNode: _model
                                                            .textFieldAssuntoFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Assunto',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .inputLightGray,
                                                              width: 1.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .textFieldAssuntoControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  6.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldConteudoController,
                                                        focusNode: _model
                                                            .textFieldConteudoFocusNode,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Digite aqui',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .inputLightGray,
                                                              width: 1.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        maxLines: 10,
                                                        validator: _model
                                                            .textFieldConteudoControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
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
                                                          final selectedMedia =
                                                              await selectMedia(
                                                            maxWidth: 1080.00,
                                                            maxHeight: 1080.00,
                                                            imageQuality: 90,
                                                            mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                            multiImage: false,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
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
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .add_a_photo_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 32.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Envie um print da tela',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation']!),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (_model.textFieldAssuntoController
                                                                      .text !=
                                                                  null &&
                                                              _model.textFieldAssuntoController
                                                                      .text !=
                                                                  '') {
                                                            var ticketSuporteRecordReference =
                                                                TicketSuporteRecord
                                                                    .collection
                                                                    .doc();
                                                            await ticketSuporteRecordReference
                                                                .set(
                                                                    createTicketSuporteRecordData(
                                                              topico: _model
                                                                  .dropDownTopicoValue,
                                                              assunto: _model
                                                                  .textFieldAssuntoController
                                                                  .text,
                                                              conteudo: _model
                                                                  .textFieldConteudoController
                                                                  .text,
                                                              printTela: _model
                                                                  .uploadedFileUrl,
                                                              ticket: random_data
                                                                  .randomString(
                                                                8,
                                                                10,
                                                                false,
                                                                false,
                                                                true,
                                                              ),
                                                              usuario:
                                                                  containerUsersRecord
                                                                      .displayName,
                                                              usuarioRef: widget
                                                                  .usuarioRef,
                                                              whatsapp:
                                                                  containerUsersRecord
                                                                      .whatsapp,
                                                              email:
                                                                  containerUsersRecord
                                                                      .email,
                                                            ));
                                                            _model.chamadoSuporte =
                                                                TicketSuporteRecord
                                                                    .getDocumentFromData(
                                                                        createTicketSuporteRecordData(
                                                                          topico:
                                                                              _model.dropDownTopicoValue,
                                                                          assunto: _model
                                                                              .textFieldAssuntoController
                                                                              .text,
                                                                          conteudo: _model
                                                                              .textFieldConteudoController
                                                                              .text,
                                                                          printTela:
                                                                              _model.uploadedFileUrl,
                                                                          ticket:
                                                                              random_data.randomString(
                                                                            8,
                                                                            10,
                                                                            false,
                                                                            false,
                                                                            true,
                                                                          ),
                                                                          usuario:
                                                                              containerUsersRecord.displayName,
                                                                          usuarioRef:
                                                                              widget.usuarioRef,
                                                                          whatsapp:
                                                                              containerUsersRecord.whatsapp,
                                                                          email:
                                                                              containerUsersRecord.email,
                                                                        ),
                                                                        ticketSuporteRecordReference);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Seu protocolo foi aberto'),
                                                                    content: Text(
                                                                        'Seu protocolo já se encontra em nossa base. Protocolo:${_model.chamadoSuporte?.ticket}'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            context.pushNamed(
                                                                'Feed');
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'A campos invalido'),
                                                                    content: Text(
                                                                        'Por favor preencher todos os campos corretamente'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                        text: 'Enviar ticket',
                                                        icon: Icon(
                                                          Icons.receipt_long,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 48.0,
                                                          padding:
                                                              EdgeInsets.all(
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
                                                                  ),
                                                          elevation: 4.0,
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
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableController1,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          'O meencontra é uma plataforma para encontrar novos clientes?',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Sim , com o meencontra.app seu produto/marca/serviço',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Sim , com o meencontra.app seu produto/marca/serviço está com uma alta exposição e possibilitando você encontrar novos clientes',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              true,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableController2,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          'Quais profissionais podem se cadastrar para ser anunciante no meencontra?',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Toda pessoa, negócio, comércio, prestadores',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Toda pessoa, negócio, comércio, prestadores de serviço ou CNPJ que preste algum tipo de atendimento via WhatsApp pode se cadastrar como anunciante.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              true,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    color: Colors.white,
                                                    child: ExpandableNotifier(
                                                      controller: _model
                                                          .expandableController3,
                                                      child: ExpandablePanel(
                                                        header: Text(
                                                          'Existe algum custo para usar o aplicativo?',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                        collapsed: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'O download e uso do aplicativo “meencontra\"',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'O download e uso do aplicativo \'meencontra\' é totalmente gratuito para os usuários. No entanto, os anunciantes precisam pagar uma taxa para exibir seus anúncios no aplicativo. Os preços variam conforme o plano escolhido.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0x8A000000),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              true,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: Colors.white,
                                                      child: ExpandableNotifier(
                                                        controller: _model
                                                            .expandableController4,
                                                        child: ExpandablePanel(
                                                          header: Text(
                                                            'Quais são os recursos de segurança do aplicativo?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                          collapsed: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'O meencontra usa tecnologia de criptografia',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0x8A000000),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          expanded: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'O meencontra usa tecnologia de criptografia para proteger as informações do usuário. Além disso, os usuários podem denunciar comportamentos inadequados ou anúncios suspeitos para a equipe de suporte do aplicativo',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0x8A000000),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          theme:
                                                              ExpandableThemeData(
                                                            tapHeaderToExpand:
                                                                true,
                                                            tapBodyToExpand:
                                                                false,
                                                            tapBodyToCollapse:
                                                                true,
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .center,
                                                            hasIcon: true,
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: Colors.white,
                                                      child: ExpandableNotifier(
                                                        controller: _model
                                                            .expandableController5,
                                                        child: ExpandablePanel(
                                                          header: Text(
                                                            'Posso receber pagamento do cliente através da me.encontra?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                          ),
                                                          collapsed: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Não, nossa plataforma apenas aproxima',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0x8A000000),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          expanded: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Não, nossa plataforma apenas aproxima o usuario até o atendimento Whatsapp do anúnciante. \nNão hahá nenhum tipo de transação no aplicativo',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Color(
                                                                          0x8A000000),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          theme:
                                                              ExpandableThemeData(
                                                            tapHeaderToExpand:
                                                                true,
                                                            tapBodyToExpand:
                                                                false,
                                                            tapBodyToCollapse:
                                                                true,
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .center,
                                                            hasIcon: true,
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 24.0))
                                                    .around(
                                                        SizedBox(height: 24.0)),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
