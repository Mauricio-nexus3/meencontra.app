import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_categoria_catalogo_model.dart';
export 'add_categoria_catalogo_model.dart';

class AddCategoriaCatalogoWidget extends StatefulWidget {
  const AddCategoriaCatalogoWidget({
    super.key,
    required this.anunciante,
  });

  final DocumentReference? anunciante;

  @override
  State<AddCategoriaCatalogoWidget> createState() =>
      _AddCategoriaCatalogoWidgetState();
}

class _AddCategoriaCatalogoWidgetState
    extends State<AddCategoriaCatalogoWidget> {
  late AddCategoriaCatalogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCategoriaCatalogoModel());

    _model.nEWTextController ??= TextEditingController();
    _model.nEWTextFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StreamBuilder<List<CatalogoRecord>>(
            stream: queryCatalogoRecord(
              parent: widget.anunciante,
              limit: 3,
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
              List<CatalogoRecord> containerCatalogoRecordList = snapshot.data!;
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        'Você pode selecionar até 3 categorias para organizar seu catalogo.',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Text(
                        'Categorias servem para separar e mantar o seu catalogo mais intuitivo.',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                ),
                      ),
                      Container(
                        width: 300.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 18.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (containerCatalogoRecordList.length < 3)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: TextFormField(
                                      controller: _model.nEWTextController,
                                      focusNode: _model.nEWTextFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            '  Ex: Lanches, Bebidas, Sobremesas',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .gradient2,
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
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model
                                          .nEWTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Categorias ${containerCatalogoRecordList.length.toString()} /3',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Builder(
                            builder: (context) {
                              final listaCatalogo = containerCatalogoRecordList
                                  .toList()
                                  .take(3)
                                  .toList();
                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 6.0),
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: listaCatalogo.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 6.0),
                                itemBuilder: (context, listaCatalogoIndex) {
                                  final listaCatalogoItem =
                                      listaCatalogo[listaCatalogoIndex];
                                  return Container(
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listaCatalogoItem.nomeCategoria,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          FlutterFlowIconButton(
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              FFIcons.ktrashOutline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Deletar nome desse catalogo?'),
                                                              content: Text(
                                                                  'Deletar esse nome, não afetara os produtos que já foram definidos anteriormete. Se necessário atualiza-lo também'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              await listaCatalogoItem.reference
                                                  .delete();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (containerCatalogoRecordList.length < 3) {
                            if (_model.nEWTextController.text != null &&
                                _model.nEWTextController.text != '') {
                              await CatalogoRecord.createDoc(widget.anunciante!)
                                  .set(createCatalogoRecordData(
                                nomeCategoria: _model.nEWTextController.text,
                              ));
                              setState(() {
                                _model.nEWTextController?.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Categoria cadastrada com sucesso',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text(
                                          'Nenhuma categoria foi selecionada'),
                                      content: Text(
                                          'Escreva o nome da sua categoria'),
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
                            }
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        text: containerCatalogoRecordList.length < 3
                            ? 'Adicionar'
                            : 'Fechar',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: containerCatalogoRecordList.length < 3
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).gradient2,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .around(SizedBox(height: 12.0)),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
