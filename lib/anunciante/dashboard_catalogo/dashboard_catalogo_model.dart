import '/backend/backend.dart';
import '/componentes/catalogo/add_categoria_catalogo/add_categoria_catalogo_widget.dart';
import '/componentes/catalogo/add_novo_item/add_novo_item_widget.dart';
import '/componentes/catalogo/editar_item/editar_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_catalogo_widget.dart' show DashboardCatalogoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardCatalogoModel extends FlutterFlowModel<DashboardCatalogoWidget> {
  ///  Local state fields for this page.

  int? categoriaItem = 0;

  String? catalogoRef = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
