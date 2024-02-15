import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_nw_anunciante_widget.dart' show DashboardNwAnuncianteWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardNwAnuncianteModel
    extends FlutterFlowModel<DashboardNwAnuncianteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel1;
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newDashAnuncianteModel1 =
        createModel(context, () => NewDashAnuncianteModel());
    newDashAnuncianteModel2 =
        createModel(context, () => NewDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newDashAnuncianteModel1.dispose();
    newDashAnuncianteModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
