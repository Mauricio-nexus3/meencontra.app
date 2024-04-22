import '/anunciante_cadastro/componentes/consulta_estabelecimento/consulta_estabelecimento_widget.dart';
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
import '/flutter_flow/random_data_util.dart' as random_data;
import 'cadastro_inicial_widget.dart' show CadastroInicialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CadastroInicialModel extends FlutterFlowModel<CadastroInicialWidget> {
  ///  Local state fields for this page.

  LatLng? googleMapsVersaoWeb;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeFantasia_Obrigatorio widget.
  FocusNode? nomeFantasiaObrigatorioFocusNode;
  TextEditingController? nomeFantasiaObrigatorioTextController;
  String? Function(BuildContext, String?)?
      nomeFantasiaObrigatorioTextControllerValidator;
  // State field(s) for whatsComercial widget.
  FocusNode? whatsComercialFocusNode;
  TextEditingController? whatsComercialTextController;
  final whatsComercialMask = MaskTextInputFormatter(mask: '###########');
  String? Function(BuildContext, String?)?
      whatsComercialTextControllerValidator;
  // State field(s) for Endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoTextController;
  String? Function(BuildContext, String?)? enderecoTextControllerValidator;
  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  // State field(s) for DropCategoria widget.
  String? dropCategoriaValue;
  FormFieldController<String>? dropCategoriaValueController;
  // State field(s) for DropDown_SubCatg01_Obrigatorio widget.
  String? dropDownSubCatg01ObrigatorioValue;
  FormFieldController<String>? dropDownSubCatg01ObrigatorioValueController;
  // Stores action output result for [Backend Call - Create Document] action in Cadastrar widget.
  AnuncianteRecord? adminAnuncianteRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeFantasiaObrigatorioFocusNode?.dispose();
    nomeFantasiaObrigatorioTextController?.dispose();

    whatsComercialFocusNode?.dispose();
    whatsComercialTextController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();
  }
}
