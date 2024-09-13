import '/backend/backend.dart';
import '/categorias/componentes/card_lista_sub_categoria/card_lista_sub_categoria_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'resultado_widget.dart' show ResultadoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ResultadoModel extends FlutterFlowModel<ResultadoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, AnuncianteRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

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
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    /// Dispose query cache managers for this widget.

    clearResultadoSubCache();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, AnuncianteRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, AnuncianteRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, AnuncianteRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAnuncianteRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
