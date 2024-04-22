import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_redesocial_widget.dart' show AddRedesocialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddRedesocialModel extends FlutterFlowModel<AddRedesocialWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownRdSocial widget.
  String? dropDownRdSocialValue;
  FormFieldController<String>? dropDownRdSocialValueController;
  // State field(s) for InputSocial widget.
  FocusNode? inputSocialFocusNode;
  TextEditingController? inputSocialTextController;
  String? Function(BuildContext, String?)? inputSocialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputSocialFocusNode?.dispose();
    inputSocialTextController?.dispose();
  }
}
