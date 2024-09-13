import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medivirta_card_model.dart';
export 'medivirta_card_model.dart';

class MedivirtaCardWidget extends StatefulWidget {
  const MedivirtaCardWidget({
    super.key,
    required this.fotoCapa,
    required this.tituloEvento,
    required this.tipoEvento,
    required this.horario,
    required this.local,
    required this.km,
    required this.ingressoURL,
  });

  final String? fotoCapa;
  final String? tituloEvento;
  final String? tipoEvento;
  final DateTime? horario;
  final String? local;
  final LatLng? km;
  final String? ingressoURL;

  @override
  State<MedivirtaCardWidget> createState() => _MedivirtaCardWidgetState();
}

class _MedivirtaCardWidgetState extends State<MedivirtaCardWidget> {
  late MedivirtaCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedivirtaCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 16.0,
              color: Color(0x14000000),
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width < 480.0) {
                            return 100.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              1080.0) {
                            return 120.0;
                          } else if (MediaQuery.sizeOf(context).width >
                              1081.0) {
                            return 130.0;
                          } else {
                            return 100.0;
                          }
                        }(),
                        height: () {
                          if (MediaQuery.sizeOf(context).width < 480.0) {
                            return 100.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              1080.0) {
                            return 120.0;
                          } else if (MediaQuery.sizeOf(context).width >
                              1081.0) {
                            return 130.0;
                          } else {
                            return 100.0;
                          }
                        }(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            widget!.fotoCapa!,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget!.tituloEvento!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >
                                                  480.0
                                              ? 16.0
                                              : 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kmeDivirtaOFF,
                                    color: FlutterFlowTheme.of(context).accent2,
                                    size: 12.0,
                                  ),
                                  Text(
                                    widget!.tipoEvento!,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize:
                                              MediaQuery.sizeOf(context).width >
                                                      480.0
                                                  ? 14.0
                                                  : 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kcalendario,
                                    color: FlutterFlowTheme.of(context).accent2,
                                    size: 12.0,
                                  ),
                                  Text(
                                    '${dateTimeFormat(
                                      "E",
                                      widget!.horario,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}${dateTimeFormat(
                                      "d",
                                      widget!.horario,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} - ${dateTimeFormat(
                                      "Hm",
                                      widget!.horario,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          fontSize:
                                              MediaQuery.sizeOf(context).width >
                                                      480.0
                                                  ? 14.0
                                                  : 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 4.0)),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kpikerMap,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      size: 12.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        widget!.local!.maybeHandleOverflow(
                                          maxChars: 16,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width >
                                                          480.0
                                                      ? 14.0
                                                      : 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_outward_rounded,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 24.0,
                    ),
                    if (widget!.ingressoURL != null &&
                        widget!.ingressoURL != '')
                      Icon(
                        Icons.confirmation_num_outlined,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 24.0,
                      ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
