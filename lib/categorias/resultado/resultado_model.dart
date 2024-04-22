import '/backend/backend.dart';
import '/categorias/componentes/card_lista_sub_categoria/card_lista_sub_categoria_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'resultado_widget.dart' show ResultadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultadoModel extends FlutterFlowModel<ResultadoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _resultadoSubManager = StreamRequestManager<List<AnuncianteRecord>>();
  Stream<List<AnuncianteRecord>> resultadoSub({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<AnuncianteRecord>> Function() requestFn,
  }) =>
      _resultadoSubManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearResultadoSubCache() => _resultadoSubManager.clear();
  void clearResultadoSubCacheKey(String? uniqueKey) =>
      _resultadoSubManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearResultadoSubCache();
  }
}
