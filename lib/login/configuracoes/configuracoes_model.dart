import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'configuracoes_widget.dart' show ConfiguracoesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ConfiguracoesModel extends FlutterFlowModel<ConfiguracoesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  AnuncianteRecord? anuncianteRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  AnunciosRecord? anunciosRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  CatalogoRecord? catalogoRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
