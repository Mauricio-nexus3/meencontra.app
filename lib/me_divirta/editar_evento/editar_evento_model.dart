import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
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
import '/flutter_flow/custom_functions.dart' as functions;
import 'editar_evento_widget.dart' show EditarEventoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
  TextEditingController? tituloController;
  String? Function(BuildContext, String?)? tituloControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for TipodeEvento widget.
  FocusNode? tipodeEventoFocusNode;
  TextEditingController? tipodeEventoController;
  String? Function(BuildContext, String?)? tipodeEventoControllerValidator;
  // State field(s) for local widget.
  FocusNode? localFocusNode;
  TextEditingController? localController;
  String? Function(BuildContext, String?)? localControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
    tituloFocusNode?.dispose();
    tituloController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    tipodeEventoFocusNode?.dispose();
    tipodeEventoController?.dispose();

    localFocusNode?.dispose();
    localController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
