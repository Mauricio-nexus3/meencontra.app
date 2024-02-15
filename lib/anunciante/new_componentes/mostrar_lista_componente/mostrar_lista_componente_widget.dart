import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mostrar_lista_componente_model.dart';
export 'mostrar_lista_componente_model.dart';

class MostrarListaComponenteWidget extends StatefulWidget {
  const MostrarListaComponenteWidget({
    super.key,
    bool? parameter1,
    Color? parameter2,
    required this.imgGrid,
    required this.imgList,
  })  : this.parameter1 = parameter1 ?? false,
        this.parameter2 = parameter2 ?? const Color(0xFF6800A0);

  final bool parameter1;
  final Color parameter2;
  final Future Function()? imgGrid;
  final Future Function()? imgList;

  @override
  State<MostrarListaComponenteWidget> createState() =>
      _MostrarListaComponenteWidgetState();
}

class _MostrarListaComponenteWidgetState
    extends State<MostrarListaComponenteWidget> {
  late MostrarListaComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MostrarListaComponenteModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.imgGrid?.call();
      setState(() {
        _model.mostrarEmListaMicroComponente = false;
      });
    });

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

    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 24.0,
                buttonSize: 40.0,
                fillColor: widget.parameter1 == false
                    ? widget.parameter2
                    : Color(0x00000000),
                icon: Icon(
                  Icons.image_outlined,
                  color: widget.parameter1 == false
                      ? FlutterFlowTheme.of(context).secondaryText
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.imgGrid?.call();
                  setState(() {
                    _model.mostrarEmListaMicroComponente = false;
                  });
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 24.0,
                buttonSize: 40.0,
                fillColor: widget.parameter1 == true
                    ? widget.parameter2
                    : Color(0x00000000),
                icon: Icon(
                  Icons.list,
                  color: widget.parameter1 == true
                      ? FlutterFlowTheme.of(context).secondaryText
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.imgList?.call();
                  setState(() {
                    _model.mostrarEmListaMicroComponente = true;
                  });
                },
              ),
            ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
          ),
        ),
      ),
    );
  }
}
