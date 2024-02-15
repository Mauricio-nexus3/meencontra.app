import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_divirta/medivirta_card/medivirta_card_widget.dart';
import 'me_divirta_widget.dart' show MeDivirtaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  final unfocusNode = FocusNode();
  // State field(s) for ColumnOK widget.
  ScrollController? columnOK;
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for ListView widget.
  ScrollController? listViewController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnOK = ScrollController();
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnOK?.dispose();
    appbarGrupoMeModel.dispose();
    listViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
