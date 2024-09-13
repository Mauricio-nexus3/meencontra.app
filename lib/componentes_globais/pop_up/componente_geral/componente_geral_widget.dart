import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'componente_geral_model.dart';
export 'componente_geral_model.dart';

class ComponenteGeralWidget extends StatefulWidget {
  const ComponenteGeralWidget({
    super.key,
    required this.col01Imagem,
    required this.col01StringPrincipal,
    required this.col01StringSecundario,
    this.col02Icon,
    required this.col02String,
    required this.col03Icone,
    this.col03String,
    this.col04icon,
    this.col04bool,
    required this.paginaAtual,
    required this.actionCallBackIconMore,
    required this.callBackFotoAnunciante,
  });

  final String? col01Imagem;
  final String? col01StringPrincipal;
  final String? col01StringSecundario;
  final Widget? col02Icon;
  final String? col02String;
  final Widget? col03Icone;
  final String? col03String;
  final Widget? col04icon;
  final bool? col04bool;
  final String? paginaAtual;
  final Future Function()? actionCallBackIconMore;
  final Future Function()? callBackFotoAnunciante;

  @override
  State<ComponenteGeralWidget> createState() => _ComponenteGeralWidgetState();
}

class _ComponenteGeralWidgetState extends State<ComponenteGeralWidget> {
  late ComponenteGeralModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponenteGeralModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: Color(0xFFF1F4F8),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'COMPONENTE_GERAL_Row_1858fpkf_ON_TAP');
                          await widget.callBackFotoAnunciante?.call();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      widget!.col01Imagem,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/an2o1vobjz2j/placeholder_img.png',
                                    ),
                                    width: 32.0,
                                    height: 32.0,
                                    fit: BoxFit.cover,
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
                                    Text(
                                      valueOrDefault<String>(
                                        widget!.col01StringPrincipal,
                                        'NomePrincipal',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget!.col01StringSecundario,
                                              'NomeSec',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 4.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widget!.col02Icon!,
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Flexible(
                            child: Text(
                              valueOrDefault<String>(
                                widget!.col02String,
                                'categoria',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF14181B),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widget!.col03Icone!,
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Flexible(
                            child: Text(
                              valueOrDefault<String>(
                                widget!.col03String,
                                'data',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF14181B),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget!.paginaAtual == 'meinforma')
                                widget!.col04icon!,
                              Flexible(
                                child: Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: widget!.col04bool == true
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0xFFF1F4F8),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      widget!.col04bool == true ? 'Sim' : 'Não',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: widget!.col04bool == true
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .accent2,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
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
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.more_vert,
                            color: Color(0xFF57636C),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'COMPONENTE_GERAL_more_vert_ICN_ON_TAP');
                            await widget.actionCallBackIconMore?.call();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
