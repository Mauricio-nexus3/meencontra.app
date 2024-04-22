import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'admin_categoria_sub_categoria_widget.dart'
    show AdminCategoriaSubCategoriaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminCategoriaSubCategoriaModel
    extends FlutterFlowModel<AdminCategoriaSubCategoriaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SubCatg01 widget.
  String? subCatg01Value1;
  FormFieldController<String>? subCatg01ValueController1;
  // State field(s) for SubCatg01 widget.
  String? subCatg01Value2;
  FormFieldController<String>? subCatg01ValueController2;
  // State field(s) for SubCatg02 widget.
  String? subCatg02Value;
  FormFieldController<String>? subCatg02ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
