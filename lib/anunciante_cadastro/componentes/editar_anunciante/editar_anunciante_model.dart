import '/anunciante_cadastro/componentes/endereco_google_maps/endereco_google_maps_widget.dart';
import '/anunciante_cadastro/componentes/sub_categorias/sub_categorias_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_anunciante_widget.dart' show EditarAnuncianteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarAnuncianteModel extends FlutterFlowModel<EditarAnuncianteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for usuario widget.
  FocusNode? usuarioFocusNode;
  TextEditingController? usuarioTextController;
  String? Function(BuildContext, String?)? usuarioTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for whats widget.
  FocusNode? whatsFocusNode;
  TextEditingController? whatsTextController;
  String? Function(BuildContext, String?)? whatsTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for Enderecoo widget.
  FocusNode? enderecooFocusNode;
  TextEditingController? enderecooTextController;
  String? Function(BuildContext, String?)? enderecooTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;
  // Stores action output result for [Bottom Sheet - EnderecoGoogleMaps] action in Container widget.
  String? endereco;
  // State field(s) for googleMaps widget.
  FocusNode? googleMapsFocusNode;
  TextEditingController? googleMapsTextController;
  String? Function(BuildContext, String?)? googleMapsTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // State field(s) for TelefoneFixo widget.
  FocusNode? telefoneFixoFocusNode;
  TextEditingController? telefoneFixoTextController;
  String? Function(BuildContext, String?)? telefoneFixoTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
  // State field(s) for Site widget.
  FocusNode? siteFocusNode;
  TextEditingController? siteTextController;
  String? Function(BuildContext, String?)? siteTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered9 = false;
  // State field(s) for Instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered10 = false;
  // State field(s) for Facebook widget.
  FocusNode? facebookFocusNode;
  TextEditingController? facebookTextController;
  String? Function(BuildContext, String?)? facebookTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered11 = false;
  // State field(s) for documento widget.
  FocusNode? documentoFocusNode;
  TextEditingController? documentoTextController;
  String? Function(BuildContext, String?)? documentoTextControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered12 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    usuarioFocusNode?.dispose();
    usuarioTextController?.dispose();

    whatsFocusNode?.dispose();
    whatsTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    enderecooFocusNode?.dispose();
    enderecooTextController?.dispose();

    googleMapsFocusNode?.dispose();
    googleMapsTextController?.dispose();

    telefoneFixoFocusNode?.dispose();
    telefoneFixoTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    siteFocusNode?.dispose();
    siteTextController?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    facebookFocusNode?.dispose();
    facebookTextController?.dispose();

    documentoFocusNode?.dispose();
    documentoTextController?.dispose();
  }
}
