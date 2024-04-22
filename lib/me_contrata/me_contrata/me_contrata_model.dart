import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/feed_home/componentes/feed_menu_horizont/feed_menu_horizont_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_contrata/componentes/mecontrata_card/mecontrata_card_widget.dart';
import '/meencontra_dashboard/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import 'me_contrata_widget.dart' show MeContrataWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeContrataModel extends FlutterFlowModel<MeContrataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
  // Model for FeedMenuHorizont component.
  late FeedMenuHorizontModel feedMenuHorizontModel;

  @override
  void initState(BuildContext context) {
    gridViewController = ScrollController();
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
    feedMenuHorizontModel = createModel(context, () => FeedMenuHorizontModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gridViewController?.dispose();
    appbarGrupoMeModel.dispose();
    feedMenuHorizontModel.dispose();
  }
}
