import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'header_title_feed_model.dart';
export 'header_title_feed_model.dart';

class HeaderTitleFeedWidget extends StatefulWidget {
  /// cabeçalho de cada tópico
  const HeaderTitleFeedWidget({
    super.key,
    required this.texto,
    required this.cor,
    required this.barrierWidth,
  });

  final String? texto;
  final Color? cor;
  final double? barrierWidth;

  @override
  State<HeaderTitleFeedWidget> createState() => _HeaderTitleFeedWidgetState();
}

class _HeaderTitleFeedWidgetState extends State<HeaderTitleFeedWidget> {
  late HeaderTitleFeedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderTitleFeedModel());

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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.texto,
              'Titulo',
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Inter',
                  color: widget!.cor,
                  letterSpacing: 0.0,
                ),
          ),
          Flexible(
            child: LinearPercentIndicator(
              percent: widget!.barrierWidth!,
              width: MediaQuery.sizeOf(context).width * 1.0,
              lineHeight: 3.0,
              animation: true,
              animateFromLastPercent: true,
              progressColor: widget!.cor,
              backgroundColor: FlutterFlowTheme.of(context).accent4,
              padding: EdgeInsets.zero,
            ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
