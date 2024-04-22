import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import 'criar_perfil_widget.dart' show CriarPerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CriarPerfilModel extends FlutterFlowModel<CriarPerfilWidget> {
  ///  Local state fields for this page.

  String statusCastro = 'perfil';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for Whatsappa widget.
  FocusNode? whatsappaFocusNode;
  TextEditingController? whatsappaTextController;
  final whatsappaMask = MaskTextInputFormatter(mask: '(##)#########');
  String? Function(BuildContext, String?)? whatsappaTextControllerValidator;
  // State field(s) for DropDownGenero widget.
  String? dropDownGeneroValue;
  FormFieldController<String>? dropDownGeneroValueController;
  // State field(s) for TFild_Outro widget.
  FocusNode? tFildOutroFocusNode;
  TextEditingController? tFildOutroTextController;
  String? Function(BuildContext, String?)? tFildOutroTextControllerValidator;
  // State field(s) for LiAceitoPoliticaTermos widget.
  bool? liAceitoPoliticaTermosValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ConviteAnunciante widget.
  FocusNode? conviteAnuncianteFocusNode;
  TextEditingController? conviteAnuncianteTextController;
  String? Function(BuildContext, String?)?
      conviteAnuncianteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    whatsappaFocusNode?.dispose();
    whatsappaTextController?.dispose();

    tFildOutroFocusNode?.dispose();
    tFildOutroTextController?.dispose();

    conviteAnuncianteFocusNode?.dispose();
    conviteAnuncianteTextController?.dispose();
  }
}
