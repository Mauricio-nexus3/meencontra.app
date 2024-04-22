import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/anunciante/assinatura/aviso_upgrade/aviso_upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dash_anunciante_assinatura_widget.dart'
    show DashAnuncianteAssinaturaWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashAnuncianteAssinaturaModel
    extends FlutterFlowModel<DashAnuncianteAssinaturaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel1;
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel2;

  @override
  void initState(BuildContext context) {
    menuDashAnuncianteModel1 =
        createModel(context, () => MenuDashAnuncianteModel());
    menuDashAnuncianteModel2 =
        createModel(context, () => MenuDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuDashAnuncianteModel1.dispose();
    menuDashAnuncianteModel2.dispose();
  }
}
