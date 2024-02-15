import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'editar_item_widget.dart' show EditarItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarItemModel extends FlutterFlowModel<EditarItemWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Nome1 widget.
  FocusNode? nome1FocusNode;
  TextEditingController? nome1Controller;
  String? Function(BuildContext, String?)? nome1ControllerValidator;
  // State field(s) for Valor1 widget.
  FocusNode? valor1FocusNode;
  TextEditingController? valor1Controller;
  String? Function(BuildContext, String?)? valor1ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nome1FocusNode?.dispose();
    nome1Controller?.dispose();

    valor1FocusNode?.dispose();
    valor1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
