import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menus/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/menus/menu_horizontal/menu_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_informa/componentes/card_right_meinforma/card_right_meinforma_widget.dart';
import '/me_informa/componentes/meinforma_card_lista/meinforma_card_lista_widget.dart';
import 'dart:math';
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

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
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
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for StaggeredView widget.
  ScrollController? staggeredViewController;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel1;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel2;
  // Model for cardRightMeinforma component.
  late CardRightMeinformaModel cardRightMeinformaModel3;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Model for menuHorizontal component.
  late MenuHorizontalModel menuHorizontalModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    rowController = ScrollController();
    columnController3 = ScrollController();
    staggeredViewController = ScrollController();
    cardRightMeinformaModel1 =
        createModel(context, () => CardRightMeinformaModel());
    cardRightMeinformaModel2 =
        createModel(context, () => CardRightMeinformaModel());
    cardRightMeinformaModel3 =
        createModel(context, () => CardRightMeinformaModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    menuHorizontalModel = createModel(context, () => MenuHorizontalModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    rowController?.dispose();
    columnController3?.dispose();
    staggeredViewController?.dispose();
    cardRightMeinformaModel1.dispose();
    cardRightMeinformaModel2.dispose();
    cardRightMeinformaModel3.dispose();
    menuDrawerModel.dispose();
    menuHorizontalModel.dispose();
  }
}
