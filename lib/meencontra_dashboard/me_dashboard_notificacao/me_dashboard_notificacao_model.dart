import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes_globais/menus/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'me_dashboard_notificacao_widget.dart' show MeDashboardNotificacaoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardNotificacaoModel
    extends FlutterFlowModel<MeDashboardNotificacaoWidget> {
  ///  Local state fields for this page.

  AnuncianteRecord? anuncianteSelecionado;

  ///  State fields for stateful widgets in this page.

  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for tituloNotificacao widget.
  FocusNode? tituloNotificacaoFocusNode;
  TextEditingController? tituloNotificacaoTextController;
  String? Function(BuildContext, String?)?
      tituloNotificacaoTextControllerValidator;
  // State field(s) for textoNotificacao widget.
  FocusNode? textoNotificacaoFocusNode;
  TextEditingController? textoNotificacaoTextController;
  String? Function(BuildContext, String?)?
      textoNotificacaoTextControllerValidator;
  // State field(s) for URL_notificacao widget.
  FocusNode? uRLNotificacaoFocusNode;
  TextEditingController? uRLNotificacaoTextController;
  String? Function(BuildContext, String?)?
      uRLNotificacaoTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for TituloComunicado widget.
  FocusNode? tituloComunicadoFocusNode;
  TextEditingController? tituloComunicadoTextController;
  String? Function(BuildContext, String?)?
      tituloComunicadoTextControllerValidator;
  // State field(s) for versao widget.
  FocusNode? versaoFocusNode;
  TextEditingController? versaoTextController;
  String? Function(BuildContext, String?)? versaoTextControllerValidator;
  // State field(s) for detalhes widget.
  FocusNode? detalhesFocusNode;
  TextEditingController? detalhesTextController;
  String? Function(BuildContext, String?)? detalhesTextControllerValidator;
  // State field(s) for URL_DestinoComunicado widget.
  FocusNode? uRLDestinoComunicadoFocusNode;
  TextEditingController? uRLDestinoComunicadoTextController;
  String? Function(BuildContext, String?)?
      uRLDestinoComunicadoTextControllerValidator;
  // State field(s) for allApp widget.
  final allAppKey = GlobalKey();
  FocusNode? allAppFocusNode;
  TextEditingController? allAppTextController;
  String? allAppSelectedOption;
  String? Function(BuildContext, String?)? allAppTextControllerValidator;
  // Algolia Search Results from action on allApp
  List<AnuncianteRecord>? algoliaSearchResults = [];
  // State field(s) for textoNotificacaoAnunciante widget.
  FocusNode? textoNotificacaoAnuncianteFocusNode;
  TextEditingController? textoNotificacaoAnuncianteTextController;
  String? Function(BuildContext, String?)?
      textoNotificacaoAnuncianteTextControllerValidator;
  DateTime? datePicked2;

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
    tabBarController?.dispose();
    tituloNotificacaoFocusNode?.dispose();
    tituloNotificacaoTextController?.dispose();

    textoNotificacaoFocusNode?.dispose();
    textoNotificacaoTextController?.dispose();

    uRLNotificacaoFocusNode?.dispose();
    uRLNotificacaoTextController?.dispose();

    tituloComunicadoFocusNode?.dispose();
    tituloComunicadoTextController?.dispose();

    versaoFocusNode?.dispose();
    versaoTextController?.dispose();

    detalhesFocusNode?.dispose();
    detalhesTextController?.dispose();

    uRLDestinoComunicadoFocusNode?.dispose();
    uRLDestinoComunicadoTextController?.dispose();

    allAppFocusNode?.dispose();

    textoNotificacaoAnuncianteFocusNode?.dispose();
    textoNotificacaoAnuncianteTextController?.dispose();
  }
}
