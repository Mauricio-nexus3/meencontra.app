import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'popup_usuario_widget.dart' show PopupUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PopupUsuarioModel extends FlutterFlowModel<PopupUsuarioWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode1;
  TextEditingController? editWhatsTextController1;
  String? Function(BuildContext, String?)? editWhatsTextController1Validator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode2;
  TextEditingController? editWhatsTextController2;
  String? Function(BuildContext, String?)? editWhatsTextController2Validator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode3;
  TextEditingController? editWhatsTextController3;
  String? Function(BuildContext, String?)? editWhatsTextController3Validator;
  // State field(s) for perfil widget.
  FocusNode? perfilFocusNode;
  TextEditingController? perfilTextController;
  String? Function(BuildContext, String?)? perfilTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  AnuncianteRecord? anuncianteRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    editWhatsFocusNode1?.dispose();
    editWhatsTextController1?.dispose();

    editWhatsFocusNode2?.dispose();
    editWhatsTextController2?.dispose();

    editWhatsFocusNode3?.dispose();
    editWhatsTextController3?.dispose();

    perfilFocusNode?.dispose();
    perfilTextController?.dispose();
  }
}
