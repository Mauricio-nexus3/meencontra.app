import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes_globais/menus/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'me_dashboard_widget.dart' show MeDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardModel extends FlutterFlowModel<MeDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in meDashboard widget.
  int? queryAnunciantes;
  // Stores action output result for [Firestore Query - Query a collection] action in meDashboard widget.
  int? queryMaterias;
  // Stores action output result for [Firestore Query - Query a collection] action in meDashboard widget.
  int? querymecontrata;
  // Stores action output result for [Firestore Query - Query a collection] action in meDashboard widget.
  int? querymedivirta;
  // Stores action output result for [Firestore Query - Query a collection] action in meDashboard widget.
  int? querysuporte;
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel2;

  @override
  void initState(BuildContext context) {
    menuLateralDashboardModel1 =
        createModel(context, () => MenuLateralDashboardModel());
    menuLateralDashboardModel2 =
        createModel(context, () => MenuLateralDashboardModel());
  }

  @override
  void dispose() {
    menuLateralDashboardModel1.dispose();
    menuLateralDashboardModel2.dispose();
  }
}
