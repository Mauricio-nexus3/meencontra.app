import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'criar_nova_materia_widget.dart' show CriarNovaMateriaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CriarNovaMateriaModel extends FlutterFlowModel<CriarNovaMateriaWidget> {
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
  TextEditingController? descricaoFotoController;
  String? Function(BuildContext, String?)? descricaoFotoControllerValidator;
  // State field(s) for CreditosImg widget.
  FocusNode? creditosImgFocusNode;
  TextEditingController? creditosImgController;
  String? Function(BuildContext, String?)? creditosImgControllerValidator;
  // State field(s) for DropDownCategoria widget.
  String? dropDownCategoriaValue;
  FormFieldController<String>? dropDownCategoriaValueController;
  // State field(s) for EscritoPor widget.
  FocusNode? escritoPorFocusNode;
  TextEditingController? escritoPorController;
  String? Function(BuildContext, String?)? escritoPorControllerValidator;
  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloController;
  String? Function(BuildContext, String?)? tituloControllerValidator;
  // State field(s) for conteudo widget.
  FocusNode? conteudoFocusNode;
  TextEditingController? conteudoController;
  String? Function(BuildContext, String?)? conteudoControllerValidator;
  // State field(s) for Destaque widget.
  bool? destaqueValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MateriasRecord? materiaRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? todosUsuarios;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
    descricaoFotoFocusNode?.dispose();
    descricaoFotoController?.dispose();

    creditosImgFocusNode?.dispose();
    creditosImgController?.dispose();

    escritoPorFocusNode?.dispose();
    escritoPorController?.dispose();

    tituloFocusNode?.dispose();
    tituloController?.dispose();

    conteudoFocusNode?.dispose();
    conteudoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
