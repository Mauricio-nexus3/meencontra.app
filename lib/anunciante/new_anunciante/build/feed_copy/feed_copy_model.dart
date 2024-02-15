import '/anunciante/new_anunciante/build/new_comp_anuncios/new_comp_anuncios_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_contrata/mecontrata_feed/mecontrata_feed_widget.dart';
import '/me_divirta/medivirta_feed/medivirta_feed_widget.dart';
import '/me_informa/me_informa_card_feed/me_informa_card_feed_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'feed_copy_widget.dart' show FeedCopyWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FeedCopyModel extends FlutterFlowModel<FeedCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // Stores action output result for [Firestore Query - Query a collection] action in MeuNegocio widget.
  AnuncianteRecord? anuncianteReferencia;
  // State field(s) for versaoAtualApp widget.
  FocusNode? versaoAtualAppFocusNode;
  TextEditingController? versaoAtualAppController;
  String? Function(BuildContext, String?)? versaoAtualAppControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  MeInformaRecord? imprensaRefere;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  AnuncianteRecord? anuncianteRefFeed;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _categoriaFeedManager = FutureRequestManager<List<CategoriasRecord>>();
  Future<List<CategoriasRecord>> categoriaFeed({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriasRecord>> Function() requestFn,
  }) =>
      _categoriaFeedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriaFeedCache() => _categoriaFeedManager.clear();
  void clearCategoriaFeedCacheKey(String? uniqueKey) =>
      _categoriaFeedManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    versaoAtualAppFocusNode?.dispose();
    versaoAtualAppController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearCategoriaFeedCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
