import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'editar_perfil_usuario_widget.dart' show EditarPerfilUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarPerfilUsuarioModel
    extends FlutterFlowModel<EditarPerfilUsuarioWidget> {
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
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode1;
  TextEditingController? editWhatsController1;
  String? Function(BuildContext, String?)? editWhatsController1Validator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode2;
  TextEditingController? editWhatsController2;
  String? Function(BuildContext, String?)? editWhatsController2Validator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode3;
  TextEditingController? editWhatsController3;
  String? Function(BuildContext, String?)? editWhatsController3Validator;
  // State field(s) for editWhats widget.
  FocusNode? editWhatsFocusNode4;
  TextEditingController? editWhatsController4;
  String? Function(BuildContext, String?)? editWhatsController4Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    editWhatsFocusNode1?.dispose();
    editWhatsController1?.dispose();

    editWhatsFocusNode2?.dispose();
    editWhatsController2?.dispose();

    editWhatsFocusNode3?.dispose();
    editWhatsController3?.dispose();

    editWhatsFocusNode4?.dispose();
    editWhatsController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
