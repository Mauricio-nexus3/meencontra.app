import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import 'editar_materia_widget.dart' show EditarMateriaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarMateriaModel extends FlutterFlowModel<EditarMateriaWidget> {
  ///  Local state fields for this page.

  bool modoExibicao = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DescricaoFoto widget.
  FocusNode? descricaoFotoFocusNode;
  TextEditingController? descricaoFotoTextController;
  String? Function(BuildContext, String?)? descricaoFotoTextControllerValidator;
  // State field(s) for CreditosImg widget.
  FocusNode? creditosImgFocusNode;
  TextEditingController? creditosImgTextController;
  String? Function(BuildContext, String?)? creditosImgTextControllerValidator;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for EscritoPor widget.
  FocusNode? escritoPorFocusNode;
  TextEditingController? escritoPorTextController;
  String? Function(BuildContext, String?)? escritoPorTextControllerValidator;
  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for conteudo widget.
  FocusNode? conteudoFocusNode;
  TextEditingController? conteudoTextController;
  String? Function(BuildContext, String?)? conteudoTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
    descricaoFotoFocusNode?.dispose();
    descricaoFotoTextController?.dispose();

    creditosImgFocusNode?.dispose();
    creditosImgTextController?.dispose();

    escritoPorFocusNode?.dispose();
    escritoPorTextController?.dispose();

    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    conteudoFocusNode?.dispose();
    conteudoTextController?.dispose();
  }
}
