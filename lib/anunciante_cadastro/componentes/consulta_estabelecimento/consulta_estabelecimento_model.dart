import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'consulta_estabelecimento_widget.dart'
    show ConsultaEstabelecimentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConsultaEstabelecimentoModel
    extends FlutterFlowModel<ConsultaEstabelecimentoWidget> {
  ///  Local state fields for this component.

  int? visible = 1;

  AnuncianteRecord? anuncianteSelecionado;

  ///  State fields for stateful widgets in this component.

  // State field(s) for allApp widget.
  final allAppKey = GlobalKey();
  FocusNode? allAppFocusNode;
  TextEditingController? allAppTextController;
  String? allAppSelectedOption;
  String? Function(BuildContext, String?)? allAppTextControllerValidator;
  // Algolia Search Results from action on allApp
  List<AnuncianteRecord>? algoliaSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AnuncianteRecord? resultadoQueryAlgolia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    allAppFocusNode?.dispose();
  }
}
