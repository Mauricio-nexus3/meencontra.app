import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mostrar_cards_lista_model.dart';
export 'mostrar_cards_lista_model.dart';

class MostrarCardsListaWidget extends StatefulWidget {
  const MostrarCardsListaWidget({
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
  State<MostrarCardsListaWidget> createState() =>
      _MostrarCardsListaWidgetState();
}

class _MostrarCardsListaWidgetState extends State<MostrarCardsListaWidget> {
  late MostrarCardsListaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MostrarCardsListaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MOSTRAR_CARDS_LISTA_mostrarCardsLista_ON');
      await widget.imgGrid?.call();
      _model.mostrarEmListaMicroComponente = false;
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Produtos 30',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).secondary,
                letterSpacing: 0.0,
              ),
        ),
        Material(
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
                    fillColor: widget!.parameter1 == false
                        ? widget!.parameter2
                        : Color(0x00000000),
                    icon: Icon(
                      Icons.image_outlined,
                      color: widget!.parameter1 == false
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'MOSTRAR_CARDS_LISTA_image_outlined_ICN_O');
                      await widget.imgGrid?.call();
                      _model.mostrarEmListaMicroComponente = false;
                      safeSetState(() {});
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 24.0,
                    buttonSize: 40.0,
                    fillColor: widget!.parameter1 == true
                        ? widget!.parameter2
                        : Color(0x00000000),
                    icon: Icon(
                      Icons.list,
                      color: widget!.parameter1 == true
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'MOSTRAR_CARDS_LISTA_COMP_list_ICN_ON_TAP');
                      await widget.imgList?.call();
                      _model.mostrarEmListaMicroComponente = true;
                      safeSetState(() {});
                    },
                  ),
                ].divide(SizedBox(width: 4.0)).around(SizedBox(width: 4.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
