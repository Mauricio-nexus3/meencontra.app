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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'anunciante_page_model.dart';
export 'anunciante_page_model.dart';

class AnunciantePageWidget extends StatefulWidget {
  const AnunciantePageWidget({
    super.key,
    required this.documentoRefAnunciante,
  });

  final AnuncianteRecord? documentoRefAnunciante;

  @override
  State<AnunciantePageWidget> createState() => _AnunciantePageWidgetState();
}

class _AnunciantePageWidgetState extends State<AnunciantePageWidget> {
  late AnunciantePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnunciantePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AnunciantePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANUNCIANTE_AnunciantePage_ON_INIT_STATE');
      _model.relatorio = await queryRelatorioRecordOnce(
        parent: widget!.documentoRefAnunciante?.reference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      await _model.relatorio!.reference.update({
        ...mapToFirestore(
          {
            'visualizacaoPagina': FieldValue.increment(1.0),
          },
        ),
      });
      _model.totaldeItensNoCarrinho =
          await queryCarrinhoDeComprasUsuarioRecordOnce(
        parent: currentUserReference,
        queryBuilder: (carrinhoDeComprasUsuarioRecord) =>
            carrinhoDeComprasUsuarioRecord.where(
          'anuncianteRef',
          isEqualTo: widget!.documentoRefAnunciante?.reference,
        ),
      );
      FFAppState().corSelecionadaAnunciante = valueOrDefault<Color>(
        widget!.documentoRefAnunciante?.cor,
        FlutterFlowTheme.of(context).primary,
      );
      FFAppState().templeteLayoutSelecionado = valueOrDefault<String>(
        widget!.documentoRefAnunciante?.templeteLayout,
        'padrão',
      );
      FFAppState().qntdItensCarrinho = _model.totaldeItensNoCarrinho!.length;
      safeSetState(() {});
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

    return Title(
        title: 'AnunciantePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.menuDrawerModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: MenuDrawerWidget(
                    paginaAtual: TelasMenuDrawer.Meu_negocio.name,
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Builder(
                builder: (context) => wrapWithModel(
                  model: _model.appbarPerfilModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppbarPerfilWidget(
                    iduserProfile: widget!.documentoRefAnunciante!.aid,
                    planoAssinatura:
                        widget!.documentoRefAnunciante!.planoAssinatura,
                    actionShare: () async {
                      logFirebaseEvent(
                          'ANUNCIANTE_Container_tay5v0ay_CALLBACK');
                      _model.currentPageLink = await generateCurrentPageLink(
                        context,
                        title: widget!.documentoRefAnunciante?.nomeFantasia,
                        imageUrl: widget!.documentoRefAnunciante?.logo,
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
                          'ANUNCIANTE_Container_tay5v0ay_CALLBACK');
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (((valueOrDefault<String>(
                                widget!.documentoRefAnunciante?.aid,
                                'Nome Fantasia',
                              ) ==
                              valueOrDefault(
                                  currentUserDocument?.iDUser, '')) ||
                          (widget!.documentoRefAnunciante?.emailUsuarioAdm ==
                              currentUserEmail)) &&
                      responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                    AuthUserStreamWidget(
                      builder: (context) => Material(
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
                            model: _model.menuDrawerModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuDrawerWidget(
                              paginaAtual:
                                  widget!.documentoRefAnunciante?.aid ==
                                          valueOrDefault(
                                              currentUserDocument?.iDUser, '')
                                      ? TelasMenuDrawer.Meu_negocio.name
                                      : 'usuario',
                            ),
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            () {
                              if (MediaQuery.sizeOf(context).width >= 1020.0) {
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
                              if (MediaQuery.sizeOf(context).width >= 1020.0) {
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
                                builder: (context) => wrapWithModel(
                                  model: _model.templeteAnuncianteModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TempleteAnuncianteWidget(
                                    categoriaTemplete: widget!
                                        .documentoRefAnunciante!.categoria,
                                    logo: widget!.documentoRefAnunciante!.logo,
                                    nome: widget!
                                        .documentoRefAnunciante!.nomeFantasia,
                                    subcategoria01: widget!
                                        .documentoRefAnunciante!
                                        .nomeSubCategoria01,
                                    subcategoria02: widget!
                                        .documentoRefAnunciante!
                                        .nomeSubCategoria02,
                                    bio: widget!
                                        .documentoRefAnunciante!.descricao,
                                    planoAssinatura: widget!
                                        .documentoRefAnunciante!
                                        .planoAssinatura,
                                    corSelecionada: valueOrDefault<Color>(
                                      widget!.documentoRefAnunciante?.cor,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    whatsappNumero: widget!
                                        .documentoRefAnunciante!.whatsComercial,
                                    enderecoCompleto: widget!
                                        .documentoRefAnunciante!
                                        .enderecoCompleto,
                                    idViewProfile: widget!
                                        .documentoRefAnunciante!.reference.id,
                                    actionDrawer: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    actionCompartilhar: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      _model.currentPageLink =
                                          await generateCurrentPageLink(
                                        context,
                                        title: widget!.documentoRefAnunciante
                                            ?.nomeFantasia,
                                        imageUrl: widget!
                                            .documentoRefAnunciante?.logo,
                                        description: widget!
                                            .documentoRefAnunciante?.descricao,
                                        isShortLink: false,
                                      );

                                      await Share.share(
                                        _model.currentPageLink,
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                    actionResgatarMeuNegocio: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      // Action Resgatar Meu negocio
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child: AlertConfirmPopUpWidget(
                                                  tituloAcao:
                                                      'Resgatar meu negócio',
                                                  textoAcao:
                                                      'Texto: Tem certeza de que deseja resgatar este perfil de negócio? Ao confirmar, você se tornará o administrador deste perfil e poderá atualizar informações, gerenciar conteúdo e interagir com clientes. Essa ação é permanente e só pode ser desfeita com solicitação ao suporte.',
                                                  tipoAlerta:
                                                      TipoAlerta.alerta.name,
                                                  tituloBotao:
                                                      'Confirmar Resgate',
                                                  acao: () async {
                                                    await widget!
                                                        .documentoRefAnunciante!
                                                        .reference
                                                        .update(
                                                            createAnuncianteRecordData(
                                                      anuncianteUser:
                                                          currentUserReference,
                                                      planoAssinatura:
                                                          PlanoAssinatura
                                                              .meencontra.name,
                                                      resgatado: true,
                                                    ));

                                                    context.pushNamed(
                                                      'painelAdministrativo',
                                                      queryParameters: {
                                                        'documentoRefAnunciante':
                                                            serializeParam(
                                                          widget!
                                                              .documentoRefAnunciante,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'documentoRefAnunciante':
                                                            widget!
                                                                .documentoRefAnunciante,
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    actionWhatsapp: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');

                                      await widget!
                                          .documentoRefAnunciante!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'ConversasWhatsapp':
                                                FieldValue.increment(1.0),
                                          },
                                        ),
                                      });
                                      await launchURL(widget!
                                          .documentoRefAnunciante!
                                          .whatsComercial);
                                    },
                                    actionInstagram: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      await launchURL(widget!
                                          .documentoRefAnunciante!.instagram);
                                    },
                                    actionFacebook: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      await launchURL(widget!
                                          .documentoRefAnunciante!.facebook);
                                    },
                                    actionMap: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      _model.saidaEndereco =
                                          await queryEnderecoRecordOnce(
                                        parent: widget!
                                            .documentoRefAnunciante?.reference,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x65000000),
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: MapGoogleWidget(
                                                  google: _model.saidaEndereco!
                                                      .googleMaps!,
                                                  endereco: _model.saidaEndereco
                                                      ?.enderecoCompleto,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      safeSetState(() {});
                                    },
                                    actionLigar: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');

                                      await widget!
                                          .documentoRefAnunciante!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'Ligacaoes':
                                                FieldValue.increment(1.0),
                                          },
                                        ),
                                      });
                                      await launchUrl(Uri(
                                        scheme: 'tel',
                                        path: widget!.documentoRefAnunciante!
                                            .telefoneFixo,
                                      ));
                                    },
                                    actionComentarios: () async {
                                      logFirebaseEvent(
                                          'ANUNCIANTE_Container_s8v87fah_CALLBACK');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x76000000),
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: AvaliacoesWidget(
                                                  anunciante: widget!
                                                      .documentoRefAnunciante!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: StreamBuilder<List<AnuncianteRecord>>(
                                  stream: queryAnuncianteRecord(),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              FFAppConstants.paddingMobile,
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
                                                        resgatado: false,
                                                      );
                                                    }).divide(
                                                        SizedBox(width: 12.0)),
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
          ),
        ));
  }
}
