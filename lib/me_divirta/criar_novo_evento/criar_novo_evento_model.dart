import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'criar_novo_evento_widget.dart' show CriarNovoEventoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CriarNovoEventoModel extends FlutterFlowModel<CriarNovoEventoWidget> {
  ///  Local state fields for this page.

  bool modoExibicao = true;

  int? etapaCadastro = 1;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for TipodeEvento widget.
  FocusNode? tipodeEventoFocusNode;
  TextEditingController? tipodeEventoTextController;
  String? Function(BuildContext, String?)? tipodeEventoTextControllerValidator;
  // State field(s) for local widget.
  FocusNode? localFocusNode;
  TextEditingController? localTextController;
  String? Function(BuildContext, String?)? localTextControllerValidator;
  // State field(s) for Switch_Ingresso widget.
  bool? switchIngressoValue;
  // State field(s) for DropDownPlataforma widget.
  String? dropDownPlataformaValue;
  FormFieldController<String>? dropDownPlataformaValueController;
  // State field(s) for URL widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    tipodeEventoFocusNode?.dispose();
    tipodeEventoTextController?.dispose();

    localFocusNode?.dispose();
    localTextController?.dispose();

    urlFocusNode?.dispose();
    urlTextController?.dispose();
  }
}
