import '/components/acao_tabale_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_tabelameinforma_model.dart';
export 'card_tabelameinforma_model.dart';

class CardTabelameinformaWidget extends StatefulWidget {
  const CardTabelameinformaWidget({
    super.key,
    required this.imgCapa,
    String? tituloMateria,
    required this.dia,
    this.categoria,
    this.leitores,
    required this.materiaRef,
  }) : this.tituloMateria = tituloMateria ?? '';

  final String? imgCapa;
  final String tituloMateria;
  final String? dia;
  final String? categoria;
  final double? leitores;
  final DocumentReference? materiaRef;

  @override
  State<CardTabelameinformaWidget> createState() =>
      _CardTabelameinformaWidgetState();
}

class _CardTabelameinformaWidgetState extends State<CardTabelameinformaWidget> {
  late CardTabelameinformaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardTabelameinformaModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xFFF1F4F8),
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                widget.imgCapa!,
                                width: 32.0,
                                height: 32.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.tituloMateria,
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kcalendario,
                        color: FlutterFlowTheme.of(context).accent2,
                        size: 16.0,
                      ),
                      Text(
                        widget.dia!,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: Icon(
                          FFIcons.kmeInformaON,
                          color: FlutterFlowTheme.of(context).accent2,
                          size: 16.0,
                        ),
                      ),
                      Text(
                        widget.categoria!,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 32.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.group_add_outlined,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 16.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                widget.leitores.toString(),
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.more_vert,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if (MediaQuery.sizeOf(context).width > 991.0) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: AcaoTabaleWidget(
                                      compartiharURL: () async {},
                                      visualizar: () async {
                                        context.pushNamed(
                                          'meinformaDetalhesNoticia',
                                          queryParameters: {
                                            'materiaRef': serializeParam(
                                              widget.materiaRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      editar: () async {
                                        context.pushNamed(
                                          'EditarMateria',
                                          queryParameters: {
                                            'materiaRef': serializeParam(
                                              widget.materiaRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      excluir: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Excluir matéria?'),
                                                        content: Text(
                                                            'Você tem certeza que você quer excluir essa matéria?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Cancelar'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Sim, excluir'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await widget.materiaRef!.delete();
                                        } else {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: AcaoTabaleWidget(
                                      compartiharURL: () async {},
                                      visualizar: () async {
                                        context.pushNamed(
                                          'meinformaDetalhesNoticia',
                                          queryParameters: {
                                            'materiaRef': serializeParam(
                                              widget.materiaRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      editar: () async {
                                        context.pushNamed(
                                          'EditarMateria',
                                          queryParameters: {
                                            'materiaRef': serializeParam(
                                              widget.materiaRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      excluir: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Excluir matéria?'),
                                                        content: Text(
                                                            'Você tem certeza que você quer excluir essa matéria?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text(
                                                                'Cancelar'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text(
                                                                'Sim, excluir'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await widget.materiaRef!.delete();
                                        } else {
                                          return;
                                        }
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
