import '/anunciante_cadastro/componentes/add_redesocial/add_redesocial_widget.dart';
import '/anunciante_cadastro/componentes/adicionar_horario/adicionar_horario_widget.dart';
import '/anunciante_cadastro/componentes/endereco/endereco_widget.dart';
import '/anunciante_cadastro/componentes/endereco_google_maps/endereco_google_maps_widget.dart';
import '/anunciante_cadastro/componentes/fixo/fixo_widget.dart';
import '/anunciante_cadastro/componentes/logo_nome_fantasia/logo_nome_fantasia_widget.dart';
import '/anunciante_cadastro/componentes/site_component/site_component_widget.dart';
import '/anunciante_cadastro/componentes/sub_categoria01/sub_categoria01_widget.dart';
import '/anunciante_cadastro/componentes/sub_categoria02/sub_categoria02_widget.dart';
import '/anunciante_cadastro/componentes/whatsapp/whatsapp_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'concluir_cadastro_widget.dart' show ConcluirCadastroWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ConcluirCadastroModel extends FlutterFlowModel<ConcluirCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  RelatorioRecord? consulta;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered5 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // Stores action output result for [Bottom Sheet - EnderecoGoogleMaps] action in Icon widget.
  String? name;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered9 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered10 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered11 = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
