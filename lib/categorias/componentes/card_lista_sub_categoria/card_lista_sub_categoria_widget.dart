import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_lista_sub_categoria_model.dart';
export 'card_lista_sub_categoria_model.dart';

class CardListaSubCategoriaWidget extends StatefulWidget {
  const CardListaSubCategoriaWidget({
    super.key,
    this.logo,
    this.nome,
    this.parameter3,
    this.endereco,
    this.planoAssinatura,
    this.nota,
    required this.regatado,
    required this.whatsapp,
  });

  final String? logo;
  final String? nome;
  final DocumentReference? parameter3;
  final String? endereco;
  final String? planoAssinatura;
  final double? nota;
  final bool? regatado;
  final String? whatsapp;

  @override
  State<CardListaSubCategoriaWidget> createState() =>
      _CardListaSubCategoriaWidgetState();
}

class _CardListaSubCategoriaWidgetState
    extends State<CardListaSubCategoriaWidget> {
  late CardListaSubCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardListaSubCategoriaModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x411D2429),
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0.8,
              shape: const CircleBorder(),
              child: Container(
                width: 64.0,
                height: 64.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget!.planoAssinatura != 'gratis'
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).accent4,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Image.network(
                      widget!.logo!,
                      width: 64.0,
                      height: 64.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget!.nome!.maybeHandleOverflow(maxChars: 25),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            wrapWithModel(
                              model: _model.selosAnuncianteModel,
                              updateCallback: () => safeSetState(() {}),
                              child: SelosAnuncianteWidget(
                                planoAnunciante: widget!.planoAssinatura!,
                                tamanhoPequenoNormalGrande: 'Pequeno',
                                resgatado: false,
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: Icon(
                            FFIcons.kpikerMap,
                            color: widget!.planoAssinatura != 'gratis'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).accent2,
                            size: 14.0,
                          ),
                        ),
                        AutoSizeText(
                          widget!.endereco!.maybeHandleOverflow(
                            maxChars: 24,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 4.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: widget!.planoAssinatura != 'gratis'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).accent2,
                            size: 14.0,
                          ),
                        ),
                        AutoSizeText(
                          valueOrDefault<String>(
                            widget!.whatsapp,
                            '51 9 87654321',
                          ).maybeHandleOverflow(
                            maxChars: 24,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
