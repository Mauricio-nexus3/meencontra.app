import '/anunciante/comentarios/editar_comentario/editar_comentario_widget.dart';
import '/anunciante/comentarios/novo_comentario/novo_comentario_widget.dart';
import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'anunciante_widget.dart' show AnuncianteWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AnuncianteModel extends FlutterFlowModel<AnuncianteWidget> {
  ///  Local state fields for this page.

  bool? editarComentario;

  DocumentReference? editarComentarioRef;

  DateTime? horaAbre;

  DateTime? ultimaNotificacao;

  String responsavelPorNotificacao = 'Ainda não enviado';

  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usuariosRef;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for NewComentario widget.
  FocusNode? newComentarioFocusNode1;
  TextEditingController? newComentarioController1;
  String? Function(BuildContext, String?)? newComentarioController1Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for NewComentario widget.
  FocusNode? newComentarioFocusNode2;
  TextEditingController? newComentarioController2;
  String? Function(BuildContext, String?)? newComentarioController2Validator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    newComentarioFocusNode1?.dispose();
    newComentarioController1?.dispose();

    newComentarioFocusNode2?.dispose();
    newComentarioController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
