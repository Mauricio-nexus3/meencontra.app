import '/backend/backend.dart';
import '/feed_home/feedcomp/card_feed_big/card_feed_big_widget.dart';
import '/feed_home/feedcomp/card_feed_smallist/card_feed_smallist_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/me_divirta/componentes/medivirta_feed/medivirta_feed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_completo_divirta_model.dart';
export 'feed_completo_divirta_model.dart';

class FeedCompletoDivirtaWidget extends StatefulWidget {
  /// Completo de eventos
  const FeedCompletoDivirtaWidget({
    super.key,
    required this.listaDocEventos,
  });

  final List<MeDiverteRecord>? listaDocEventos;

  @override
  State<FeedCompletoDivirtaWidget> createState() =>
      _FeedCompletoDivirtaWidgetState();
}

class _FeedCompletoDivirtaWidgetState extends State<FeedCompletoDivirtaWidget> {
  late FeedCompletoDivirtaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCompletoDivirtaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_COMPLETO_DIVIRTA_FeedCompletoDivirt');
      _model.refEventos = widget!.listaDocEventos?[0]?.reference;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    FFAppConstants.paddingMobile,
                    0.0,
                  ),
                  0.0,
                  0.0,
                  0.0),
              child: wrapWithModel(
                model: _model.headerTitleFeedModel,
                updateCallback: () => safeSetState(() {}),
                child: HeaderTitleFeedWidget(
                  texto: 'Eventos',
                  cor: FlutterFlowTheme.of(context).tertiary,
                  barrierWidth: 0.4,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  FFAppConstants.paddingMobile,
                  0.0,
                ),
                0.0,
                valueOrDefault<double>(
                  FFAppConstants.paddingMobile,
                  0.0,
                ),
                0.0),
            child: wrapWithModel(
              model: _model.cardFeedBigModel,
              updateCallback: () => safeSetState(() {}),
              child: CardFeedBigWidget(
                imagem: widget!.listaDocEventos?[0]?.imagemCapa,
                categoria: widget!.listaDocEventos?[0]?.local,
                titulo: widget!.listaDocEventos?[0]?.nomeEvento,
                backgroudCard: FlutterFlowTheme.of(context).tertiary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 500.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Builder(
                builder: (context) {
                  if (MediaQuery.sizeOf(context).width > kBreakpointSmall) {
                    return Builder(
                      builder: (context) {
                        final listaEventos = widget!.listaDocEventos!
                            .where((e) => e.reference != _model.refEventos)
                            .toList()
                            .take(3)
                            .toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(listaEventos.length,
                              (listaEventosIndex) {
                            final listaEventosItem =
                                listaEventos[listaEventosIndex];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: CardFeedSmallistWidget(
                                key: Key(
                                    'Keyxyu_${listaEventosIndex}_of_${listaEventos.length}'),
                                imagem: listaEventosItem.imagemCapa,
                                categoria: listaEventosItem.local,
                                titulo: listaEventosItem.nomeEvento,
                                backgroudCard:
                                    FlutterFlowTheme.of(context).tertiary,
                              ),
                            );
                          }).divide(SizedBox(height: 12.0)),
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                      child: Builder(
                        builder: (context) {
                          final listMobile = widget!.listaDocEventos!
                              .where((e) => e.reference != _model.refEventos)
                              .toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(listMobile.length,
                                      (listMobileIndex) {
                                final listMobileItem =
                                    listMobile[listMobileIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'FEED_COMPLETO_DIVIRTA_Container_x3gdh4uj');

                                      context.pushNamed(
                                        'meDivirtiDetalhesEvento',
                                        queryParameters: {
                                          'eventoRef': serializeParam(
                                            listMobileItem,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'eventoRef': listMobileItem,
                                        },
                                      );
                                    },
                                    child: MedivirtaFeedWidget(
                                      key: Key(
                                          'Keyx3g_${listMobileIndex}_of_${listMobile.length}'),
                                      imagem: listMobileItem.imagemCapa,
                                      url: listMobileItem.ingressoURL,
                                      nomeEvento: listMobileItem.nomeEvento,
                                      local: listMobileItem.local,
                                      data: listMobileItem.dataHora!,
                                    ),
                                  ),
                                );
                              })
                                  .divide(SizedBox(width: 16.0))
                                  .around(SizedBox(width: 16.0)),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ].divide(SizedBox(height: 24.0)),
      ),
    );
  }
}
