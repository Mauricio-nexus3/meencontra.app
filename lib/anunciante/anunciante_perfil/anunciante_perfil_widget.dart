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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'anunciante_perfil_model.dart';
export 'anunciante_perfil_model.dart';

class AnunciantePerfilWidget extends StatefulWidget {
  const AnunciantePerfilWidget({
    super.key,
    this.referenciaAnunciante,
  });

  final DocumentReference? referenciaAnunciante;

  @override
  State<AnunciantePerfilWidget> createState() => _AnunciantePerfilWidgetState();
}

class _AnunciantePerfilWidgetState extends State<AnunciantePerfilWidget> {
  late AnunciantePerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnunciantePerfilModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AnunciantePerfil'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANUNCIANTE_PERFIL_AnunciantePerfil_ON_IN');
      _model.relatorio = await queryRelatorioRecordOnce(
        parent: widget!.referenciaAnunciante,
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      await _model.relatorio!.reference.update({
        ...mapToFirestore(
          {
            'visualizacaoPagina': FieldValue.increment(1.0),
          },
        ),
      });
      _model.mostrarPerfil = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<AnuncianteRecord>(
      stream: AnuncianteRecord.getDocument(widget!.referenciaAnunciante!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final anunciantePerfilAnuncianteRecord = snapshot.data!;

        return Title(
            title: 'AnunciantePerfil',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Builder(
                    builder: (context) => wrapWithModel(
                      model: _model.appbarPerfilModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppbarPerfilWidget(
                        iduserProfile:
                            anunciantePerfilAnuncianteRecord.anuncianteUser!.id,
                        planoAssinatura:
                            anunciantePerfilAnuncianteRecord.planoAssinatura,
                        actionShare: () async {
                          logFirebaseEvent(
                              'ANUNCIANTE_PERFIL_Container_tay5v0ay_CAL');
                          _model.currentPageLink =
                              await generateCurrentPageLink(
                            context,
                            title:
                                anunciantePerfilAnuncianteRecord.nomeFantasia,
                            imageUrl: anunciantePerfilAnuncianteRecord.logo,
                            description: 'meencontra',
                            isShortLink: false,
                          );

                          await Share.share(
                            _model.currentPageLink,
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                        actionResgatarMeuNegocio: () async {},
                        actionDrawer: () async {
                          logFirebaseEvent(
                              'ANUNCIANTE_PERFIL_Container_tay5v0ay_CAL');
                          scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        child: Container(
                          height: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 270.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                          ),
                          child: wrapWithModel(
                            model: _model.menuDrawerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuDrawerWidget(
                              paginaAtual: anunciantePerfilAnuncianteRecord
                                          .anuncianteUser ==
                                      currentUserReference
                                  ? TelasMenuDrawer.Meu_negocio.name
                                  : 'usuario',
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width >=
                                    1020.0) {
                                  return 124.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1020.0) &&
                                    (FFAppState().EsconderDaTela == true)) {
                                  return 0.0;
                                } else {
                                  return 0.0;
                                }
                              }(),
                              0.0,
                            ),
                            0.0,
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width >=
                                    1020.0) {
                                  return 124.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1020.0) &&
                                    (FFAppState().EsconderDaTela == true)) {
                                  return 0.0;
                                } else {
                                  return 0.0;
                                }
                              }(),
                              0.0,
                            ),
                            0.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minWidth: 363.0,
                            maxWidth: 900.0,
                          ),
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (anunciantePerfilAnuncianteRecord
                                            .planoAssinatura !=
                                        PlanoAssinatura.gratis.name) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Alimentação') {
                                              return wrapWithModel(
                                                model: _model.tServicosModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TServicosWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Beleza e estética') {
                                              return wrapWithModel(
                                                model: _model.tMercadoModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TMercadoWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Casa e Construção') {
                                              return wrapWithModel(
                                                model: _model.tTecnologiaModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TTecnologiaWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Comunidade') {
                                              return wrapWithModel(
                                                model: _model.tComunidadeModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TComunidadeWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Automotivo') {
                                              return wrapWithModel(
                                                model:
                                                    _model.tBelezaEsteticaModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TBelezaEsteticaWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Esporte e lazer') {
                                              return wrapWithModel(
                                                model: _model.tEsporteModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TEsporteWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Serviços') {
                                              return wrapWithModel(
                                                model:
                                                    _model.tSaudebemestarModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TSaudebemestarWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Educação e cultura') {
                                              return wrapWithModel(
                                                model: _model
                                                    .tEducacaoCulturaModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TEducacaoCulturaWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else if (anunciantePerfilAnuncianteRecord
                                                    .categoria ==
                                                'Farmácia') {
                                              return wrapWithModel(
                                                model: _model.tFarmaciaModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TFarmaciaWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            } else {
                                              return wrapWithModel(
                                                model: _model.tPadraoModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TPadraoWidget(
                                                  doc:
                                                      anunciantePerfilAnuncianteRecord,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    } else {
                                      return wrapWithModel(
                                        model: _model.tNresgatadoModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TNresgatadoWidget(
                                          doc: anunciantePerfilAnuncianteRecord,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: StreamBuilder<List<AnuncianteRecord>>(
                                    stream: queryAnuncianteRecord(
                                      limit: 50,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 30.0,
                                            height: 30.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF622AE2),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<AnuncianteRecord>
                                          containerAnuncianteRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants
                                                        .paddingMobile,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Veja também',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final concorrente =
                                                        containerAnuncianteRecordList
                                                            .where((e) =>
                                                                e.nomeSubCategoria01 ==
                                                                e.nomeSubCategoria01)
                                                            .toList()
                                                            .take(12)
                                                            .toList();

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            concorrente.length,
                                                            (concorrenteIndex) {
                                                          final concorrenteItem =
                                                              concorrente[
                                                                  concorrenteIndex];
                                                          return CircleCategorieWidget(
                                                            key: Key(
                                                                'Keyr8s_${concorrenteIndex}_of_${concorrente.length}'),
                                                            img: concorrenteItem
                                                                .logo,
                                                            name: concorrenteItem
                                                                .nomeFantasia,
                                                            resgatado: false,
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'Descobrir',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final concorrente =
                                                      containerAnuncianteRecordList
                                                          .where((e) =>
                                                              e.nomeFantasia !=
                                                              e.nomeFantasia)
                                                          .toList()
                                                          .take(12)
                                                          .toList();

                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          concorrente.length,
                                                          (concorrenteIndex) {
                                                        final concorrenteItem =
                                                            concorrente[
                                                                concorrenteIndex];
                                                        return CircleCategorieWidget(
                                                          key: Key(
                                                              'Key6y1_${concorrenteIndex}_of_${concorrente.length}'),
                                                          img: concorrenteItem
                                                              .logo,
                                                          name: concorrenteItem
                                                              .nomeFantasia,
                                                          planoAssinatura:
                                                              concorrenteItem
                                                                  .planoAssinatura,
                                                          resgatado:
                                                              concorrenteItem
                                                                  .resgatado,
                                                        );
                                                      }).divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
