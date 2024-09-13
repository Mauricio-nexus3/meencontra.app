import '/backend/backend.dart';
import '/feed_home/feedcomp/card_feed_big/card_feed_big_widget.dart';
import '/feed_home/feedcomp/card_feed_smallist/card_feed_smallist_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/me_informa/componentes/me_informa_card_feed/me_informa_card_feed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_completo_informa_model.dart';
export 'feed_completo_informa_model.dart';

class FeedCompletoInformaWidget extends StatefulWidget {
  /// Completo do me informa
  const FeedCompletoInformaWidget({
    super.key,
    required this.listaDocMaterias,
  });

  final List<MateriasRecord>? listaDocMaterias;

  @override
  State<FeedCompletoInformaWidget> createState() =>
      _FeedCompletoInformaWidgetState();
}

class _FeedCompletoInformaWidgetState extends State<FeedCompletoInformaWidget> {
  late FeedCompletoInformaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCompletoInformaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEED_COMPLETO_INFORMA_FeedCompletoInform');
      _model.refMaterias = widget!.listaDocMaterias?[0]?.reference;
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
          Padding(
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
                texto: 'Notícias',
                cor: FlutterFlowTheme.of(context).alternate,
                barrierWidth: 0.3,
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
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('FEED_COMPLETO_INFORMA_Container_z7t594k3');

                context.pushNamed(
                  'meinformaDetalhesNoticia',
                  queryParameters: {
                    'materiadoc': serializeParam(
                      widget!.listaDocMaterias?[0],
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'materiadoc': widget!.listaDocMaterias?[0],
                  },
                );
              },
              child: wrapWithModel(
                model: _model.cardFeedBigModel,
                updateCallback: () => safeSetState(() {}),
                child: CardFeedBigWidget(
                  imagem: widget!.listaDocMaterias?[0]?.imagemCapa,
                  categoria: widget!.listaDocMaterias?[0]?.categoria,
                  titulo: widget!.listaDocMaterias?[0]?.tituloMateria,
                  backgroudCard: FlutterFlowTheme.of(context).alternate,
                ),
              ),
            ),
          ),
          Container(
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
                      final listaMaterias = widget!.listaDocMaterias!
                          .where((e) => e.reference != _model.refMaterias)
                          .toList()
                          .take(3)
                          .toList();

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(listaMaterias.length,
                            (listaMateriasIndex) {
                          final listaMateriasItem =
                              listaMaterias[listaMateriasIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEED_COMPLETO_INFORMA_Container_j4h86eze');

                                context.pushNamed(
                                  'meinformaDetalhesNoticia',
                                  queryParameters: {
                                    'materiadoc': serializeParam(
                                      listaMateriasItem,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'materiadoc': listaMateriasItem,
                                  },
                                );
                              },
                              child: CardFeedSmallistWidget(
                                key: Key(
                                    'Keyj4h_${listaMateriasIndex}_of_${listaMaterias.length}'),
                                imagem: listaMateriasItem.imagemCapa,
                                categoria: listaMateriasItem.categoria,
                                titulo: listaMateriasItem.tituloMateria,
                                backgroudCard:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          );
                        }).divide(SizedBox(height: 12.0)),
                      );
                    },
                  );
                } else {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Builder(
                      builder: (context) {
                        final listaNoticiasMobile = widget!.listaDocMaterias!
                            .where((e) => e.reference != _model.refMaterias)
                            .toList()
                            .take(5)
                            .toList();

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listaNoticiasMobile.length,
                                    (listaNoticiasMobileIndex) {
                              final listaNoticiasMobileItem =
                                  listaNoticiasMobile[listaNoticiasMobileIndex];
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
                                        'FEED_COMPLETO_INFORMA_Container_n96p74as');

                                    context.pushNamed(
                                      'meinformaDetalhesNoticia',
                                      queryParameters: {
                                        'materiadoc': serializeParam(
                                          listaNoticiasMobileItem,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'materiadoc': listaNoticiasMobileItem,
                                      },
                                    );
                                  },
                                  child: MeInformaCardFeedWidget(
                                    key: Key(
                                        'Keyn96_${listaNoticiasMobileIndex}_of_${listaNoticiasMobile.length}'),
                                    imagem: listaNoticiasMobileItem.imagemCapa,
                                    categoria:
                                        listaNoticiasMobileItem.categoria,
                                    titulo:
                                        listaNoticiasMobileItem.tituloMateria,
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
        ].divide(SizedBox(height: 24.0)),
      ),
    );
  }
}
