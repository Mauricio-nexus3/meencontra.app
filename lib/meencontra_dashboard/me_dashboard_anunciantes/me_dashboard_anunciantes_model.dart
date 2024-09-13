import '/anunciante_cadastro/componentes/editar_anunciante/editar_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes_globais/menus/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/componentes_globais/pop_up/acao_tabale/acao_tabale_widget.dart';
import '/componentes_globais/pop_up/componente_geral/componente_geral_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'me_dashboard_anunciantes_widget.dart' show MeDashboardAnunciantesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardAnunciantesModel
    extends FlutterFlowModel<MeDashboardAnunciantesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel2;
  // State field(s) for lupa widget.
  FocusNode? lupaFocusNode;
  TextEditingController? lupaTextController;
  String? Function(BuildContext, String?)? lupaTextControllerValidator;
  // Algolia Search Results from action on lupa
  List<AnuncianteRecord>? algoliaSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in componenteGeral widget.
  List<UsersRecord>? allUsers;

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
    lupaFocusNode?.dispose();
    lupaTextController?.dispose();
  }
}
