import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'criar_nova_vaga_widget.dart' show CriarNovaVagaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CriarNovaVagaModel extends FlutterFlowModel<CriarNovaVagaWidget> {
  ///  Local state fields for this page.

  bool modoExibicao = true;

  int? etapaCadastro = 1;

  List<String> beneficios = [];
  void addToBeneficios(String item) => beneficios.add(item);
  void removeFromBeneficios(String item) => beneficios.remove(item);
  void removeAtIndexFromBeneficios(int index) => beneficios.removeAt(index);
  void insertAtIndexInBeneficios(int index, String item) =>
      beneficios.insert(index, item);
  void updateBeneficiosAtIndex(int index, Function(String) updateFn) =>
      beneficios[index] = updateFn(beneficios[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeVaga widget.
  FocusNode? nomeVagaFocusNode;
  TextEditingController? nomeVagaTextController;
  String? Function(BuildContext, String?)? nomeVagaTextControllerValidator;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  // State field(s) for Localidade widget.
  FocusNode? localidadeFocusNode;
  TextEditingController? localidadeTextController;
  String? Function(BuildContext, String?)? localidadeTextControllerValidator;
  // State field(s) for Salario widget.
  FocusNode? salarioFocusNode;
  TextEditingController? salarioTextController;
  String? Function(BuildContext, String?)? salarioTextControllerValidator;
  // State field(s) for DropDown_Experiencia widget.
  String? dropDownExperienciaValue;
  FormFieldController<String>? dropDownExperienciaValueController;
  // State field(s) for DropDown_contrato widget.
  String? dropDownContratoValue;
  FormFieldController<String>? dropDownContratoValueController;
  // State field(s) for DropDown_Regime widget.
  String? dropDownRegimeValue;
  FormFieldController<String>? dropDownRegimeValueController;
  // State field(s) for descriptionBenefic widget.
  FocusNode? descriptionBeneficFocusNode;
  TextEditingController? descriptionBeneficTextController;
  String? Function(BuildContext, String?)?
      descriptionBeneficTextControllerValidator;
  // State field(s) for descriptionQualification widget.
  FocusNode? descriptionQualificationFocusNode;
  TextEditingController? descriptionQualificationTextController;
  String? Function(BuildContext, String?)?
      descriptionQualificationTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for SwitchURL widget.
  bool? switchURLValue;
  // State field(s) for URL widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeVagaFocusNode?.dispose();
    nomeVagaTextController?.dispose();

    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    localidadeFocusNode?.dispose();
    localidadeTextController?.dispose();

    salarioFocusNode?.dispose();
    salarioTextController?.dispose();

    descriptionBeneficFocusNode?.dispose();
    descriptionBeneficTextController?.dispose();

    descriptionQualificationFocusNode?.dispose();
    descriptionQualificationTextController?.dispose();

    urlFocusNode?.dispose();
    urlTextController?.dispose();
  }
}
