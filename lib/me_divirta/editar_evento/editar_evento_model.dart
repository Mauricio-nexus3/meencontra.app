import '/anunciante/anunciante_page/componentes/map_google/map_google_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'editar_evento_widget.dart' show EditarEventoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarEventoModel extends FlutterFlowModel<EditarEventoWidget> {
  ///  Local state fields for this page.

  bool modoExibicao = true;

  int? etapaCadastro = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  DateTime? datePicked;
  // State field(s) for Switch_mapa widget.
  bool? switchMapaValue;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    tipodeEventoFocusNode?.dispose();
    tipodeEventoTextController?.dispose();

    localFocusNode?.dispose();
    localTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
