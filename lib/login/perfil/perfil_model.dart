import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this page.

  String statusCastro = 'perfil';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for Whatsappa widget.
  FocusNode? whatsappaFocusNode;
  TextEditingController? whatsappaTextController;
  final whatsappaMask = MaskTextInputFormatter(mask: '(##)#########');
  String? Function(BuildContext, String?)? whatsappaTextControllerValidator;
  // State field(s) for DropDownGenero widget.
  String? dropDownGeneroValue;
  FormFieldController<String>? dropDownGeneroValueController;
  // State field(s) for TFild_Outro widget.
  FocusNode? tFildOutroFocusNode;
  TextEditingController? tFildOutroTextController;
  String? Function(BuildContext, String?)? tFildOutroTextControllerValidator;
  // State field(s) for LiAceitoPoliticaTermos widget.
  bool? liAceitoPoliticaTermosValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    whatsappaFocusNode?.dispose();
    whatsappaTextController?.dispose();

    tFildOutroFocusNode?.dispose();
    tFildOutroTextController?.dispose();
  }
}
