import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/dashboardmeencontra/componentes/menu_lateral_dashboard/menu_lateral_dashboard_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'me_dashboard_notificacao_widget.dart' show MeDashboardNotificacaoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController? tituloNotificacaoController;
  String? Function(BuildContext, String?)? tituloNotificacaoControllerValidator;
  // State field(s) for textoNotificacao widget.
  FocusNode? textoNotificacaoFocusNode;
  TextEditingController? textoNotificacaoController;
  String? Function(BuildContext, String?)? textoNotificacaoControllerValidator;
  // State field(s) for URL_notificacao widget.
  FocusNode? uRLNotificacaoFocusNode;
  TextEditingController? uRLNotificacaoController;
  String? Function(BuildContext, String?)? uRLNotificacaoControllerValidator;
  DateTime? datePicked;
  // State field(s) for TituloComunicado widget.
  FocusNode? tituloComunicadoFocusNode;
  TextEditingController? tituloComunicadoController;
  String? Function(BuildContext, String?)? tituloComunicadoControllerValidator;
  // State field(s) for URL_DestinoComunicado widget.
  FocusNode? uRLDestinoComunicadoFocusNode;
  TextEditingController? uRLDestinoComunicadoController;
  String? Function(BuildContext, String?)?
      uRLDestinoComunicadoControllerValidator;
  // State field(s) for assuntoCategoria widget.
  String? assuntoCategoriaValue;
  FormFieldController<String>? assuntoCategoriaValueController;
  // State field(s) for Destino widget.
  String? destinoValue;
  FormFieldController<String>? destinoValueController;
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
    tituloNotificacaoFocusNode?.dispose();
    tituloNotificacaoController?.dispose();

    textoNotificacaoFocusNode?.dispose();
    textoNotificacaoController?.dispose();

    uRLNotificacaoFocusNode?.dispose();
    uRLNotificacaoController?.dispose();

    tituloComunicadoFocusNode?.dispose();
    tituloComunicadoController?.dispose();

    uRLDestinoComunicadoFocusNode?.dispose();
    uRLDestinoComunicadoController?.dispose();

    menuLateralDashboardModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
