import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/meencontra_dashboard/componentes/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import 'me_dashboard_notificacao_widget.dart' show MeDashboardNotificacaoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDashboardNotificacaoModel
    extends FlutterFlowModel<MeDashboardNotificacaoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuLateralDashboard component.
  late MenuLateralDashboardModel menuLateralDashboardModel1;
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
  DateTime? datePicked;
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
    unfocusNode.dispose();
    menuLateralDashboardModel1.dispose();
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

    menuLateralDashboardModel2.dispose();
  }
}
