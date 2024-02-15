import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_horairo2_model.dart';
export 'editar_horairo2_model.dart';

class EditarHorairo2Widget extends StatefulWidget {
  const EditarHorairo2Widget({
    super.key,
    required this.anuncianteREFt,
  });

  final DocumentReference? anuncianteREFt;

  @override
  State<EditarHorairo2Widget> createState() => _EditarHorairo2WidgetState();
}

class _EditarHorairo2WidgetState extends State<EditarHorairo2Widget> {
  late EditarHorairo2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarHorairo2Model());

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

    return StreamBuilder<HorarioAtendimentoRecord>(
      stream: HorarioAtendimentoRecord.getDocument(widget.anuncianteREFt!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF622AE2),
                ),
              ),
            ),
          );
        }
        final bottomSheetEditHorarioAtendimentoRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 320.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(0.0, -3.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
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
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 50.0,
                    child: Divider(
                      thickness: 3.0,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked1Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                        if (_datePicked1Time != null) {
                          safeSetState(() {
                            _model.datePicked1 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked1Time.hour,
                              _datePicked1Time.minute,
                            );
                          });
                        }
                      },
                      text: _model.datePicked1 != null
                          ? 'Abre: ${dateTimeFormat(
                              'Hm',
                              _model.datePicked1,
                              locale: FFLocalizations.of(context).languageCode,
                            )}'
                          : 'Abre: ${dateTimeFormat(
                              'Hm',
                              bottomSheetEditHorarioAtendimentoRecord.horaAbre,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                      icon: FaIcon(
                        FontAwesomeIcons.clock,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final _datePicked2Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                        if (_datePicked2Time != null) {
                          safeSetState(() {
                            _model.datePicked2 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked2Time.hour,
                              _datePicked2Time.minute,
                            );
                          });
                        }
                      },
                      text: _model.datePicked2 != null
                          ? 'Fecha: ${dateTimeFormat(
                              'Hm',
                              _model.datePicked2,
                              locale: FFLocalizations.of(context).languageCode,
                            )}'
                          : 'Fecha: ${dateTimeFormat(
                              'Hm',
                              bottomSheetEditHorarioAtendimentoRecord.horaFecha,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                      icon: FaIcon(
                        FontAwesomeIcons.clock,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await widget.anuncianteREFt!
                        .update(createHorarioAtendimentoRecordData(
                      horaAbre: _model.datePicked1,
                      horaFecha: _model.datePicked2,
                    ));
                    Navigator.pop(context);
                    await Future.delayed(const Duration(milliseconds: 1000));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Horario atualizado',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  },
                  text: 'Atualizar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
