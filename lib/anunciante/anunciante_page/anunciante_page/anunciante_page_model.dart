import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/anunciante/anunciante_page/templete_anunciante/templete_anunciante_widget.dart';
import '/anunciante/carrinho_compras/popup_enviar_pedido/popup_enviar_pedido_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/componentes/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'anunciante_page_widget.dart' show AnunciantePageWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AnunciantePageModel extends FlutterFlowModel<AnunciantePageWidget> {
  ///  Local state fields for this page.

  bool? editarComentario;

  DocumentReference? editarComentarioRef;

  DateTime? horaAbre;

  DateTime? ultimaNotificacao;

  String responsavelPorNotificacao = 'Ainda não enviado';

  Color? corSelecionada;

  bool mostrarPerfil = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AnunciantePage widget.
  RelatorioRecord? relatorio;
  // Stores action output result for [Firestore Query - Query a collection] action in AnunciantePage widget.
  List<CarrinhoDeComprasUsuarioRecord>? totaldeItensNoCarrinho;
  String currentPageLink = '';
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel1;
  // Model for TempleteAnunciante component.
  late TempleteAnuncianteModel templeteAnuncianteModel;
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel2;

  @override
  void initState(BuildContext context) {
    menuDashAnuncianteModel1 =
        createModel(context, () => MenuDashAnuncianteModel());
    templeteAnuncianteModel =
        createModel(context, () => TempleteAnuncianteModel());
    menuDashAnuncianteModel2 =
        createModel(context, () => MenuDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuDashAnuncianteModel1.dispose();
    templeteAnuncianteModel.dispose();
    menuDashAnuncianteModel2.dispose();
  }
}
