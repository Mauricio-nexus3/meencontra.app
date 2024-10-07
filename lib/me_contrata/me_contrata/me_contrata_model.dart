import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/menus/menu_horizontal/menu_horizontal_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import '/me_contrata/componentes/mecontrata_card/mecontrata_card_widget.dart';
import 'me_contrata_widget.dart' show MeContrataWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeContrataModel extends FlutterFlowModel<MeContrataWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for menuHorizontal component.
  late MenuHorizontalModel menuHorizontalModel;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    gridViewController = ScrollController();
    navbarModel = createModel(context, () => NavbarModel());
    menuHorizontalModel = createModel(context, () => MenuHorizontalModel());
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    gridViewController?.dispose();
    navbarModel.dispose();
    menuHorizontalModel.dispose();
    menuDrawerModel.dispose();
  }
}
