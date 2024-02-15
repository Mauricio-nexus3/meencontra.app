import '/anunciante/new_anunciante/build/selecinar_capa/selecinar_capa_widget.dart';
import '/anunciante/new_anunciante/build/templete_anunciante/templete_anunciante_widget.dart';
import '/anunciante/new_anunciante/build/upgrade/upgrade_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/anunciante/new_componentes/popup_excluir_capa/popup_excluir_capa_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/estrela_bloqueio_widget.dart';
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
import 'anunciante_dashboard_widget.dart' show AnuncianteDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AnuncianteDashboardModel
    extends FlutterFlowModel<AnuncianteDashboardWidget> {
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
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel1;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDownTemplate widget.
  String? dropDownTemplateValue;
  FormFieldController<String>? dropDownTemplateValueController;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel2;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel3;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for cnpjLoja widget.
  FocusNode? cnpjLojaFocusNode;
  TextEditingController? cnpjLojaController;
  String? Function(BuildContext, String?)? cnpjLojaControllerValidator;
  // State field(s) for nomeLoja widget.
  FocusNode? nomeLojaFocusNode;
  TextEditingController? nomeLojaController;
  String? Function(BuildContext, String?)? nomeLojaControllerValidator;
  // State field(s) for descricaoLoja widget.
  FocusNode? descricaoLojaFocusNode;
  TextEditingController? descricaoLojaController;
  String? Function(BuildContext, String?)? descricaoLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel4;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel5;
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
  late EstrelaBloqueioModel estrelaBloqueioModel6;
  // State field(s) for EnderecoCompleto widget.
  FocusNode? enderecoCompletoFocusNode;
  TextEditingController? enderecoCompletoController;
  String? Function(BuildContext, String?)? enderecoCompletoControllerValidator;
  // State field(s) for cidadeEndLoja widget.
  FocusNode? cidadeEndLojaFocusNode;
  TextEditingController? cidadeEndLojaController;
  String? Function(BuildContext, String?)? cidadeEndLojaControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel7;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel8;
  // State field(s) for Whatsap widget.
  FocusNode? whatsapFocusNode;
  TextEditingController? whatsapController;
  String? Function(BuildContext, String?)? whatsapControllerValidator;
  // State field(s) for telefoneLoja widget.
  FocusNode? telefoneLojaFocusNode;
  TextEditingController? telefoneLojaController;
  String? Function(BuildContext, String?)? telefoneLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel9;
  // State field(s) for instagramLoja widget.
  FocusNode? instagramLojaFocusNode;
  TextEditingController? instagramLojaController;
  String? Function(BuildContext, String?)? instagramLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel10;
  // State field(s) for FacebookLoja widget.
  FocusNode? facebookLojaFocusNode;
  TextEditingController? facebookLojaController;
  String? Function(BuildContext, String?)? facebookLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel11;
  // State field(s) for SiteLoja widget.
  FocusNode? siteLojaFocusNode;
  TextEditingController? siteLojaController;
  String? Function(BuildContext, String?)? siteLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel12;
  // State field(s) for emailLoja widget.
  FocusNode? emailLojaFocusNode;
  TextEditingController? emailLojaController;
  String? Function(BuildContext, String?)? emailLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel13;
  // State field(s) for responsavelNomeCompletoLoja widget.
  FocusNode? responsavelNomeCompletoLojaFocusNode;
  TextEditingController? responsavelNomeCompletoLojaController;
  String? Function(BuildContext, String?)?
      responsavelNomeCompletoLojaControllerValidator;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel14;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel15;
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel2;
  // Model for templeteAnunciante component.
  late TempleteAnuncianteModel templeteAnuncianteModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newDashAnuncianteModel1 =
        createModel(context, () => NewDashAnuncianteModel());
    estrelaBloqueioModel1 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel2 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel3 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel4 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel5 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel6 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel7 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel8 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel9 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel10 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel11 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel12 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel13 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel14 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel15 = createModel(context, () => EstrelaBloqueioModel());
    newDashAnuncianteModel2 =
        createModel(context, () => NewDashAnuncianteModel());
    templeteAnuncianteModel =
        createModel(context, () => TempleteAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newDashAnuncianteModel1.dispose();
    estrelaBloqueioModel1.dispose();
    tabBarController?.dispose();
    estrelaBloqueioModel2.dispose();
    estrelaBloqueioModel3.dispose();
    cnpjLojaFocusNode?.dispose();
    cnpjLojaController?.dispose();

    nomeLojaFocusNode?.dispose();
    nomeLojaController?.dispose();

    descricaoLojaFocusNode?.dispose();
    descricaoLojaController?.dispose();

    estrelaBloqueioModel4.dispose();
    estrelaBloqueioModel5.dispose();
    estrelaBloqueioModel6.dispose();
    enderecoCompletoFocusNode?.dispose();
    enderecoCompletoController?.dispose();

    cidadeEndLojaFocusNode?.dispose();
    cidadeEndLojaController?.dispose();

    estrelaBloqueioModel7.dispose();
    estrelaBloqueioModel8.dispose();
    whatsapFocusNode?.dispose();
    whatsapController?.dispose();

    telefoneLojaFocusNode?.dispose();
    telefoneLojaController?.dispose();

    estrelaBloqueioModel9.dispose();
    instagramLojaFocusNode?.dispose();
    instagramLojaController?.dispose();

    estrelaBloqueioModel10.dispose();
    facebookLojaFocusNode?.dispose();
    facebookLojaController?.dispose();

    estrelaBloqueioModel11.dispose();
    siteLojaFocusNode?.dispose();
    siteLojaController?.dispose();

    estrelaBloqueioModel12.dispose();
    emailLojaFocusNode?.dispose();
    emailLojaController?.dispose();

    estrelaBloqueioModel13.dispose();
    responsavelNomeCompletoLojaFocusNode?.dispose();
    responsavelNomeCompletoLojaController?.dispose();

    estrelaBloqueioModel14.dispose();
    estrelaBloqueioModel15.dispose();
    newDashAnuncianteModel2.dispose();
    templeteAnuncianteModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
