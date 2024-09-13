import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menus/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/menus/menu_horizontal/menu_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_divirta/componentes/medivirta_card/medivirta_card_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'me_divirta_widget.dart' show MeDivirtaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeDivirtaModel extends FlutterFlowModel<MeDivirtaWidget> {
  ///  Local state fields for this page.

  bool filtroData = false;

  DateTime? diaCalendario;

  List<DateTime> diaEvento = [];
  void addToDiaEvento(DateTime item) => diaEvento.add(item);
  void removeFromDiaEvento(DateTime item) => diaEvento.remove(item);
  void removeAtIndexFromDiaEvento(int index) => diaEvento.removeAt(index);
  void insertAtIndexInDiaEvento(int index, DateTime item) =>
      diaEvento.insert(index, item);
  void updateDiaEventoAtIndex(int index, Function(DateTime) updateFn) =>
      diaEvento[index] = updateFn(diaEvento[index]);

  DateTime? diaSelecionado;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ColumnOK widget.
  ScrollController? columnOK;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for CarouselWeb_medivirta widget.
  CarouselController? carouselWebMedivirtaController;
  int carouselWebMedivirtaCurrentIndex = 0;

  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Model for menuHorizontal component.
  late MenuHorizontalModel menuHorizontalModel;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    gridViewController = ScrollController();
    menuHorizontalModel = createModel(context, () => MenuHorizontalModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    gridViewController?.dispose();
    menuHorizontalModel.dispose();
    menuDrawerModel.dispose();
  }
}
