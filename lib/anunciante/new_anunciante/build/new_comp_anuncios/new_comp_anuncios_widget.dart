import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_comp_anuncios_model.dart';
export 'new_comp_anuncios_model.dart';

class NewCompAnunciosWidget extends StatefulWidget {
  const NewCompAnunciosWidget({
    super.key,
    required this.anunciante,
  });

  final AnuncianteRecord? anunciante;

  @override
  State<NewCompAnunciosWidget> createState() => _NewCompAnunciosWidgetState();
}

class _NewCompAnunciosWidgetState extends State<NewCompAnunciosWidget> {
  late NewCompAnunciosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCompAnunciosModel());

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
        color: FlutterFlowTheme.of(context).primaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                          widget.anunciante!.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.anunciante?.nomeFantasia,
                            'nome',
                          ),
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_outward,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'AnuncianteCopy',
                            queryParameters: {
                              'documentoRefAnunciante': serializeParam(
                                widget.anunciante,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'documentoRefAnunciante': widget.anunciante,
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (widget.anunciante?.formatoAnuncio == 'Produtos') {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Container(
                      height: 220.0,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<ProdutoRecord>>(
                        stream: queryProdutoRecord(
                          parent: widget.anunciante?.reference,
                          queryBuilder: (produtoRecord) => produtoRecord.where(
                            'ProdutoAnunciado',
                            isEqualTo: true,
                          ),
                          limit: 6,
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
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewProdutoRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(width: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewProdutoRecord =
                                  listViewProdutoRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.9,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: 150.0,
                                    height: 160.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            child: Image.network(
                                              listViewProdutoRecord
                                                  .imagensProduto.first,
                                              width: double.infinity,
                                              height: 120.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 8.0, 4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    formatNumber(
                                                      listViewProdutoRecord
                                                          .valorVenda,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                      currency: 'R\$',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium,
                                                  ),
                                                ),
                                                Text(
                                                  listViewProdutoRecord
                                                      .nomeProduto,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    listViewProdutoRecord
                                                        .descricaoProduto
                                                        .maybeHandleOverflow(
                                                            maxChars: 42),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return StreamBuilder<List<AnunciosRecord>>(
                    stream: queryAnunciosRecord(
                      parent: widget.anunciante?.reference,
                      queryBuilder: (anunciosRecord) => anunciosRecord.where(
                        'Anunciado',
                        isEqualTo: true,
                      ),
                      singleRecord: true,
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
                      List<AnunciosRecord> containerAnunciosRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerAnunciosRecord =
                          containerAnunciosRecordList.isNotEmpty
                              ? containerAnunciosRecordList.first
                              : null;
                      return Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'AnuncianteCopy',
                                  queryParameters: {
                                    'documentoRefAnunciante': serializeParam(
                                      widget.anunciante,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'documentoRefAnunciante': widget.anunciante,
                                  },
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  containerAnunciosRecord!.fotoAnuncio,
                                  width: 360.0,
                                  height: 220.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
