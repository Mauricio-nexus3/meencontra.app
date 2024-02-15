import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'adicionar_horario_model.dart';
export 'adicionar_horario_model.dart';

class AdicionarHorarioWidget extends StatefulWidget {
  const AdicionarHorarioWidget({
    super.key,
    required this.anuncianteREFt,
  });

  final DocumentReference? anuncianteREFt;

  @override
  State<AdicionarHorarioWidget> createState() => _AdicionarHorarioWidgetState();
}

class _AdicionarHorarioWidgetState extends State<AdicionarHorarioWidget> {
  late AdicionarHorarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarHorarioModel());

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

    return Container(
      width: double.infinity,
      height: 400.0,
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
            FlutterFlowDropDown<String>(
              controller: _model.dropDownPeriodoValueController ??=
                  FormFieldController<String>(null),
              options: ['Diurno', 'Noturno', '24 horas'],
              onChanged: (val) =>
                  setState(() => _model.dropDownPeriodoValue = val),
              width: 300.0,
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              hintText: 'Período de atendimento',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).primary,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
            Builder(
              builder: (context) {
                if (_model.dropDownPeriodoValue == '24 horas') {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Atendimento',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        '24 horas',
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .around(SizedBox(height: 12.0)),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.dropDownPeriodoValue == 'Noturno')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '* ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Atendimento ultrapassa a meia noite?',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Ex: 20:00 - 03:00',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent2,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              _model.checkboxUltrapassaMeiaNoiteValue ==
                                                      false
                                                  ? 'Não'
                                                  : 'Sim',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkboxUltrapassaMeiaNoiteValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .checkboxUltrapassaMeiaNoiteValue =
                                                      newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}'
                            : 'Horario de abertura',
                        icon: FaIcon(
                          FontAwesomeIcons.clock,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
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
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}'
                            : 'Horario de fechamento',
                        icon: FaIcon(
                          FontAwesomeIcons.clock,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                  );
                }
              },
            ),
            FFButtonWidget(
              onPressed: () async {
                if (_model.dropDownPeriodoValue != null &&
                    _model.dropDownPeriodoValue != '') {
                  if (_model.dropDownPeriodoValue == '24 horas') {
                    // há uma série de condicionais que indicam o dia da semana

                    await HorarioAtendimentoRecord.createDoc(
                            widget.anuncianteREFt!)
                        .set(createHorarioAtendimentoRecordData(
                      periodo: _model.dropDownPeriodoValue,
                      diaSemana: 7,
                    ));
                    setState(() {
                      FFAppState().horarioAtendimento = true;
                    });
                    Navigator.pop(context, true);
                    return;
                  } else {
                    if ((_model.datePicked1 != null) &&
                        (_model.datePicked2 != null)) {
                      // há uma série de condicionais que indicam o dia da semana

                      await HorarioAtendimentoRecord.createDoc(
                              widget.anuncianteREFt!)
                          .set(createHorarioAtendimentoRecordData(
                        horaAbre: _model.datePicked1,
                        horaFecha: _model.datePicked2,
                        diaSemana: () {
                          if (_model.dropDownPeriodoValue == 'Segunda-feira') {
                            return 1;
                          } else if (_model.dropDownPeriodoValue ==
                              'Terça-feira') {
                            return 2;
                          } else if (_model.dropDownPeriodoValue ==
                              'Quarta-feira') {
                            return 3;
                          } else if (_model.dropDownPeriodoValue ==
                              'Quinta-feira') {
                            return 4;
                          } else if (_model.dropDownPeriodoValue ==
                              'Sexta-feira') {
                            return 5;
                          } else if (_model.dropDownPeriodoValue == 'Sábado') {
                            return 6;
                          } else {
                            return 7;
                          }
                        }(),
                        periodo: _model.dropDownPeriodoValue,
                        ultraPassaMeiaNoite:
                            _model.checkboxUltrapassaMeiaNoiteValue,
                      ));
                      setState(() {
                        FFAppState().horarioAtendimento = true;
                      });
                      Navigator.pop(context, true);
                      return;
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text('Horarios não foram informados'),
                              content: Text(
                                  'Favor, verifique se os horarios foram devidamente marcados'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      return;
                    }
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return WebViewAware(
                        child: AlertDialog(
                          title: Text('Há campos invalido'),
                          content: Text(
                              'Favor, verifique se os horarios foram devidamente marcados'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  return;
                }
              },
              text: 'Cadastrar',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
  }
}
