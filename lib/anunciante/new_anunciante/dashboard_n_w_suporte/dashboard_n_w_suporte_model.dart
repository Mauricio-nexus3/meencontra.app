import '/anunciante/new_componentes/cadastrar_produto/cadastrar_produto_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/anunciante/new_componentes/popup_excluir_produto/popup_excluir_produto_widget.dart';
import '/backend/backend.dart';
import '/components/acao_tabale_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dashboard_n_w_suporte_widget.dart' show DashboardNWSuporteWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardNWSuporteModel
    extends FlutterFlowModel<DashboardNWSuporteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel1;
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newDashAnuncianteModel1 =
        createModel(context, () => NewDashAnuncianteModel());
    newDashAnuncianteModel2 =
        createModel(context, () => NewDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newDashAnuncianteModel1.dispose();
    newDashAnuncianteModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
