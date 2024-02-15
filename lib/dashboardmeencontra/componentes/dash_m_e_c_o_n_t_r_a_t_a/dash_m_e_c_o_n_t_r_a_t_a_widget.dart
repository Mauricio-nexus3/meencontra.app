import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dash_m_e_c_o_n_t_r_a_t_a_model.dart';
export 'dash_m_e_c_o_n_t_r_a_t_a_model.dart';

class DashMECONTRATAWidget extends StatefulWidget {
  const DashMECONTRATAWidget({
    super.key,
    required this.nomeVaga,
    required this.vagaRef,
    required this.logoVagaRef,
    required this.nomeEmpresa,
    required this.localidade,
    required this.aplicadosVaga,
    required this.dataPublicacao,
    required this.statusVaga,
  });

  final String? nomeVaga;
  final DocumentReference? vagaRef;
  final String? logoVagaRef;
  final String? nomeEmpresa;
  final String? localidade;
  final int? aplicadosVaga;
  final String? dataPublicacao;
  final String? statusVaga;

  @override
  State<DashMECONTRATAWidget> createState() => _DashMECONTRATAWidgetState();
}

class _DashMECONTRATAWidgetState extends State<DashMECONTRATAWidget> {
  late DashMECONTRATAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashMECONTRATAModel());

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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.nomeVaga!,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'meContrataDetalhesVaga',
                        queryParameters: {
                          'vagaRef': serializeParam(
                            widget.vagaRef,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.arrow_outward_rounded,
                      color: Color(0xFF119526),
                      size: 24.0,
                    ),
                  ),
                ],
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
                          Container(
                            width: 30.0,
                            height: 30.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              widget.logoVagaRef!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            widget.nomeEmpresa!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
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
                            'EditarVaga',
                            queryParameters: {
                              'editarVaga': serializeParam(
                                widget.vagaRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Icon(
                          FFIcons.kpencil,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 16.0,
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
                          Text(
                            'Localidade:',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            widget.localidade!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
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
                    children: [
                      Text(
                        'Aplicados a vaga:',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.aplicadosVaga?.toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Publicada:',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      Text(
                        widget.dataPublicacao!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Status',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                          Text(
                            widget.statusVaga!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
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
                                      title: Text('Excluir vaga'),
                                      content: Text(
                                          'Tem certeza que deseja excluir essa vaga?'),
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
                            await widget.vagaRef!.delete();
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
                ].divide(SizedBox(height: 12.0)),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
