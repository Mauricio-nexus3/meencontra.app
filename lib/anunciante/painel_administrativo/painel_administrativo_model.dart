import '/anunciante/componentes/anuncio_ativo/anuncio_ativo_widget.dart';
import '/anunciante/componentes/novo_anuncio/novo_anuncio_widget.dart';
import '/assinatura/estrela_bloqueio/estrela_bloqueio_widget.dart';
import '/assinatura/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menus/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/pop_up/alert_confirm_pop_up/alert_confirm_pop_up_widget.dart';
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
import 'dart:math';
import 'painel_administrativo_widget.dart' show PainelAdministrativoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PainelAdministrativoModel
    extends FlutterFlowModel<PainelAdministrativoWidget> {
  ///  Local state fields for this page.

  bool? editarComentario;

  DocumentReference? editarComentarioRef;

  DateTime? horaAbre;

  DateTime? ultimaNotificacao;

  String responsavelPorNotificacao = 'Ainda não enviado';

  Color? corSelecionada;

  bool mostrarPerfil = false;

  ///  State fields for stateful widgets in this page.

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  late EstrelaBloqueioModel estrelaBloqueioModel;
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
  FFPlace placePickerValue = FFPlace();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for Whatsap widget.
  FocusNode? whatsapFocusNode;
  TextEditingController? whatsapTextController;
  String? Function(BuildContext, String?)? whatsapTextControllerValidator;
  // State field(s) for telefoneLoja widget.
  FocusNode? telefoneLojaFocusNode;
  TextEditingController? telefoneLojaTextController;
  String? Function(BuildContext, String?)? telefoneLojaTextControllerValidator;
  // State field(s) for istagram widget.
  FocusNode? istagramFocusNode;
  TextEditingController? istagramTextController;
  String? Function(BuildContext, String?)? istagramTextControllerValidator;
  // State field(s) for facebook widget.
  FocusNode? facebookFocusNode;
  TextEditingController? facebookTextController;
  String? Function(BuildContext, String?)? facebookTextControllerValidator;
  // State field(s) for site widget.
  FocusNode? siteFocusNode;
  TextEditingController? siteTextController;
  String? Function(BuildContext, String?)? siteTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel2;

  @override
  void initState(BuildContext context) {
    menuDrawerModel1 = createModel(context, () => MenuDrawerModel());
    estrelaBloqueioModel = createModel(context, () => EstrelaBloqueioModel());
    menuDrawerModel2 = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    menuDrawerModel1.dispose();
    tabBarController?.dispose();
    cnpjLojaFocusNode?.dispose();
    cnpjLojaTextController?.dispose();

    nomeLojaFocusNode?.dispose();
    nomeLojaTextController?.dispose();

    descricaoLojaFocusNode?.dispose();
    descricaoLojaTextController?.dispose();

    estrelaBloqueioModel.dispose();
    enderecoCompletoFocusNode?.dispose();
    enderecoCompletoTextController?.dispose();

    cidadeEndLojaFocusNode?.dispose();
    cidadeEndLojaTextController?.dispose();

    whatsapFocusNode?.dispose();
    whatsapTextController?.dispose();

    telefoneLojaFocusNode?.dispose();
    telefoneLojaTextController?.dispose();

    istagramFocusNode?.dispose();
    istagramTextController?.dispose();

    facebookFocusNode?.dispose();
    facebookTextController?.dispose();

    siteFocusNode?.dispose();
    siteTextController?.dispose();

    menuDrawerModel2.dispose();
  }
}
