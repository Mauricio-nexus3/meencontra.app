import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'fixo_widget.dart' show FixoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FixoModel extends FlutterFlowModel<FixoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Fixo widget.
  FocusNode? fixoFocusNode;
  TextEditingController? fixoController;
  final fixoMask = MaskTextInputFormatter(mask: '(##) ####-####');
  String? Function(BuildContext, String?)? fixoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fixoFocusNode?.dispose();
    fixoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
