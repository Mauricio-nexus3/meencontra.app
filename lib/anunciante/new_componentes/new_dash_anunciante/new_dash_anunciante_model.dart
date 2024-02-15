import '/anunciante/new_anunciante/build/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/estrela_bloqueio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_dash_anunciante_widget.dart' show NewDashAnuncianteWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewDashAnuncianteModel extends FlutterFlowModel<NewDashAnuncianteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel2;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    estrelaBloqueioModel1 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel2 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel3 = createModel(context, () => EstrelaBloqueioModel());
  }

  @override
  void dispose() {
    estrelaBloqueioModel1.dispose();
    estrelaBloqueioModel2.dispose();
    estrelaBloqueioModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
