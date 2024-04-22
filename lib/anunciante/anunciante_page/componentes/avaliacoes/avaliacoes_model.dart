import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'avaliacoes_widget.dart' show AvaliacoesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AvaliacoesModel extends FlutterFlowModel<AvaliacoesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for Comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioTextController;
  String? Function(BuildContext, String?)? comentarioTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ComentarioAvalicaoRecord? comentario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    comentarioFocusNode?.dispose();
    comentarioTextController?.dispose();
  }
}
