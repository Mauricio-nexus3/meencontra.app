import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/anunciante/anunciante_page/produtos/cadastrar_produto/cadastrar_produto_widget.dart';
import '/anunciante/anunciante_page/produtos/popup_excluir_produto/popup_excluir_produto_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/meencontra_dashboard/componentes/acao_tabale/acao_tabale_widget.dart';
import 'dash_anunciante_produtos_widget.dart' show DashAnuncianteProdutosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashAnuncianteProdutosModel
    extends FlutterFlowModel<DashAnuncianteProdutosWidget> {
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
