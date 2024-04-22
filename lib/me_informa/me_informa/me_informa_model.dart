import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_informa/componentes/card_right_meinforma/card_right_meinforma_widget.dart';
import '/me_informa/componentes/meinforma_card_lista/meinforma_card_lista_widget.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import 'me_informa_widget.dart' show MeInformaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeInformaModel extends FlutterFlowModel<MeInformaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
  // Model for FeedMenuHorizont component.
  late FeedMenuHorizontModel feedMenuHorizontModel;
  // State field(s) for AppBar widget.
  ScrollController? appBar;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for StaggeredView widget.
  ScrollController? staggeredViewController;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel1;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel2;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel3;

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
    feedMenuHorizontModel = createModel(context, () => FeedMenuHorizontModel());
    appBar = ScrollController();
    rowController = ScrollController();
    staggeredViewController = ScrollController();
    cardRightMeinformaModel1 =
        createModel(context, () => CardRightMeinformaModel());
    cardRightMeinformaModel2 =
        createModel(context, () => CardRightMeinformaModel());
    cardRightMeinformaModel3 =
        createModel(context, () => CardRightMeinformaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
    feedMenuHorizontModel.dispose();
    appBar?.dispose();
    rowController?.dispose();
    staggeredViewController?.dispose();
    cardRightMeinformaModel1.dispose();
    cardRightMeinformaModel2.dispose();
    cardRightMeinformaModel3.dispose();
  }
}
