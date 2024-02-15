import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_informa/meinforma_card_lista/meinforma_card_lista_widget.dart';
import 'me_informa_widget.dart' show MeInformaWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeInformaModel extends FlutterFlowModel<MeInformaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for AppBar widget.
  ScrollController? appBar;
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBar = ScrollController();
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
    rowController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBar?.dispose();
    appbarGrupoMeModel.dispose();
    rowController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
