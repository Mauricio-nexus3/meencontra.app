import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_contrata/mecontrata_card/mecontrata_card_widget.dart';
import 'me_contrata_widget.dart' show MeContrataWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeContrataModel extends FlutterFlowModel<MeContrataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    appbarGrupoMeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
