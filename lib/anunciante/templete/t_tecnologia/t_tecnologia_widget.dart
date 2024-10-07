import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_tecnologia_model.dart';
export 't_tecnologia_model.dart';

class TTecnologiaWidget extends StatefulWidget {
  const TTecnologiaWidget({
    super.key,
    required this.doc,
  });

  final AnuncianteRecord? doc;

  @override
  State<TTecnologiaWidget> createState() => _TTecnologiaWidgetState();
}

class _TTecnologiaWidgetState extends State<TTecnologiaWidget> {
  late TTecnologiaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TTecnologiaModel());

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
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget!.doc?.nomeFantasia,
                                    'meencontra.app',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget!.doc?.nomeSubCategoria02 != null &&
                                            widget!.doc?.nomeSubCategoria02 !=
                                                ''
                                        ? '${widget!.doc?.nomeSubCategoria01}, ${widget!.doc?.nomeSubCategoria02}'
                                        : widget!.doc?.nomeSubCategoria01,
                                    'Categoria',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
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
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  borderColor: valueOrDefault<Color>(
                    widget!.doc?.cor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 72.0,
                  icon: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 40.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('T_TECNOLOGIA_COMP_whatsapp_ICN_ON_TAP');
                    await action_blocks.whatsapp(
                      context,
                      ref: widget!.doc?.reference,
                      whatsappt: widget!.doc?.whatsComercial,
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: valueOrDefault<Color>(
                    widget!.doc?.cor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 72.0,
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 40.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('T_TECNOLOGIA_COMP_instagram_ICN_ON_TAP');
                    await action_blocks.instagram(
                      context,
                      instagramt: widget!.doc?.instagram,
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: valueOrDefault<Color>(
                    widget!.doc?.cor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 72.0,
                  icon: Icon(
                    Icons.facebook_rounded,
                    color: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 40.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'T_TECNOLOGIA_facebook_rounded_ICN_ON_TAP');
                    await action_blocks.facebook(
                      context,
                      facebookl: widget!.doc?.facebook,
                    );
                  },
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 72.0,
                    icon: Icon(
                      Icons.call,
                      color: valueOrDefault<Color>(
                        widget!.doc?.cor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      size: 40.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('T_TECNOLOGIA_COMP_call_ICN_ON_TAP');
                      await action_blocks.call(
                        context,
                        telefone: widget!.doc?.telefoneFixo,
                        ref: widget!.doc?.reference,
                      );
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 72.0,
                    icon: Icon(
                      FFIcons.kmapMarker,
                      color: valueOrDefault<Color>(
                        widget!.doc?.cor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      size: 40.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'T_TECNOLOGIA_COMP_mapMarker_ICN_ON_TAP');
                      await action_blocks.maps(
                        context,
                        mapa: widget!.doc?.googleMaps,
                        endereco: widget!.doc?.enderecoCompleto,
                        refAnunciante: widget!.doc?.reference,
                      );
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: valueOrDefault<Color>(
                      widget!.doc?.cor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 72.0,
                    icon: Icon(
                      FFIcons.kcomentarios,
                      color: valueOrDefault<Color>(
                        widget!.doc?.cor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      size: 40.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
