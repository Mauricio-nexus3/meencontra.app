import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/catalogo/add_categoria_catalogo/add_categoria_catalogo_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_novo_item_widget.dart' show AddNovoItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddNovoItemModel extends FlutterFlowModel<AddNovoItemWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for InputNomeProduto widget.
  FocusNode? inputNomeProdutoFocusNode;
  TextEditingController? inputNomeProdutoController;
  String? Function(BuildContext, String?)? inputNomeProdutoControllerValidator;
  // State field(s) for InputValor widget.
  FocusNode? inputValorFocusNode;
  TextEditingController? inputValorController;
  String? Function(BuildContext, String?)? inputValorControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputNomeProdutoFocusNode?.dispose();
    inputNomeProdutoController?.dispose();

    inputValorFocusNode?.dispose();
    inputValorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
