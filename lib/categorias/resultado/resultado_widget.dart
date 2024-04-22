import '/backend/backend.dart';
import '/categorias/componentes/card_lista_sub_categoria/card_lista_sub_categoria_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resultado_model.dart';
export 'resultado_model.dart';

class ResultadoWidget extends StatefulWidget {
  const ResultadoWidget({
    super.key,
    required this.subCategoriasResultRef,
  });

  final DocumentReference? subCategoriasResultRef;

  @override
  State<ResultadoWidget> createState() => _ResultadoWidgetState();
}

class _ResultadoWidgetState extends State<ResultadoWidget> {
  late ResultadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultadoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Resultado'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SubCategoriasRecord>(
      future:
          SubCategoriasRecord.getDocumentOnce(widget.subCategoriasResultRef!),
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
        final resultadoSubCategoriasRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<AnuncianteRecord>>(
                stream: _model.resultadoSub(
                  requestFn: () => queryAnuncianteRecord(
                    queryBuilder: (anuncianteRecord) => anuncianteRecord
                        .where(
                          'Categoria',
                          isEqualTo: resultadoSubCategoriasRecord
                                      .nomeCategoriaPai !=
                                  ''
                              ? resultadoSubCategoriasRecord.nomeCategoriaPai
                              : null,
                        )
                        .orderBy('PlanoAssinatura', descending: true),
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
                  List<AnuncianteRecord> containerAnuncianteRecordList =
                      snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            child: Container(
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 28.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'RESULTADO_PAGE_arrow_back_ios_ICN_ON_TAP');
                                        context.safePop();
                                      },
                                    ),
                                    Text(
                                      resultadoSubCategoriasRecord
                                          .nomeSubCategoria,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 1020.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Total',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          (valueOrDefault<int>(
                                                    containerAnuncianteRecordList
                                                        .where((e) =>
                                                            e.nomeSubCategoria01 ==
                                                            resultadoSubCategoriasRecord
                                                                .nomeSubCategoria)
                                                        .toList()
                                                        .length,
                                                    0,
                                                  ) +
                                                  valueOrDefault<int>(
                                                    containerAnuncianteRecordList
                                                        .where((e) =>
                                                            e.nomeSubCategoria02 ==
                                                            resultadoSubCategoriasRecord
                                                                .nomeSubCategoria)
                                                        .toList()
                                                        .length,
                                                    0,
                                                  ))
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 2.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final planoPago = containerAnuncianteRecordList
                                            .where((e) =>
                                                (e.nomeSubCategoria01 ==
                                                    resultadoSubCategoriasRecord
                                                        .nomeSubCategoria) ||
                                                (e.nomeSubCategoria02 ==
                                                    resultadoSubCategoriasRecord
                                                        .nomeSubCategoria))
                                            .toList();
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  planoPago.length,
                                                  (planoPagoIndex) {
                                            final planoPagoItem =
                                                planoPago[planoPagoIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RESULTADO_PAGE_Container_5hta4rac_ON_TAP');

                                                context.pushNamed(
                                                  'AnunciantePage',
                                                  queryParameters: {
                                                    'documentoRefAnunciante':
                                                        serializeParam(
                                                      planoPagoItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'documentoRefAnunciante':
                                                        planoPagoItem,
                                                  },
                                                );
                                              },
                                              child:
                                                  CardListaSubCategoriaWidget(
                                                key: Key(
                                                    'Key5ht_${planoPagoIndex}_of_${planoPago.length}'),
                                                logo: planoPagoItem.logo,
                                                nome:
                                                    planoPagoItem.nomeFantasia,
                                                endereco: planoPagoItem
                                                    .enderecoCompleto,
                                                planoAssinatura: planoPagoItem
                                                    .planoAssinatura,
                                                nota: planoPagoItem.notaMedia,
                                                parameter3:
                                                    planoPagoItem.reference,
                                                regatado:
                                                    planoPagoItem.resgatado,
                                              ),
                                            );
                                          })
                                              .divide(SizedBox(height: 12.0))
                                              .around(SizedBox(height: 12.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .around(SizedBox(height: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
