import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'estrela_bloqueio_model.dart';
export 'estrela_bloqueio_model.dart';

class EstrelaBloqueioWidget extends StatefulWidget {
  const EstrelaBloqueioWidget({
    super.key,
    required this.planoAssinatura,
    int? tamanho,
  }) : this.tamanho = tamanho ?? 1;

  final String? planoAssinatura;
  final int tamanho;

  @override
  State<EstrelaBloqueioWidget> createState() => _EstrelaBloqueioWidgetState();
}

class _EstrelaBloqueioWidgetState extends State<EstrelaBloqueioWidget> {
  late EstrelaBloqueioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstrelaBloqueioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.planoAssinatura == 'gratis') ||
          (widget.planoAssinatura == 'meencontra'),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(200.0),
          ),
          child: Icon(
            Icons.star,
            color: FlutterFlowTheme.of(context).warning,
            size: () {
              if (widget.tamanho == 1) {
                return 12.0;
              } else if (widget.tamanho == 2) {
                return 24.0;
              } else {
                return 12.0;
              }
            }(),
          ),
        ),
      ),
    );
  }
}
