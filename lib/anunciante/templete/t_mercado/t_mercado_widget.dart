import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_mercado_model.dart';
export 't_mercado_model.dart';

class TMercadoWidget extends StatefulWidget {
  const TMercadoWidget({
    super.key,
    required this.doc,
  });

  final AnuncianteRecord? doc;

  @override
  State<TMercadoWidget> createState() => _TMercadoWidgetState();
}

class _TMercadoWidgetState extends State<TMercadoWidget> {
  late TMercadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TMercadoModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    width: 8.0,
                  ),
                ),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget!.doc!.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.doc?.nomeFantasia,
                  'meencontra.app',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.doc?.nomeSubCategoria02 != null &&
                          widget!.doc?.nomeSubCategoria02 != ''
                      ? '${widget!.doc?.nomeSubCategoria01}, ${widget!.doc?.nomeSubCategoria02}'
                      : widget!.doc?.nomeSubCategoria01,
                  'Categoria',
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('T_MERCADO_COMP_Row_14hdjap6_ON_TAP');
                        await action_blocks.whatsapp(
                          context,
                          ref: widget!.doc?.reference,
                          whatsappt: widget!.doc?.whatsComercial,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: valueOrDefault<Color>(
                                  widget!.doc?.cor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Whatsapp',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('T_MERCADO_COMP_Row_9ln6usfo_ON_TAP');
                        await action_blocks.facebook(
                          context,
                          facebookl: widget!.doc?.facebook,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                FFIcons.kfacebook,
                                color: valueOrDefault<Color>(
                                  widget!.doc?.cor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Facebook',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('T_MERCADO_COMP_Row_hkjoias0_ON_TAP');
                        await action_blocks.instagram(
                          context,
                          instagramt: widget!.doc?.instagram,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: valueOrDefault<Color>(
                                  widget!.doc?.cor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Instagram',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('T_MERCADO_COMP_Row_hl2p45hj_ON_TAP');
                        await action_blocks.maps(
                          context,
                          mapa: widget!.doc?.googleMaps,
                          endereco: widget!.doc?.enderecoCompleto,
                          refAnunciante: widget!.doc?.reference,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                FFIcons.kmapMarker,
                                color: valueOrDefault<Color>(
                                  widget!.doc?.cor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Localização',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('T_MERCADO_COMP_Row_625iu8vs_ON_TAP');
                        await action_blocks.call(
                          context,
                          telefone: widget!.doc?.telefoneFixo,
                          ref: widget!.doc?.reference,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.call,
                                color: valueOrDefault<Color>(
                                  widget!.doc?.cor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Ligar',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget!.doc?.descricao,
                      'Bio',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 24.0)).around(SizedBox(height: 24.0)),
      ),
    );
  }
}
