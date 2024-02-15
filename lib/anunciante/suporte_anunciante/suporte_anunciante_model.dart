import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'suporte_anunciante_widget.dart' show SuporteAnuncianteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SuporteAnuncianteModel extends FlutterFlowModel<SuporteAnuncianteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDownTopico widget.
  String? dropDownTopicoValue;
  FormFieldController<String>? dropDownTopicoValueController;
  // State field(s) for TextFieldAssunto widget.
  FocusNode? textFieldAssuntoFocusNode;
  TextEditingController? textFieldAssuntoController;
  String? Function(BuildContext, String?)? textFieldAssuntoControllerValidator;
  // State field(s) for TextFieldConteudo widget.
  FocusNode? textFieldConteudoFocusNode;
  TextEditingController? textFieldConteudoController;
  String? Function(BuildContext, String?)? textFieldConteudoControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TicketSuporteRecord? chamadoAnunciante;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldAssuntoFocusNode?.dispose();
    textFieldAssuntoController?.dispose();

    textFieldConteudoFocusNode?.dispose();
    textFieldConteudoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
