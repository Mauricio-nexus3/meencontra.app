import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/me_informa/componentes/card_perfil_t_v_g_ooficial/card_perfil_t_v_g_ooficial_widget.dart';
import '/meencontra_dashboard/componentes/acao_tabale/acao_tabale_widget.dart';
import 'tvgon_widget.dart' show TvgonWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TvgonModel extends FlutterFlowModel<TvgonWidget> {
  ///  Local state fields for this page.

  String categoriaMateria = 'Todos';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for CardPerfilTVGOoficial component.
  late CardPerfilTVGOoficialModel cardPerfilTVGOoficialModel;

  @override
  void initState(BuildContext context) {
    cardPerfilTVGOoficialModel =
        createModel(context, () => CardPerfilTVGOoficialModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    cardPerfilTVGOoficialModel.dispose();
  }
}
