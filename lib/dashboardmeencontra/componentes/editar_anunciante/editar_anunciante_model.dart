import '/cadastrar_anunciante/cadastro/add_redesocial/add_redesocial_widget.dart';
import '/cadastrar_anunciante/cadastro/adicionar_horario/adicionar_horario_widget.dart';
import '/cadastrar_anunciante/componentes/endereco/endereco_widget.dart';
import '/cadastrar_anunciante/componentes/endereco_google_maps/endereco_google_maps_widget.dart';
import '/cadastrar_anunciante/componentes/fixo/fixo_widget.dart';
import '/cadastrar_anunciante/componentes/logo_nome_fantasia/logo_nome_fantasia_widget.dart';
import '/cadastrar_anunciante/componentes/site_component/site_component_widget.dart';
import '/cadastrar_anunciante/componentes/sub_categoria01/sub_categoria01_widget.dart';
import '/cadastrar_anunciante/componentes/whatsapp/whatsapp_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_anunciante_widget.dart' show EditarAnuncianteWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarAnuncianteModel extends FlutterFlowModel<EditarAnuncianteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
  // Stores action output result for [Bottom Sheet - EnderecoGoogleMaps] action in Icon widget.
  String? namee;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered6 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered7 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered8 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered9 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered10 = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
