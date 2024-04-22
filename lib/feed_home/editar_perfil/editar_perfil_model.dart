import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'editar_perfil_widget.dart' show EditarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarPerfilModel extends FlutterFlowModel<EditarPerfilWidget> {
  ///  Local state fields for this page.

  int? alterarFoto;

  int? configuracoes = 0;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode;
  TextEditingController? editWhatsTextController;
  String? Function(BuildContext, String?)? editWhatsTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AnuncianteRecord? anuncianteRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CatalogoRecord? catalogoAnuncianteRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AnunciosRecord? anunciosAnuncianteRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    editWhatsFocusNode?.dispose();
    editWhatsTextController?.dispose();
  }
}
