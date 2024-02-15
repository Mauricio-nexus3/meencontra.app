import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_categoria_catalogo_widget.dart' show AddCategoriaCatalogoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddCategoriaCatalogoModel
    extends FlutterFlowModel<AddCategoriaCatalogoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NEWText widget.
  FocusNode? nEWTextFocusNode;
  TextEditingController? nEWTextController;
  String? Function(BuildContext, String?)? nEWTextControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nEWTextFocusNode?.dispose();
    nEWTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
