import '/anunciante/anunciante_page/componentes/popup_excluir_capa/popup_excluir_capa_widget.dart';
import '/anunciante/anunciante_page/componentes/selecinar_capa_perfil/selecinar_capa_perfil_widget.dart';
import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/anunciante/assinatura/estrela_bloqueio/estrela_bloqueio_widget.dart';
import '/anunciante/assinatura/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dash_anunciante_perfil_widget.dart' show DashAnunciantePerfilWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashAnunciantePerfilModel
    extends FlutterFlowModel<DashAnunciantePerfilWidget> {
  ///  Local state fields for this page.

  bool? editarComentario;

  DocumentReference? editarComentarioRef;

  DateTime? horaAbre;

  DateTime? ultimaNotificacao;

  String responsavelPorNotificacao = 'Ainda não enviado';

  Color? corSelecionada;

  bool mostrarPerfil = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDownTemplate widget.
  String? dropDownTemplateValue;
  FormFieldController<String>? dropDownTemplateValueController;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel1;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for cnpjLoja widget.
  FocusNode? cnpjLojaFocusNode;
  TextEditingController? cnpjLojaTextController;
  String? Function(BuildContext, String?)? cnpjLojaTextControllerValidator;
  // State field(s) for nomeLoja widget.
  FocusNode? nomeLojaFocusNode;
  TextEditingController? nomeLojaTextController;
  String? Function(BuildContext, String?)? nomeLojaTextControllerValidator;
  // State field(s) for descricaoLoja widget.
  FocusNode? descricaoLojaFocusNode;
  TextEditingController? descricaoLojaTextController;
  String? Function(BuildContext, String?)? descricaoLojaTextControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel3;
  // State field(s) for DropCategoria widget.
  String? dropCategoriaValue;
  FormFieldController<String>? dropCategoriaValueController;
  // State field(s) for DropDown_SubCatg01_Obrigatorio widget.
  String? dropDownSubCatg01ObrigatorioValue;
  FormFieldController<String>? dropDownSubCatg01ObrigatorioValueController;
  // State field(s) for DropDown_SubCatg02_Obrigatorio widget.
  String? dropDownSubCatg02ObrigatorioValue;
  FormFieldController<String>? dropDownSubCatg02ObrigatorioValueController;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel4;
  // State field(s) for EnderecoCompleto widget.
  FocusNode? enderecoCompletoFocusNode;
  TextEditingController? enderecoCompletoTextController;
  String? Function(BuildContext, String?)?
      enderecoCompletoTextControllerValidator;
  // State field(s) for cidadeEndLoja widget.
  FocusNode? cidadeEndLojaFocusNode;
  TextEditingController? cidadeEndLojaTextController;
  String? Function(BuildContext, String?)? cidadeEndLojaTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for Whatsap widget.
  FocusNode? whatsapFocusNode;
  TextEditingController? whatsapTextController;
  String? Function(BuildContext, String?)? whatsapTextControllerValidator;
  // State field(s) for telefoneLoja widget.
  FocusNode? telefoneLojaFocusNode;
  TextEditingController? telefoneLojaTextController;
  String? Function(BuildContext, String?)? telefoneLojaTextControllerValidator;
  // State field(s) for instagramLoja widget.
  FocusNode? instagramLojaFocusNode;
  TextEditingController? instagramLojaTextController;
  String? Function(BuildContext, String?)? instagramLojaTextControllerValidator;
  // State field(s) for FacebookLoja widget.
  FocusNode? facebookLojaFocusNode;
  TextEditingController? facebookLojaTextController;
  String? Function(BuildContext, String?)? facebookLojaTextControllerValidator;
  // State field(s) for SiteLoja widget.
  FocusNode? siteLojaFocusNode;
  TextEditingController? siteLojaTextController;
  String? Function(BuildContext, String?)? siteLojaTextControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel5;
  // State field(s) for emailLoja widget.
  FocusNode? emailLojaFocusNode;
  TextEditingController? emailLojaTextController;
  String? Function(BuildContext, String?)? emailLojaTextControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel6;
  // State field(s) for responsavelNomeCompletoLoja widget.
  FocusNode? responsavelNomeCompletoLojaFocusNode;
  TextEditingController? responsavelNomeCompletoLojaTextController;
  String? Function(BuildContext, String?)?
      responsavelNomeCompletoLojaTextControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel7;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel8;
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel2;

  @override
  void initState(BuildContext context) {
    menuDashAnuncianteModel1 =
        createModel(context, () => MenuDashAnuncianteModel());
    estrelaBloqueioModel1 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel2 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel3 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel4 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel5 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel6 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel7 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel8 = createModel(context, () => EstrelaBloqueioModel());
    menuDashAnuncianteModel2 =
        createModel(context, () => MenuDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuDashAnuncianteModel1.dispose();
    tabBarController?.dispose();
    estrelaBloqueioModel1.dispose();
    estrelaBloqueioModel2.dispose();
    cnpjLojaFocusNode?.dispose();
    cnpjLojaTextController?.dispose();

    nomeLojaFocusNode?.dispose();
    nomeLojaTextController?.dispose();

    descricaoLojaFocusNode?.dispose();
    descricaoLojaTextController?.dispose();

    estrelaBloqueioModel3.dispose();
    estrelaBloqueioModel4.dispose();
    enderecoCompletoFocusNode?.dispose();
    enderecoCompletoTextController?.dispose();

    cidadeEndLojaFocusNode?.dispose();
    cidadeEndLojaTextController?.dispose();

    whatsapFocusNode?.dispose();
    whatsapTextController?.dispose();

    telefoneLojaFocusNode?.dispose();
    telefoneLojaTextController?.dispose();

    instagramLojaFocusNode?.dispose();
    instagramLojaTextController?.dispose();

    facebookLojaFocusNode?.dispose();
    facebookLojaTextController?.dispose();

    siteLojaFocusNode?.dispose();
    siteLojaTextController?.dispose();

    estrelaBloqueioModel5.dispose();
    emailLojaFocusNode?.dispose();
    emailLojaTextController?.dispose();

    estrelaBloqueioModel6.dispose();
    responsavelNomeCompletoLojaFocusNode?.dispose();
    responsavelNomeCompletoLojaTextController?.dispose();

    estrelaBloqueioModel7.dispose();
    estrelaBloqueioModel8.dispose();
    menuDashAnuncianteModel2.dispose();
  }
}
