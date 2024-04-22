import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'catalogo_categoria_excluir_widget.dart'
    show CatalogoCategoriaExcluirWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CatalogoCategoriaExcluirModel
    extends FlutterFlowModel<CatalogoCategoriaExcluirWidget> {
  ///  Local state fields for this component.

  List<ProdutoRecord> listaCategoriaRef = [];
  void addToListaCategoriaRef(ProdutoRecord item) =>
      listaCategoriaRef.add(item);
  void removeFromListaCategoriaRef(ProdutoRecord item) =>
      listaCategoriaRef.remove(item);
  void removeAtIndexFromListaCategoriaRef(int index) =>
      listaCategoriaRef.removeAt(index);
  void insertAtIndexInListaCategoriaRef(int index, ProdutoRecord item) =>
      listaCategoriaRef.insert(index, item);
  void updateListaCategoriaRefAtIndex(
          int index, Function(ProdutoRecord) updateFn) =>
      listaCategoriaRef[index] = updateFn(listaCategoriaRef[index]);

  int? atualizando = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProdutoRecord>? produtosComCategoriaSelecionada;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
