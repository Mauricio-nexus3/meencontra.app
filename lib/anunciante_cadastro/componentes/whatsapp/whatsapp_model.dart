import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'whatsapp_widget.dart' show WhatsappWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class WhatsappModel extends FlutterFlowModel<WhatsappWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for whatsComercial widget.
  FocusNode? whatsComercialFocusNode;
  TextEditingController? whatsComercialTextController;
  final whatsComercialMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      whatsComercialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    whatsComercialFocusNode?.dispose();
    whatsComercialTextController?.dispose();
  }
}
