import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'new_anuncio_produto_lista_widget.dart'
    show NewAnuncioProdutoListaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAnuncioProdutoListaModel
    extends FlutterFlowModel<NewAnuncioProdutoListaWidget> {
  ///  Local state fields for this component.

  int inforacoes = 0;

  String? imgAnuncio;

  double qntItensAtivos = 0.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxLiberado widget.

  Map<ProdutoRecord, bool> checkboxLiberadoValueMap = {};
  List<ProdutoRecord> get checkboxLiberadoCheckedItems =>
      checkboxLiberadoValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
