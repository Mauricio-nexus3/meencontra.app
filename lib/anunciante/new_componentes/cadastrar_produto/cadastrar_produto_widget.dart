import '/anunciante/new_componentes/cadastrar_categoria/cadastrar_categoria_widget.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cadastrar_produto_model.dart';
export 'cadastrar_produto_model.dart';

class CadastrarProdutoWidget extends StatefulWidget {
  const CadastrarProdutoWidget({
    super.key,
    required this.anuncianteDoc,
    this.produtoDocEdicao,
    required this.edicao,
  });

  final AnuncianteRecord? anuncianteDoc;
  final ProdutoRecord? produtoDocEdicao;
  final bool? edicao;

  @override
  State<CadastrarProdutoWidget> createState() => _CadastrarProdutoWidgetState();
}

class _CadastrarProdutoWidgetState extends State<CadastrarProdutoWidget> {
  late CadastrarProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastrarProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.edicao == true) {
        setState(() {
          _model.imgs =
              widget.produtoDocEdicao!.imagensProduto.toList().cast<String>();
        });
        setState(() {
          _model.nomeProdutoController?.text =
              widget.produtoDocEdicao!.nomeProduto;
        });
        setState(() {
          _model.precoVendaController?.text =
              widget.produtoDocEdicao!.valorVenda.toString();
        });
        setState(() {
          _model.codProdutoController?.text =
              widget.produtoDocEdicao!.codigoProduto;
        });
        setState(() {
          _model.descricaoProdutoController?.text =
              widget.produtoDocEdicao!.descricaoProduto;
        });
        _model.codDropdowCategoria = await queryCatalogoRecordOnce(
          parent: widget.anuncianteDoc?.reference,
          queryBuilder: (catalogoRecord) => catalogoRecord.where(
            'categoriaRef_Stg',
            isEqualTo: _model.refCategoria,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      } else {
        return;
      }
    });

    _model.nomeProdutoController ??= TextEditingController();
    _model.nomeProdutoFocusNode ??= FocusNode();

    _model.precoVendaController ??= TextEditingController();
    _model.precoVendaFocusNode ??= FocusNode();

    _model.codProdutoController ??= TextEditingController();
    _model.codProdutoFocusNode ??= FocusNode();

    _model.descricaoProdutoController ??= TextEditingController();
    _model.descricaoProdutoFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Material(
              color: Colors.transparent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Container(
                height: 20.0,
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.edicao == true
                                ? 'Editar produto'
                                : 'Cadastrar novo produto',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  'Deseja cancelar as alterações?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Não, continuar'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('sim, cancelar'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                Navigator.pop(context);
                              } else {
                                return;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Insira as informações do seu produto nos campos abaixo.',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                      child: Text(
                        'Fotos do produto',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listaImgs =
                                  _model.imgs.map((e) => e).toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(listaImgs.length,
                                    (listaImgsIndex) {
                                  final listaImgsItem =
                                      listaImgs[listaImgsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            '',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              listaImgsItem,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 24.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x30FBFBFB),
                                            icon: Icon(
                                              FFIcons.ktrashOutline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await FirebaseStorage.instance
                                                  .refFromURL(listaImgsItem)
                                                  .delete();
                                              setState(() {
                                                _model.removeFromImgs(
                                                    listaImgsItem);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(width: 8.0)),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia = await selectMedia(
                                  maxWidth: 1020.00,
                                  maxHeight: 1020.00,
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

                                setState(() {
                                  _model.addToImgs(_model.uploadedFileUrl);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.nomeProdutoController,
                        focusNode: _model.nomeProdutoFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Nome do produto',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent4,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.nomeProdutoControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.precoVendaController,
                        focusNode: _model.precoVendaFocusNode,
                        textCapitalization: TextCapitalization.none,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Preço de Venda',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent4,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: _model.precoVendaControllerValidator
                            .asValidator(context),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                    ),
                    StreamBuilder<List<CatalogoRecord>>(
                      stream: queryCatalogoRecord(
                        parent: widget.anuncianteDoc?.reference,
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
                        List<CatalogoRecord>
                            containerDropdonwCatalogoRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model
                                          .dropDownCategoria2ValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownCategoria2Value ??= widget
                                        .produtoDocEdicao?.nomeDaCategoria,
                                  ),
                                  options: containerDropdonwCatalogoRecordList
                                      .map((e) => e.nomeCategoria)
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.dropDownCategoria2Value = val);
                                    setState(() {
                                      _model.cetegoriaRef =
                                          containerDropdonwCatalogoRecordList
                                              .where((e) =>
                                                  e.nomeCategoria ==
                                                  _model
                                                      .dropDownCategoria2Value)
                                              .toList()
                                              .first
                                              .reference;
                                    });
                                  },
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Categoria',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: valueOrDefault<Color>(
                                      widget.anuncianteDoc?.cor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        );
                      },
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: CadastrarCategoriaWidget(
                                      categoriaProdutoAnunciante:
                                          widget.anuncianteDoc!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.add,
                                  color: valueOrDefault<Color>(
                                    widget.anuncianteDoc?.cor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                'Cadastrar nova categoria',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: valueOrDefault<Color>(
                                        widget.anuncianteDoc?.cor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.codProdutoController,
                        focusNode: _model.codProdutoFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Código do produto',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).accent4,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        validator: _model.codProdutoControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: TextFormField(
                        controller: _model.descricaoProdutoController,
                        focusNode: _model.descricaoProdutoFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Descrição',
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 32.0, 20.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        validator: _model.descricaoProdutoControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 44.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (widget.edicao == true) {
                                await widget.produtoDocEdicao!.reference
                                    .update({
                                  ...createProdutoRecordData(
                                    nomeProduto:
                                        _model.nomeProdutoController.text,
                                    descricaoProduto:
                                        _model.descricaoProdutoController.text,
                                    valorVenda: double.tryParse(
                                        _model.precoVendaController.text),
                                    codigoProduto:
                                        _model.codProdutoController.text,
                                    refCatalogo: _model.cetegoriaRef,
                                    nomeDaCategoria:
                                        _model.dropDownCategoria2Value,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'ImagensProduto': _model.imgs,
                                    },
                                  ),
                                });
                                setState(() {
                                  _model.imgs = [];
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Atualizado com sucesso',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );

                                context.pushNamed(
                                  'Produtos',
                                  queryParameters: {
                                    'anuncianteDoc': serializeParam(
                                      widget.anuncianteDoc,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'anuncianteDoc': widget.anuncianteDoc,
                                  },
                                );
                              } else {
                                await ProdutoRecord.createDoc(
                                        widget.anuncianteDoc!.reference)
                                    .set({
                                  ...createProdutoRecordData(
                                    nomeProduto:
                                        _model.nomeProdutoController.text,
                                    refCatalogo: _model.cetegoriaRef,
                                    nomeDaCategoria: _model
                                                    .dropDownCategoria2Value !=
                                                null &&
                                            _model.dropDownCategoria2Value != ''
                                        ? _model.dropDownCategoria2Value
                                        : 'Não categorizado',
                                    descricaoProduto:
                                        _model.descricaoProdutoController.text,
                                    valorVenda: double.tryParse(
                                        _model.precoVendaController.text),
                                    codigoProduto:
                                        _model.codProdutoController.text,
                                    ativo: true,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'created_at':
                                          FieldValue.serverTimestamp(),
                                      'ImagensProduto': _model.imgs,
                                    },
                                  ),
                                });
                                setState(() {
                                  _model.imgs = [];
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Cadastrado com sucesso',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );

                                context.pushNamed(
                                  'Produtos',
                                  queryParameters: {
                                    'anuncianteDoc': serializeParam(
                                      widget.anuncianteDoc,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'anuncianteDoc': widget.anuncianteDoc,
                                  },
                                );
                              }
                            },
                            text: widget.edicao == true
                                ? 'Salvar alterações'
                                : 'Cadastrar produto',
                            options: FFButtonOptions(
                              width: 270.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                widget.anuncianteDoc?.cor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
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
        ],
      ),
    );
  }
}
