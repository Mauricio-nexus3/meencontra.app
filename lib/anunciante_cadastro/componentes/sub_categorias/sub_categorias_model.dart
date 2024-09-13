import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'sub_categorias_widget.dart' show SubCategoriasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SubCategoriasModel extends FlutterFlowModel<SubCategoriasWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for categoriaPai widget.
  String? categoriaPaiValue;
  FormFieldController<String>? categoriaPaiValueController;
  // State field(s) for SubCatg01 widget.
  String? subCatg01Value;
  FormFieldController<String>? subCatg01ValueController;
  // State field(s) for SubCatg02 widget.
  String? subCatg02Value;
  FormFieldController<String>? subCatg02ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
