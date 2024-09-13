import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/componentes/login_criar_conta_componente/login_criar_conta_componente_widget.dart';
import 'menu_horizontal_widget.dart' show MenuHorizontalWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MenuHorizontalModel extends FlutterFlowModel<MenuHorizontalWidget> {
  ///  Local state fields for this component.

  bool showMoreOptions = true;

  String? hover;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // State field(s) for MouseRegion_buscar widget.
  bool mouseRegionBuscarHovered = false;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  AnuncianteRecord? anuncianteReferencia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
