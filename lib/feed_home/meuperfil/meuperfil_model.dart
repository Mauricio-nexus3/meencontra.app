import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/menu_profile_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'meuperfil_widget.dart' show MeuperfilWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MeuperfilModel extends FlutterFlowModel<MeuperfilWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel1;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel2;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel3;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel4;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel5;
  // Model for menuProfile component.
  late MenuProfileModel menuProfileModel6;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    menuProfileModel1 = createModel(context, () => MenuProfileModel());
    menuProfileModel2 = createModel(context, () => MenuProfileModel());
    menuProfileModel3 = createModel(context, () => MenuProfileModel());
    menuProfileModel4 = createModel(context, () => MenuProfileModel());
    menuProfileModel5 = createModel(context, () => MenuProfileModel());
    menuProfileModel6 = createModel(context, () => MenuProfileModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    menuProfileModel1.dispose();
    menuProfileModel2.dispose();
    menuProfileModel3.dispose();
    menuProfileModel4.dispose();
    menuProfileModel5.dispose();
    menuProfileModel6.dispose();
    navbarModel.dispose();
  }
}
