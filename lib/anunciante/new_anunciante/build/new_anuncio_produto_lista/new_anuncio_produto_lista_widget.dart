import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_anuncio_produto_lista_model.dart';
export 'new_anuncio_produto_lista_model.dart';

class NewAnuncioProdutoListaWidget extends StatefulWidget {
  const NewAnuncioProdutoListaWidget({
    super.key,
    required this.adicionarAnuncio,
  });

  final AnuncianteRecord? adicionarAnuncio;

  @override
  State<NewAnuncioProdutoListaWidget> createState() =>
      _NewAnuncioProdutoListaWidgetState();
}

class _NewAnuncioProdutoListaWidgetState
    extends State<NewAnuncioProdutoListaWidget> with TickerProviderStateMixin {
  late NewAnuncioProdutoListaModel _model;

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
    _model = createModel(context, () => NewAnuncioProdutoListaModel());

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
        sigmaX: 1.0,
        sigmaY: 2.0,
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 900.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40.0,
                      child: Divider(
                        thickness: 3.0,
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Text(
                          'Selecione os produtos irá anúnciar',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 500.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: FutureBuilder<List<ProdutoRecord>>(
                          future: queryProdutoRecordOnce(
                            parent: widget.adicionarAnuncio?.reference,
                            limit: 30,
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
                            List<ProdutoRecord> listViewProdutoRecordList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              scrollDirection: Axis.vertical,
                              itemCount: listViewProdutoRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 4.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewProdutoRecord =
                                    listViewProdutoRecordList[listViewIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      listViewProdutoRecord
                                                          .imagensProduto.first,
                                                      width: 60.0,
                                                      height: 60.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listViewProdutoRecord
                                                                .nomeProduto,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          ),
                                                          Text(
                                                            formatNumber(
                                                              listViewProdutoRecord
                                                                  .valorVenda,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .commaDecimal,
                                                              currency: 'R\$',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((_model.qntItensAtivos <
                                                        4.0) ||
                                                    ((_model.qntItensAtivos ==
                                                            4.0) &&
                                                        (_model.checkboxLiberadoValueMap[
                                                                listViewProdutoRecord] ==
                                                            true)))
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                                  .checkboxLiberadoValueMap[
                                                              listViewProdutoRecord] ??=
                                                          listViewProdutoRecord
                                                              .produtoAnunciado,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxLiberadoValueMap[
                                                                listViewProdutoRecord] =
                                                            newValue!);
                                                        if (newValue!) {
                                                          setState(() {
                                                            _model.qntItensAtivos =
                                                                _model.qntItensAtivos +
                                                                    1.0;
                                                          });

                                                          await listViewProdutoRecord
                                                              .reference
                                                              .update(
                                                                  createProdutoRecordData(
                                                            produtoAnunciado:
                                                                true,
                                                          ));
                                                        } else {
                                                          setState(() {
                                                            _model.qntItensAtivos =
                                                                _model.qntItensAtivos +
                                                                    -1.0;
                                                          });

                                                          await listViewProdutoRecord
                                                              .reference
                                                              .update(
                                                                  createProdutoRecordData(
                                                            produtoAnunciado:
                                                                false,
                                                          ));
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Salvar',
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
                      ),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
    );
  }
}
