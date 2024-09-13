import '/backend/backend.dart';
import '/feed_home/feedcomp/card_feed_big/card_feed_big_widget.dart';
import '/feed_home/feedcomp/card_feed_smallist/card_feed_smallist_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_completo_contrata_model.dart';
export 'feed_completo_contrata_model.dart';

class FeedCompletoContrataWidget extends StatefulWidget {
  /// Completo de vagas
  const FeedCompletoContrataWidget({
    super.key,
    required this.listaDocVagas,
  });

  final List<MeContrataVAGASRecord>? listaDocVagas;

  @override
  State<FeedCompletoContrataWidget> createState() =>
      _FeedCompletoContrataWidgetState();
}

class _FeedCompletoContrataWidgetState
    extends State<FeedCompletoContrataWidget> {
  late FeedCompletoContrataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCompletoContrataModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_COMPLETO_CONTRATA_FeedCompletoContr');
      _model.refVagas = widget!.listaDocVagas?[0]?.reference;
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
                  texto: 'Vagas',
                  cor: FlutterFlowTheme.of(context).secondary,
                  barrierWidth: 0.3,
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
                imagem: widget!.listaDocVagas?[0]?.logoEmpresa,
                categoria: widget!.listaDocVagas?[0]?.nomeEmpresa,
                titulo: widget!.listaDocVagas?[0]?.nomeVaga,
                backgroudCard: FlutterFlowTheme.of(context).secondary,
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
                        final listaVagas = widget!.listaDocVagas!
                            .where((e) => e.reference != _model.refVagas)
                            .toList()
                            .take(3)
                            .toList();

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(listaVagas.length,
                              (listaVagasIndex) {
                            final listaVagasItem = listaVagas[listaVagasIndex];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: CardFeedSmallistWidget(
                                key: Key(
                                    'Keyzti_${listaVagasIndex}_of_${listaVagas.length}'),
                                imagem: listaVagasItem.logoEmpresa,
                                categoria: listaVagasItem.nomeEmpresa,
                                titulo: listaVagasItem.nomeVaga,
                                backgroudCard:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }).divide(SizedBox(height: 12.0)),
                        );
                      },
                    );
                  } else {
                    return Builder(
                      builder: (context) {
                        final listaMobile = widget!.listaDocVagas!
                            .where((e) => e.reference != _model.refVagas)
                            .toList();

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listaMobile.length,
                                    (listaMobileIndex) {
                              final listaMobileItem =
                                  listaMobile[listaMobileIndex];
                              return MecontrataFeedWidget(
                                key: Key(
                                    'Keyydn_${listaMobileIndex}_of_${listaMobile.length}'),
                                parameter4: listaMobileItem,
                              );
                            })
                                .divide(SizedBox(width: 16.0))
                                .around(SizedBox(width: 16.0)),
                          ),
                        );
                      },
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
