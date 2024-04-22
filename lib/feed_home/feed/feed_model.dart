import '/anunciante/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/card_essencial_copy/card_essencial_copy_widget.dart';
import '/feed_home/componentes/card_premium_feed/card_premium_feed_widget.dart';
import '/feed_home/componentes/circle_categorie/circle_categorie_widget.dart';
import '/feed_home/componentes/drawer_componente_usuario/drawer_componente_usuario_widget.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/feed_home/componentes/new_comp_anuncios_gera_l/new_comp_anuncios_gera_l_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_contrata/componentes/mecontrata_feed/mecontrata_feed_widget.dart';
import '/me_divirta/componentes/medivirta_feed/medivirta_feed_widget.dart';
import '/me_informa/componentes/me_informa_card_feed/me_informa_card_feed_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/request_manager.dart';

import 'feed_widget.dart' show FeedWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  String categoriaSelecionada = 'Em destaque';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Feed widget.
  NotificacaoRecord? novaAtualizacao;
  // Model for FeedMenuHorizont component.
  late FeedMenuHorizontModel feedMenuHorizontModel;
  // Model for drawerComponenteUsuario component.
  late DrawerComponenteUsuarioModel drawerComponenteUsuarioModel;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  MeInformaRecord? imprensaRefere;
  // Stores action output result for [Firestore Query - Query a collection] action in FloatingActionButton widget.
  AnuncianteRecord? anuncianteRefFeed;
  // State field(s) for TabBar1 widget.
  TabController? tabBar1Controller;
  int get tabBar1CurrentIndex =>
      tabBar1Controller != null ? tabBar1Controller!.index : 0;

  // State field(s) for CarouselTESTE widget.
  CarouselController? carouselTESTEController;

  int carouselTESTECurrentIndex = 0;

  // State field(s) for CarouselWeb widget.
  CarouselController? carouselWebController;

  int carouselWebCurrentIndex = 0;

  // State field(s) for mobile widget.
  CarouselController? mobileController;

  int mobileCurrentIndex = 1;

  // State field(s) for desktop widget.
  CarouselController? desktopController;

  int desktopCurrentIndex = 1;

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
    feedMenuHorizontModel = createModel(context, () => FeedMenuHorizontModel());
    drawerComponenteUsuarioModel =
        createModel(context, () => DrawerComponenteUsuarioModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    feedMenuHorizontModel.dispose();
    drawerComponenteUsuarioModel.dispose();
    tabBar1Controller?.dispose();

    /// Dispose query cache managers for this widget.

    clearNovoFeedCache();
  }
}
