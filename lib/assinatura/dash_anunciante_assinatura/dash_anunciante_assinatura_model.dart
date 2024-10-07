import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes_globais/menu_drawer/menu_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
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

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel1;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel2;

  @override
  void initState(BuildContext context) {
    menuDrawerModel1 = createModel(context, () => MenuDrawerModel());
    menuDrawerModel2 = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    menuDrawerModel1.dispose();
    menuDrawerModel2.dispose();
  }
}
