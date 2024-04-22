import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dash_anunciante_painel_adm_widget.dart'
    show DashAnunciantePainelAdmWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashAnunciantePainelAdmModel
    extends FlutterFlowModel<DashAnunciantePainelAdmWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel1;
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel2;

  @override
  void initState(BuildContext context) {
    menuDashAnuncianteModel1 =
        createModel(context, () => MenuDashAnuncianteModel());
    menuDashAnuncianteModel2 =
        createModel(context, () => MenuDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuDashAnuncianteModel1.dispose();
    menuDashAnuncianteModel2.dispose();
  }
}
