import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'categorias_widget.dart' show CategoriasWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CategoriasModel extends FlutterFlowModel<CategoriasWidget> {
  ///  Local state fields for this page.

  String busca = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for allApp widget.
  final allAppKey = GlobalKey();
  FocusNode? allAppFocusNode;
  TextEditingController? allAppController;
  String? allAppSelectedOption;
  String? Function(BuildContext, String?)? allAppControllerValidator;
  // Algolia Search Results from action on allApp
  List<AnuncianteRecord>? algoliaSearchResults = [];

  /// Query cache managers for this widget.

  final _categoriasManager = FutureRequestManager<List<CategoriasRecord>>();
  Future<List<CategoriasRecord>> categorias({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriasRecord>> Function() requestFn,
  }) =>
      _categoriasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriasCache() => _categoriasManager.clear();
  void clearCategoriasCacheKey(String? uniqueKey) =>
      _categoriasManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    allAppFocusNode?.dispose();

    /// Dispose query cache managers for this widget.

    clearCategoriasCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
