import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'alert_confirm_pop_up_widget.dart' show AlertConfirmPopUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertConfirmPopUpModel extends FlutterFlowModel<AlertConfirmPopUpWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
