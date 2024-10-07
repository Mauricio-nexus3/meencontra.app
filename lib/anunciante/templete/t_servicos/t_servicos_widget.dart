import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_servicos_model.dart';
export 't_servicos_model.dart';

class TServicosWidget extends StatefulWidget {
  /// Templete de alimentação
  const TServicosWidget({
    super.key,
    required this.doc,
  });

  final AnuncianteRecord? doc;

  @override
  State<TServicosWidget> createState() => _TServicosWidgetState();
}

class _TServicosWidgetState extends State<TServicosWidget> {
  late TServicosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TServicosModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 500.0,
            child: Stack(
              alignment: AlignmentDirectional(0.0, -1.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Image.network(
                    widget!.doc!.logo,
                    width: double.infinity,
                    height: 500.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 10.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 144.0,
                        decoration: BoxDecoration(
                          color: Color(0x801D2429),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.doc?.nomeFantasia,
                                      'meencontra.app',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      valueOrDefault<String>(
                                                    widget!.doc
                                                        ?.nomeSubCategoria02,
                                                    'meencontra.app',
                                                  ) !=
                                                  null &&
                                              valueOrDefault<String>(
                                                    widget!.doc
                                                        ?.nomeSubCategoria02,
                                                    'meencontra.app',
                                                  ) !=
                                                  ''
                                          ? '${valueOrDefault<String>(
                                              widget!.doc?.nomeSubCategoria01,
                                              'meencontra.app',
                                            )}, ${valueOrDefault<String>(
                                              widget!.doc?.nomeSubCategoria02,
                                              'meencontra.app',
                                            )}'
                                          : valueOrDefault<String>(
                                              widget!.doc?.nomeSubCategoria01,
                                              'meencontra.app',
                                            ),
                                      'Categoria',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 0.0,
                                    buttonSize: 50.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'T_SERVICOS_COMP_whatsapp_ICN_ON_TAP');
                                      await action_blocks.whatsapp(
                                        context,
                                        ref: widget!.doc?.reference,
                                        whatsappt: widget!.doc?.whatsComercial,
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.kinstagram1,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'T_SERVICOS_COMP_instagram1_ICN_ON_TAP');
                                      await action_blocks.instagram(
                                        context,
                                        instagramt: widget!.doc?.instagram,
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.kfacebook,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'T_SERVICOS_COMP_facebook_ICN_ON_TAP');
                                      await action_blocks.facebook(
                                        context,
                                        facebookl: widget!.doc?.facebook,
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 0.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.kmapMarker,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'T_SERVICOS_COMP_mapMarker_ICN_ON_TAP');
                                      await action_blocks.maps(
                                        context,
                                        mapa: widget!.doc?.googleMaps,
                                        endereco: widget!.doc?.enderecoCompleto,
                                        refAnunciante: widget!.doc?.reference,
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 0.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      Icons.call,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'T_SERVICOS_COMP_call_ICN_ON_TAP');
                                      await action_blocks.call(
                                        context,
                                        telefone: widget!.doc?.telefoneFixo,
                                        ref: widget!.doc?.reference,
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
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
        ],
      ),
    );
  }
}
