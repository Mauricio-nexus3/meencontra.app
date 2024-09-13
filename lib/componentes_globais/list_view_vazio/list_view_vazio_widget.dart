import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_vazio_model.dart';
export 'list_view_vazio_model.dart';

class ListViewVazioWidget extends StatefulWidget {
  /// Componente para listas vazias.
  const ListViewVazioWidget({
    super.key,
    required this.icone,
    required this.titulo,
    required this.mensagem,
  });

  final Widget? icone;
  final String? titulo;
  final String? mensagem;

  @override
  State<ListViewVazioWidget> createState() => _ListViewVazioWidgetState();
}

class _ListViewVazioWidgetState extends State<ListViewVazioWidget> {
  late ListViewVazioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewVazioModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget!.icone!,
            Text(
              valueOrDefault<String>(
                widget!.titulo,
                'Sem notificações no momento',
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.mensagem,
                'Suas notificações são exibidas aqui',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
