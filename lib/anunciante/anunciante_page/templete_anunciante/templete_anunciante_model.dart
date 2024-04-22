import '/anunciante/anunciante_page/componentes/avaliacoes/avaliacoes_widget.dart';
import '/anunciante/anunciante_page/componentes/contato/contato_widget.dart';
import '/anunciante/anunciante_page/componentes/map_google/map_google_widget.dart';
import '/anunciante/anunciante_page/componentes/mostrar_cards_lista/mostrar_cards_lista_widget.dart';
import '/anunciante/anunciante_page/componentes/sobre_anunciante/sobre_anunciante_widget.dart';
import '/anunciante/anunciante_page/produtos/card_produto/card_produto_widget.dart';
import '/anunciante/anunciante_page/produtos/grid_produto/grid_produto_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'templete_anunciante_widget.dart' show TempleteAnuncianteWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TempleteAnuncianteModel
    extends FlutterFlowModel<TempleteAnuncianteWidget> {
  ///  Local state fields for this component.

  bool mostrarEmLista = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for mostrarCardsLista component.
  late MostrarCardsListaModel mostrarCardsListaModel1;
  // Model for mostrarCardsLista component.
  late MostrarCardsListaModel mostrarCardsListaModel2;
  // Model for mostrarCardsLista component.
  late MostrarCardsListaModel mostrarCardsListaModel3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    mostrarCardsListaModel1 =
        createModel(context, () => MostrarCardsListaModel());
    mostrarCardsListaModel2 =
        createModel(context, () => MostrarCardsListaModel());
    mostrarCardsListaModel3 =
        createModel(context, () => MostrarCardsListaModel());
  }

  @override
  void dispose() {
    mostrarCardsListaModel1.dispose();
    mostrarCardsListaModel2.dispose();
    mostrarCardsListaModel3.dispose();
    tabBarController?.dispose();
  }
}
