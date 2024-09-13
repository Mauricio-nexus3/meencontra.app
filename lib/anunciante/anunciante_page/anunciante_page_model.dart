import '/anunciante/componentes/appbar_perfil/appbar_perfil_widget.dart';
import '/anunciante/componentes/avaliacoes/avaliacoes_widget.dart';
import '/anunciante/componentes/map_google/map_google_widget.dart';
import '/anunciante/componentes/templete_anunciante/templete_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menus/menu_drawer/menu_drawer_widget.dart';
import '/componentes_globais/pop_up/alert_confirm_pop_up/alert_confirm_pop_up_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'anunciante_page_widget.dart' show AnunciantePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
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

  // Stores action output result for [Firestore Query - Query a collection] action in AnunciantePage widget.
  RelatorioRecord? relatorio;
  // Stores action output result for [Firestore Query - Query a collection] action in AnunciantePage widget.
  List<CarrinhoDeComprasUsuarioRecord>? totaldeItensNoCarrinho;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel1;
  // Model for TempleteAnunciante component.
  late TempleteAnuncianteModel templeteAnuncianteModel;
  String currentPageLink = '';
  // Stores action output result for [Firestore Query - Query a collection] action in TempleteAnunciante widget.
  EnderecoRecord? saidaEndereco;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel2;
  // Model for appbarPerfil component.
  late AppbarPerfilModel appbarPerfilModel;

  @override
  void initState(BuildContext context) {
    menuDrawerModel1 = createModel(context, () => MenuDrawerModel());
    templeteAnuncianteModel =
        createModel(context, () => TempleteAnuncianteModel());
    menuDrawerModel2 = createModel(context, () => MenuDrawerModel());
    appbarPerfilModel = createModel(context, () => AppbarPerfilModel());
  }

  @override
  void dispose() {
    menuDrawerModel1.dispose();
    templeteAnuncianteModel.dispose();
    menuDrawerModel2.dispose();
    appbarPerfilModel.dispose();
  }
}
