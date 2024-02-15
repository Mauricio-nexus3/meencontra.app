import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dash_m_e_d_i_v_i_r_t_a_model.dart';
export 'dash_m_e_d_i_v_i_r_t_a_model.dart';

class DashMEDIVIRTAWidget extends StatefulWidget {
  const DashMEDIVIRTAWidget({
    super.key,
    required this.fotoImg,
    required this.nomeEvento,
    required this.dia,
    required this.mes,
    required this.horario,
    required this.tipoEvento,
    required this.local,
    required this.eventoRef,
  });

  final String? fotoImg;
  final String? nomeEvento;
  final String? dia;
  final String? mes;
  final String? horario;
  final String? tipoEvento;
  final String? local;
  final DocumentReference? eventoRef;

  @override
  State<DashMEDIVIRTAWidget> createState() => _DashMEDIVIRTAWidgetState();
}

class _DashMEDIVIRTAWidgetState extends State<DashMEDIVIRTAWidget> {
  late DashMEDIVIRTAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashMEDIVIRTAModel());

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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'meDivirtiDetalhesEvento',
                    queryParameters: {
                      'eventoRef': serializeParam(
                        widget.eventoRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.fotoImg!,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            widget.nomeEvento!,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward_rounded,
                      color: FlutterFlowTheme.of(context).tertiary,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 24.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.dia} de ${widget.mes}',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              Text(
                                widget.horario!,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'EditarEvento',
                            queryParameters: {
                              'eventoRef': serializeParam(
                                widget.eventoRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Icon(
                          FFIcons.kpencil,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kpikerMap,
                            color: FlutterFlowTheme.of(context).tertiary,
                            size: 22.0,
                          ),
                          Text(
                            widget.local!,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kmeDivirtaOFF,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                              Text(
                                widget.tipoEvento!,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: Text('Excluir evento'),
                                      content: Text(
                                          'Tem certeza que quer excluir esse evento?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Sim, excluir'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await widget.eventoRef!.delete();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Item excluido',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            return;
                          }
                        },
                        child: Icon(
                          FFIcons.ktrashOutline,
                          color: FlutterFlowTheme.of(context).error,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
