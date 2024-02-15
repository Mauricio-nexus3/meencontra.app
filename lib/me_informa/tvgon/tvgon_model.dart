import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_informa/card_perfil_t_v_g_ooficial/card_perfil_t_v_g_ooficial_widget.dart';
import 'tvgon_widget.dart' show TvgonWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TvgonModel extends FlutterFlowModel<TvgonWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel1;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel2;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel3;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel4;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel5;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel6;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel7;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel8;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel9;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel10;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel11;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel12;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel13;
  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel14;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardPerfilTVGOoficialModel1 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel2 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel3 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel4 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel5 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel6 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel7 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel8 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel9 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel10 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel11 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel12 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel13 =
        createModel(context, () => CardPerfilTVGOoficialModel());
    cardPerfilTVGOoficialModel14 =
        createModel(context, () => CardPerfilTVGOoficialModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    cardPerfilTVGOoficialModel1.dispose();
    cardPerfilTVGOoficialModel2.dispose();
    cardPerfilTVGOoficialModel3.dispose();
    cardPerfilTVGOoficialModel4.dispose();
    cardPerfilTVGOoficialModel5.dispose();
    cardPerfilTVGOoficialModel6.dispose();
    cardPerfilTVGOoficialModel7.dispose();
    cardPerfilTVGOoficialModel8.dispose();
    cardPerfilTVGOoficialModel9.dispose();
    cardPerfilTVGOoficialModel10.dispose();
    cardPerfilTVGOoficialModel11.dispose();
    cardPerfilTVGOoficialModel12.dispose();
    cardPerfilTVGOoficialModel13.dispose();
    cardPerfilTVGOoficialModel14.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
