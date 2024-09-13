import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_perfil_model.dart';
export 'appbar_perfil_model.dart';

class AppbarPerfilWidget extends StatefulWidget {
  const AppbarPerfilWidget({
    super.key,
    required this.actionShare,
    required this.iduserProfile,
    this.actionResgatarMeuNegocio,
    required this.planoAssinatura,
    this.actionDrawer,
  });

  final Future Function()? actionShare;
  final String? iduserProfile;
  final Future Function()? actionResgatarMeuNegocio;
  final String? planoAssinatura;
  final Future Function()? actionDrawer;

  @override
  State<AppbarPerfilWidget> createState() => _AppbarPerfilWidgetState();
}

class _AppbarPerfilWidgetState extends State<AppbarPerfilWidget> {
  late AppbarPerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarPerfilModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x520E151B),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              children: [
                if (widget!.iduserProfile != currentUserUid)
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('APPBAR_PERFIL_COMP_back_ON_TAP');
                      context.safePop();
                    },
                  ),
                if (widget!.iduserProfile == currentUserUid)
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.menu_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('APPBAR_PERFIL_COMP_menuToggle_ON_TAP');
                      await widget.actionDrawer?.call();
                    },
                  ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((widget!.planoAssinatura == PlanoAssinatura.gratis.name) &&
                    (valueOrDefault(currentUserDocument?.perfil, '') !=
                        PerfilUsuario.Anunciante.name))
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x520E151B),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          FFIcons.kresgatar,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'APPBAR_PERFIL_COMP_resgatar_ICN_ON_TAP');
                          await widget.actionResgatarMeuNegocio?.call();
                        },
                      ),
                    ),
                  ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x520E151B),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.ios_share,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'APPBAR_PERFIL_COMP_ios_share_ICN_ON_TAP');
                      await widget.actionShare?.call();
                    },
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
