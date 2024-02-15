import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/catalogo/add_categoria_catalogo/add_categoria_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_novo_item_model.dart';
export 'add_novo_item_model.dart';

class AddNovoItemWidget extends StatefulWidget {
  const AddNovoItemWidget({
    super.key,
    required this.produtoCatalogo,
  });

  final DocumentReference? produtoCatalogo;

  @override
  State<AddNovoItemWidget> createState() => _AddNovoItemWidgetState();
}

class _AddNovoItemWidgetState extends State<AddNovoItemWidget>
    with TickerProviderStateMixin {
  late AddNovoItemModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNovoItemModel());

    _model.inputNomeProdutoController ??= TextEditingController();
    _model.inputNomeProdutoFocusNode ??= FocusNode();

    _model.inputValorController ??= TextEditingController();
    _model.inputValorFocusNode ??= FocusNode();

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 4.0,
      ),
      child: StreamBuilder<AnuncianteRecord>(
        stream: AnuncianteRecord.getDocument(widget.produtoCatalogo!),
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
          final containerAnuncianteRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 50.0,
                      child: Divider(
                        thickness: 3.0,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  FutureBuilder<List<ProdutoRecord>>(
                    future: queryProdutoRecordOnce(
                      parent: widget.produtoCatalogo,
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
                      List<ProdutoRecord> ifPremiumProdutoRecordList =
                          snapshot.data!;
                      return Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 670.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(28.0),
                            topRight: Radius.circular(28.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (containerAnuncianteRecord
                                              .planoModelo01 ==
                                          'Premium')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<CatalogoRecord>>(
                                                  stream: queryCatalogoRecord(
                                                    parent:
                                                        widget.produtoCatalogo,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0xFF622AE2),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CatalogoRecord>
                                                        dropDownCatalogoRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options:
                                                          dropDownCatalogoRecordList
                                                              .map((e) => e
                                                                  .nomeCategoria)
                                                              .toList(),
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownValue =
                                                              val),
                                                      width: 250.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      hintText:
                                                          'Selecione a categoria',
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
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
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    28.0, 4.0, 28.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Foto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Nome/Descrição',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Valor',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            indent: 24.0,
                                            endIndent: 24.0,
                                            color: Color(0x334710DD),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
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
                                                                          final selectedMedia =
                                                                              await selectMedia(
                                                                            maxWidth:
                                                                                70.00,
                                                                            maxHeight:
                                                                                70.00,
                                                                            imageQuality:
                                                                                100,
                                                                            includeDimensions:
                                                                                true,
                                                                            mediaSource:
                                                                                MediaSource.photoGallery,
                                                                            multiImage:
                                                                                false,
                                                                          );
                                                                          if (selectedMedia != null &&
                                                                              selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                            setState(() =>
                                                                                _model.isDataUploading = true);
                                                                            var selectedUploadedFiles =
                                                                                <FFUploadedFile>[];

                                                                            var downloadUrls =
                                                                                <String>[];
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
                                                                            if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                                downloadUrls.length == selectedMedia.length) {
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
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              _model.uploadedFileUrl,
                                                                              'data:image/jpeg;base64,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',
                                                                            ),
                                                                            width:
                                                                                70.0,
                                                                            height:
                                                                                70.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    minWidth:
                                                                        140.0,
                                                                    maxWidth:
                                                                        160.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              145.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.inputNomeProdutoController,
                                                                            focusNode:
                                                                                _model.inputNomeProdutoFocusNode,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: 'Nome do produto',
                                                                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                              enabledBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x334710DD),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              focusedBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              errorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              focusedErrorBorder: UnderlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0x00000000),
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: const BorderRadius.only(
                                                                                  topLeft: Radius.circular(4.0),
                                                                                  topRight: Radius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            maxLines:
                                                                                2,
                                                                            minLines:
                                                                                1,
                                                                            validator:
                                                                                _model.inputNomeProdutoControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 90.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'R\$',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .inputValorController,
                                                                    focusNode:
                                                                        _model
                                                                            .inputValorFocusNode,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .none,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      enabledBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x334710DD),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    minLines: 1,
                                                                    keyboardType: const TextInputType
                                                                        .numberWithOptions(
                                                                        signed:
                                                                            true,
                                                                        decimal:
                                                                            true),
                                                                    validator: _model
                                                                        .inputValorControllerValidator
                                                                        .asValidator(
                                                                            context),
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
                                          if (containerAnuncianteRecord
                                                      .planoModelo01 ==
                                                  'Premium'
                                              ? (ifPremiumProdutoRecordList
                                                      .length <
                                                  30)
                                              : (ifPremiumProdutoRecordList
                                                      .length <
                                                  10))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 12.0),
                                                child: StreamBuilder<
                                                    List<CatalogoRecord>>(
                                                  stream: queryCatalogoRecord(
                                                    parent:
                                                        widget.produtoCatalogo,
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0xFF622AE2),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CatalogoRecord>
                                                        buttonCatalogoRecordList =
                                                        snapshot.data!;
                                                    final buttonCatalogoRecord =
                                                        buttonCatalogoRecordList
                                                                .isNotEmpty
                                                            ? buttonCatalogoRecordList
                                                                .first
                                                            : null;
                                                    return FFButtonWidget(
                                                      onPressed: () async {
                                                        // remover essa função
                                                        if (containerAnuncianteRecord
                                                                .planoModelo01 ==
                                                            'Premium') {
                                                          if (!(_model.dropDownValue !=
                                                                  null &&
                                                              _model.dropDownValue !=
                                                                  '')) {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Não selecionou nenhuma categoria'),
                                                                            content:
                                                                                Text('Tem certeza que não quer categoriazar seus produtos?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Cadastrar assim'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Quero categorizar primeiro'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (!confirmDialogResponse) {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                useSafeArea:
                                                                    true,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          AddCategoriaCatalogoWidget(
                                                                        anunciante:
                                                                            widget.produtoCatalogo!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                          }
                                                        }
                                                        if ((_model.inputNomeProdutoController
                                                                        .text !=
                                                                    null &&
                                                                _model.inputNomeProdutoController
                                                                        .text !=
                                                                    '') &&
                                                            (_model.inputValorController
                                                                        .text !=
                                                                    null &&
                                                                _model.inputValorController
                                                                        .text !=
                                                                    '')) {
                                                          await ProdutoRecord
                                                                  .createDoc(widget
                                                                      .produtoCatalogo!)
                                                              .set(
                                                                  createProdutoRecordData(
                                                            fotoProduto: _model
                                                                .uploadedFileUrl,
                                                            nomeProduto: _model
                                                                .inputNomeProdutoController
                                                                .text,
                                                            valorProduto: _model
                                                                .inputValorController
                                                                .text,
                                                            refCatalogo:
                                                                buttonCatalogoRecord
                                                                    ?.reference,
                                                            nomeDaCategoria: _model
                                                                .dropDownValue,
                                                          ));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Cadastrado com sucesso',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
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
                                                          setState(() {
                                                            _model
                                                                .inputNomeProdutoController
                                                                ?.clear();
                                                            _model
                                                                .inputValorController
                                                                ?.clear();
                                                          });
                                                          setState(() {
                                                            _model.isDataUploading =
                                                                false;
                                                            _model.uploadedLocalFile =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []));
                                                            _model.uploadedFileUrl =
                                                                '';
                                                          });
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'Há campos vazio'),
                                                                  content: Text(
                                                                      'Favor preencher corretamente os campos'),
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
                                                          return;
                                                        }
                                                      },
                                                      text: 'Adicionar',
                                                      options: FFButtonOptions(
                                                        width: 300.0,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsets.all(0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          if (containerAnuncianteRecord
                                                      .planoModelo01 ==
                                                  'Premium'
                                              ? (ifPremiumProdutoRecordList
                                                      .length ==
                                                  30)
                                              : (ifPremiumProdutoRecordList
                                                      .length ==
                                                  10))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 12.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  text: 'Fechar',
                                                  options: FFButtonOptions(
                                                    width: 300.0,
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
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
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!);
                    },
                  ),
                ]
                    .divide(SizedBox(height: 8.0))
                    .addToStart(SizedBox(height: 12.0)),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
        },
      ),
    );
  }
}
