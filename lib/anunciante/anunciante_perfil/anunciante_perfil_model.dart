import '/anunciante/componentes/appbar_perfil/appbar_perfil_widget.dart';
import '/anunciante/templete/t_beleza_estetica/t_beleza_estetica_widget.dart';
import '/anunciante/templete/t_comunidade/t_comunidade_widget.dart';
import '/anunciante/templete/t_educacao_cultura/t_educacao_cultura_widget.dart';
import '/anunciante/templete/t_esporte/t_esporte_widget.dart';
import '/anunciante/templete/t_farmacia/t_farmacia_widget.dart';
import '/anunciante/templete/t_mercado/t_mercado_widget.dart';
import '/anunciante/templete/t_nresgatado/t_nresgatado_widget.dart';
import '/anunciante/templete/t_padrao/t_padrao_widget.dart';
import '/anunciante/templete/t_saudebemestar/t_saudebemestar_widget.dart';
import '/anunciante/templete/t_servicos/t_servicos_widget.dart';
import '/anunciante/templete/t_tecnologia/t_tecnologia_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/componentes_globais/menu_drawer/menu_drawer_widget.dart';
import '/feed_home/feedcomp/circle_categorie/circle_categorie_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'anunciante_perfil_widget.dart' show AnunciantePerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class AnunciantePerfilModel extends FlutterFlowModel<AnunciantePerfilWidget> {
  ///  Local state fields for this page.

  bool? editarComentario;

  DocumentReference? editarComentarioRef;

  DateTime? horaAbre;

  DateTime? ultimaNotificacao;

  String responsavelPorNotificacao = 'Ainda não enviado';

  Color? corSelecionada;

  bool mostrarPerfil = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AnunciantePerfil widget.
  RelatorioRecord? relatorio;
  // Model for MenuDrawer component.
  late MenuDrawerModel menuDrawerModel;
  // Model for t_servicos component.
  late TServicosModel tServicosModel;
  // Model for t_mercado component.
  late TMercadoModel tMercadoModel;
  // Model for t_tecnologia component.
  late TTecnologiaModel tTecnologiaModel;
  // Model for t_comunidade component.
  late TComunidadeModel tComunidadeModel;
  // Model for t_BelezaEstetica component.
  late TBelezaEsteticaModel tBelezaEsteticaModel;
  // Model for t_esporte component.
  late TEsporteModel tEsporteModel;
  // Model for t_saudebemestar component.
  late TSaudebemestarModel tSaudebemestarModel;
  // Model for t_educacaoCultura component.
  late TEducacaoCulturaModel tEducacaoCulturaModel;
  // Model for t_Farmacia component.
  late TFarmaciaModel tFarmaciaModel;
  // Model for t_padrao component.
  late TPadraoModel tPadraoModel;
  // Model for t_nresgatado component.
  late TNresgatadoModel tNresgatadoModel;
  // Model for appbarPerfil component.
  late AppbarPerfilModel appbarPerfilModel;
  String currentPageLink = '';

  @override
  void initState(BuildContext context) {
    menuDrawerModel = createModel(context, () => MenuDrawerModel());
    tServicosModel = createModel(context, () => TServicosModel());
    tMercadoModel = createModel(context, () => TMercadoModel());
    tTecnologiaModel = createModel(context, () => TTecnologiaModel());
    tComunidadeModel = createModel(context, () => TComunidadeModel());
    tBelezaEsteticaModel = createModel(context, () => TBelezaEsteticaModel());
    tEsporteModel = createModel(context, () => TEsporteModel());
    tSaudebemestarModel = createModel(context, () => TSaudebemestarModel());
    tEducacaoCulturaModel = createModel(context, () => TEducacaoCulturaModel());
    tFarmaciaModel = createModel(context, () => TFarmaciaModel());
    tPadraoModel = createModel(context, () => TPadraoModel());
    tNresgatadoModel = createModel(context, () => TNresgatadoModel());
    appbarPerfilModel = createModel(context, () => AppbarPerfilModel());
  }

  @override
  void dispose() {
    menuDrawerModel.dispose();
    tServicosModel.dispose();
    tMercadoModel.dispose();
    tTecnologiaModel.dispose();
    tComunidadeModel.dispose();
    tBelezaEsteticaModel.dispose();
    tEsporteModel.dispose();
    tSaudebemestarModel.dispose();
    tEducacaoCulturaModel.dispose();
    tFarmaciaModel.dispose();
    tPadraoModel.dispose();
    tNresgatadoModel.dispose();
    appbarPerfilModel.dispose();
  }
}
