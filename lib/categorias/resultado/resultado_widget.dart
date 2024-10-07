import '/backend/backend.dart';
import '/categorias/componentes/card_lista_sub_categoria/card_lista_sub_categoria_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'resultado_model.dart';
export 'resultado_model.dart';

class ResultadoWidget extends StatefulWidget {
  const ResultadoWidget({
    super.key,
    this.total,
    required this.subCategoria,
  });

  final double? total;
  final String? subCategoria;

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
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Resultado',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  Icons.arrow_back_ios_rounded,
                  color: FlutterFlowTheme.of(context).white,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('RESULTADO_arrow_back_ios_rounded_ICN_ON_');
                  context.pop();
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget!.subCategoria,
                  'Nome',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          FFAppConstants.paddingMobile,
                          0.0,
                        ),
                        0.0,
                        0.0,
                        0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Total',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.total?.toString(),
                            '1',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(width: 2.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          AnuncianteRecord>(
                        pagingController: _model.setListViewController(
                          AnuncianteRecord.collection
                              .where(Filter.or(
                                Filter(
                                  'NomeSubCategoria01',
                                  isEqualTo: widget!.subCategoria != ''
                                      ? widget!.subCategoria
                                      : null,
                                ),
                                Filter(
                                  'NomeSubCategoria02',
                                  isEqualTo: widget!.subCategoria != ''
                                      ? widget!.subCategoria
                                      : null,
                                ),
                              ))
                              .orderBy('PlanoAssinatura', descending: true),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        builderDelegate:
                            PagedChildBuilderDelegate<AnuncianteRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
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
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
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

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewAnuncianteRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'RESULTADO_PAGE_Container_pop14iua_ON_TAP');

                                context.pushNamed(
                                  'AnunciantePerfil',
                                  queryParameters: {
                                    'referenciaAnunciante': serializeParam(
                                      listViewAnuncianteRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: CardListaSubCategoriaWidget(
                                key: Key(
                                    'Keypop_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                logo: listViewAnuncianteRecord.logo,
                                nome: listViewAnuncianteRecord.nomeFantasia,
                                endereco:
                                    listViewAnuncianteRecord.enderecoCompleto,
                                planoAssinatura:
                                    listViewAnuncianteRecord.planoAssinatura,
                                nota: listViewAnuncianteRecord.notaMedia,
                                parameter3: listViewAnuncianteRecord.reference,
                                regatado: listViewAnuncianteRecord.resgatado,
                                whatsapp:
                                    listViewAnuncianteRecord.whatsComercial,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)).around(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ));
  }
}
