import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/backend/backend.dart';
import '/categorias/componentes/card_big_sub_categoria/card_big_sub_categoria_widget.dart';
import '/categorias/componentes/card_premium_categoria/card_premium_categoria_widget.dart';
import '/categorias/componentes/card_small_sub_categoria/card_small_sub_categoria_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'sub_ctegoria_widget.dart' show SubCtegoriaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubCtegoriaModel extends FlutterFlowModel<SubCtegoriaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
