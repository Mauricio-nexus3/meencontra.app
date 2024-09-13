import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/pop_up/alert_confirm_pop_up/alert_confirm_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'suporte_widget.dart' show SuporteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SuporteModel extends FlutterFlowModel<SuporteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDownTopico widget.
  String? dropDownTopicoValue;
  FormFieldController<String>? dropDownTopicoValueController;
  // State field(s) for TextFieldAssunto widget.
  FocusNode? textFieldAssuntoFocusNode;
  TextEditingController? textFieldAssuntoTextController;
  String? Function(BuildContext, String?)?
      textFieldAssuntoTextControllerValidator;
  // State field(s) for TextFieldConteudo widget.
  FocusNode? textFieldConteudoFocusNode;
  TextEditingController? textFieldConteudoTextController;
  String? Function(BuildContext, String?)?
      textFieldConteudoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TicketSuporteRecord? chamadoSuporte;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? admin;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldAssuntoFocusNode?.dispose();
    textFieldAssuntoTextController?.dispose();

    textFieldConteudoFocusNode?.dispose();
    textFieldConteudoTextController?.dispose();

    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
  }
}
