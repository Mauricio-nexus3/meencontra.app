import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/categorias/componentes/card_small_sub_categoria/card_small_sub_categoria_widget.dart';
import '/componentes_globais/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/menus/menu_horizontal/menu_horizontal_widget.dart';
import '/components/atualizacao_disponivel_widget.dart';
import '/components/navbar_widget.dart';
import '/feed_home/feedcomp/card_essencial_copy/card_essencial_copy_widget.dart';
import '/feed_home/feedcomp/card_premium_feed/card_premium_feed_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/feed_home/feedcomp/feed_completo_divirta/feed_completo_divirta_widget.dart';
import '/feed_home/feedcomp/feed_completo_informa/feed_completo_informa_widget.dart';
import '/feed_home/feedcomp/header_title_feed/header_title_feed_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/request_manager.dart';

import 'feed_widget.dart' show FeedWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  DocumentReference? docRefNoticias;

  double? numeroindex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Feed widget.
  NotificacaoRecord? novaAtualizacao;
  // Model for menuHorizontal component.
  late MenuHorizontalModel menuHorizontalModel;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // State field(s) for CarouselWeb widget.
  CarouselController? carouselWebController;
  int carouselWebCurrentIndex = 0;

  // Model for headerTitleFeed component.
  late HeaderTitleFeedModel headerTitleFeedModel1;
  // Model for FeedCompletoInforma component.
  late FeedCompletoInformaModel feedCompletoInformaModel;
  // State field(s) for desktop widget.
  CarouselController? desktopController1;
  int desktopCurrentIndex1 = 1;

  // State field(s) for desktop widget.
  CarouselController? desktopController2;
  int desktopCurrentIndex2 = 1;

  // Model for FeedCompletoDivirta component.
  late FeedCompletoDivirtaModel feedCompletoDivirtaModel;
  // Model for headerTitleFeed component.
  late HeaderTitleFeedModel headerTitleFeedModel2;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Query cache managers for this widget.

  final _novoFeedManager = FutureRequestManager<List<NotificacaoRecord>>();
  Future<List<NotificacaoRecord>> novoFeed({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<NotificacaoRecord>> Function() requestFn,
  }) =>
      _novoFeedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNovoFeedCache() => _novoFeedManager.clear();
  void clearNovoFeedCacheKey(String? uniqueKey) =>
      _novoFeedManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    menuHorizontalModel = createModel(context, () => MenuHorizontalModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    headerTitleFeedModel1 = createModel(context, () => HeaderTitleFeedModel());
    feedCompletoInformaModel =
        createModel(context, () => FeedCompletoInformaModel());
    feedCompletoDivirtaModel =
        createModel(context, () => FeedCompletoDivirtaModel());
    headerTitleFeedModel2 = createModel(context, () => HeaderTitleFeedModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    menuHorizontalModel.dispose();
    menuDrawerModel.dispose();
    headerTitleFeedModel1.dispose();
    feedCompletoInformaModel.dispose();
    feedCompletoDivirtaModel.dispose();
    headerTitleFeedModel2.dispose();
    navbarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearNovoFeedCache();
  }
}
