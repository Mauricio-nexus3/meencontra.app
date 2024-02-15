import '/backend/backend.dart';
import '/dashboardmeencontra/componentes/card_tabelamecontrata/card_tabelamecontrata_widget.dart';
import '/dashboardmeencontra/componentes/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'me_dashboardmecontrata_widget.dart' show MeDashboardmecontrataWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardmecontrataModel
    extends FlutterFlowModel<MeDashboardmecontrataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    menuLateralDashboardModel1 =
        createModel(context, () => MenuLateralDashboardModel());
    menuLateralDashboardModel2 =
        createModel(context, () => MenuLateralDashboardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuLateralDashboardModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    menuLateralDashboardModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
