import '/backend/backend.dart';
import '/componentes_globais/menus/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/componentes_globais/pop_up/acao_tabale/acao_tabale_widget.dart';
import '/componentes_globais/pop_up/componente_geral/componente_geral_widget.dart';
import '/componentes_globais/pop_up/popup_usuario/popup_usuario_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'me_dashboard_usuarios_widget.dart' show MeDashboardUsuariosWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardUsuariosModel
    extends FlutterFlowModel<MeDashboardUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    menuLateralDashboardModel2.dispose();
  }
}
