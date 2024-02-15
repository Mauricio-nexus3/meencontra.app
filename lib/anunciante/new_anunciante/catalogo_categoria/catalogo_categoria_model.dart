import '/anunciante/new_componentes/cadastrar_categoria/cadastrar_categoria_widget.dart';
import '/anunciante/new_componentes/catalogo_categoria_excluir/catalogo_categoria_excluir_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'catalogo_categoria_widget.dart' show CatalogoCategoriaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CatalogoCategoriaModel extends FlutterFlowModel<CatalogoCategoriaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel1;
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newDashAnuncianteModel1 =
        createModel(context, () => NewDashAnuncianteModel());
    newDashAnuncianteModel2 =
        createModel(context, () => NewDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newDashAnuncianteModel1.dispose();
    newDashAnuncianteModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
