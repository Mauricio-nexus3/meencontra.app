import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_comentario_widget.dart' show EditarComentarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarComentarioModel extends FlutterFlowModel<EditarComentarioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioController;
  String? Function(BuildContext, String?)? comentarioControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    comentarioFocusNode?.dispose();
    comentarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
