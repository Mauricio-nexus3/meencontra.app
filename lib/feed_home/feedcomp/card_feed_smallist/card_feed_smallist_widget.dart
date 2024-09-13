import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_feed_smallist_model.dart';
export 'card_feed_smallist_model.dart';

class CardFeedSmallistWidget extends StatefulWidget {
  /// cards em lista do feed
  const CardFeedSmallistWidget({
    super.key,
    this.imagem,
    this.categoria,
    this.titulo,
    Color? backgroudCard,
  }) : this.backgroudCard = backgroudCard ?? Colors.white;

  final String? imagem;
  final String? categoria;
  final String? titulo;
  final Color backgroudCard;

  @override
  State<CardFeedSmallistWidget> createState() => _CardFeedSmallistWidgetState();
}

class _CardFeedSmallistWidgetState extends State<CardFeedSmallistWidget> {
  late CardFeedSmallistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardFeedSmallistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    widget!.imagem!,
                    width: 120.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        widget!.titulo,
                                        'titulo',
                                      ).maybeHandleOverflow(maxChars: 160),
                                      minFontSize: 14.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget!.backgroudCard,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
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
                              valueOrDefault<String>(
                                widget!.categoria,
                                'Categoria',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
