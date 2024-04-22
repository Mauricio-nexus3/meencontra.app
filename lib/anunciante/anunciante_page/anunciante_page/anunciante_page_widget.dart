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
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
        parent: widget.documentoRefAnunciante?.reference,
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
          isEqualTo: widget.documentoRefAnunciante?.reference,
        ),
      );
      setState(() {
        FFAppState().corSelecionadaAnunciante = valueOrDefault<Color>(
          widget.documentoRefAnunciante?.cor,
          FlutterFlowTheme.of(context).primary,
        );
        FFAppState().templeteLayoutSelecionado = valueOrDefault<String>(
          widget.documentoRefAnunciante?.templeteLayout,
          'padrão',
        );
        FFAppState().qntdItensCarrinho = _model.totaldeItensNoCarrinho!.length;
      });
      setState(() {
        _model.mostrarPerfil = true;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ProdutoRecord>>(
      future: queryProdutoRecordOnce(
        parent: widget.documentoRefAnunciante?.reference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<ProdutoRecord> anunciantePageProdutoRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Visibility(
              visible: widget.documentoRefAnunciante?.aid ==
                  valueOrDefault(currentUserDocument?.iDUser, ''),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton(
                  onPressed: () async {
                    logFirebaseEvent(
                        'ANUNCIANTE_FloatingActionButton_pli7he5y');

                    context.pushNamed('Feed');
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  elevation: 8.0,
                  child: Icon(
                    FFIcons.khomeOFFStroke,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.menuDashAnuncianteModel2,
                        updateCallback: () => setState(() {}),
                        child: MenuDashAnuncianteWidget(
                          paginaAtual: 'paginaAnunciante',
                          anuncianteDoc: widget.documentoRefAnunciante!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<int>(
                future: queryCarrinhoDeComprasUsuarioRecordCount(
                  parent: currentUserReference,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF622AE2),
                          ),
                        ),
                      ),
                    );
                  }
                  int containerPrincipalCount = snapshot.data!;
                  return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 0.8,
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  if ((valueOrDefault<String>(
                                            widget.documentoRefAnunciante?.aid,
                                            'Nome Fantasia',
                                          ) ==
                                          valueOrDefault(
                                              currentUserDocument?.iDUser,
                                              '')) ||
                                      (widget.documentoRefAnunciante
                                              ?.emailUsuarioAdm ==
                                          currentUserEmail)) {
                                    return Container(
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x4DFFFFFF),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FlutterFlowIconButton(
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.format_align_left,
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .corSelecionadaAnunciante,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'ANUNCIANTE_format_align_left_ICN_ON_TAP');
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                            ),
                                            Text(
                                              'Meu perfil',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            Container(
                                              width: 30.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 4.0, 20.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'ANUNCIANTE_PAGE_PAGE_voltar_ON_TAP');
                                                context.safePop();
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                        .corSelecionadaAnunciante,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_back_ios_new,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    icon: Icon(
                                                      Icons.share_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ANUNCIANTE_share_outlined_ICN_ON_TAP');
                                                      // Alterar para bottosheet depois essa função
                                                      if (loggedIn == true) {
                                                        _model.currentPageLink =
                                                            await generateCurrentPageLink(
                                                          context,
                                                          title:
                                                              'Serviço ${valueOrDefault<String>(
                                                            widget
                                                                .documentoRefAnunciante
                                                                ?.nomeFantasia,
                                                            'Nome Fantasia',
                                                          )}',
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            widget
                                                                .documentoRefAnunciante
                                                                ?.logo,
                                                            'Nome Fantasia',
                                                          ),
                                                          description: widget
                                                              .documentoRefAnunciante
                                                              ?.descricao,
                                                        );

                                                        await launchURL(_model
                                                            .currentPageLink);
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UsarDeslogadoUsoExclusivoCompWidget(
                                                                    usoExclusivo:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                  ),
                                                  if ((valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.isAnunciante,
                                                              false) ==
                                                          false) &&
                                                      (valueOrDefault<String>(
                                                            widget
                                                                .documentoRefAnunciante
                                                                ?.planoAssinatura,
                                                            'Nome Fantasia',
                                                          ) ==
                                                          'gratis') &&
                                                      (widget.documentoRefAnunciante
                                                              ?.resgatado ==
                                                          false))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            valueOrDefault<
                                                                Color>(
                                                          FFAppState()
                                                              .corSelecionadaAnunciante,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            valueOrDefault<
                                                                Color>(
                                                          FFAppState()
                                                              .corSelecionadaAnunciante,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        icon: Icon(
                                                          FFIcons.kresgatar,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ANUNCIANTE_PAGE_PAGE_resgatar_ICN_ON_TAP');
                                                          if (loggedIn ==
                                                              true) {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Resgatar o meu negócio'),
                                                                            content:
                                                                                Text('Você é o proprietário ou responsável deste estabelecimento? Ao confirmar, você terá controle total sobre o perfil, incluindo atualizações e personalizações. '),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Não, não sou'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Sim, Resgatar'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              context.pushNamed(
                                                                'Pagamento',
                                                                queryParameters:
                                                                    {
                                                                  'anuncianteRef':
                                                                      serializeParam(
                                                                    widget
                                                                        .documentoRefAnunciante
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'planoAssinatura':
                                                                      serializeParam(
                                                                    widget
                                                                        .documentoRefAnunciante
                                                                        ?.planoAssinatura,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'nomeFantasia':
                                                                      serializeParam(
                                                                    widget
                                                                        .documentoRefAnunciante
                                                                        ?.nomeFantasia,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              return;
                                                            }
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          UsarDeslogadoUsoExclusivoCompWidget(
                                                                        usoExclusivo:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  if (widget
                                                          .documentoRefAnunciante
                                                          ?.temCarrinho ==
                                                      true)
                                                    AlignedTooltip(
                                                      content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            'Resgatar estabele',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          )),
                                                      offset: 4.0,
                                                      preferredDirection:
                                                          AxisDirection.down,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      elevation: 4.0,
                                                      tailBaseWidth: 24.0,
                                                      tailLength: 12.0,
                                                      waitDuration: Duration(
                                                          milliseconds: 100),
                                                      showDuration: Duration(
                                                          milliseconds: 1500),
                                                      triggerMode:
                                                          TooltipTriggerMode
                                                              .tap,
                                                      child: Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ANUNCIANTE_Badge_8gvrgt64_ON_TAP');
                                                            if (loggedIn ==
                                                                true) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            PopupEnviarPedidoWidget(
                                                                          anunciante:
                                                                              widget.documentoRefAnunciante,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            } else {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            UsarDeslogadoUsoExclusivoCompWidget(
                                                                          usoExclusivo:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            }
                                                          },
                                                          child: badges.Badge(
                                                            badgeContent: Text(
                                                              containerPrincipalCount
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            showBadge: true,
                                                            shape: badges
                                                                .BadgeShape
                                                                .circle,
                                                            badgeColor:
                                                                valueOrDefault<
                                                                    Color>(
                                                              widget
                                                                  .documentoRefAnunciante
                                                                  ?.cor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                            elevation: 4.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            position: badges
                                                                    .BadgePosition
                                                                .topEnd(),
                                                            animationType: badges
                                                                .BadgeAnimationType
                                                                .scale,
                                                            toAnimate: true,
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState()
                                                                    .corSelecionadaAnunciante,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState()
                                                                    .corSelecionadaAnunciante,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .shopping_cart_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (((valueOrDefault<String>(
                                              widget
                                                  .documentoRefAnunciante?.aid,
                                              'Nome Fantasia',
                                            ) ==
                                            valueOrDefault(
                                                currentUserDocument?.iDUser,
                                                '')) ||
                                        (widget.documentoRefAnunciante
                                                ?.emailUsuarioAdm ==
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
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                        ),
                                        child: wrapWithModel(
                                          model:
                                              _model.menuDashAnuncianteModel1,
                                          updateCallback: () => setState(() {}),
                                          child: MenuDashAnuncianteWidget(
                                            paginaAtual: 'paginaAnunciante',
                                            anuncianteDoc:
                                                widget.documentoRefAnunciante!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  kBreakpointSmall
                                              ? 32.0
                                              : 0.0,
                                          0.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width >
                                                  kBreakpointSmall
                                              ? 32.0
                                              : 0.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width >=
                                                    1020.0) {
                                                  return 124.0;
                                                } else if ((MediaQuery.sizeOf(
                                                                context)
                                                            .width >=
                                                        1020.0) &&
                                                    (FFAppState()
                                                            .EsconderDaTela ==
                                                        true)) {
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
                                                if (MediaQuery.sizeOf(context)
                                                        .width >=
                                                    1020.0) {
                                                  return 124.0;
                                                } else if ((MediaQuery.sizeOf(
                                                                context)
                                                            .width >=
                                                        1020.0) &&
                                                    (FFAppState()
                                                            .EsconderDaTela ==
                                                        true)) {
                                                  return 0.0;
                                                } else {
                                                  return 0.0;
                                                }
                                              }(),
                                              0.0,
                                            ),
                                            0.0),
                                        child:
                                            FutureBuilder<List<AnunciosRecord>>(
                                          future: queryAnunciosRecordOnce(
                                            parent: widget
                                                .documentoRefAnunciante
                                                ?.reference,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xFF622AE2),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AnunciosRecord>
                                                containerAnunciosRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: 393.0,
                                              constraints: BoxConstraints(
                                                minWidth: 363.0,
                                                maxWidth: 480.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        1.0, 0.0, 1.0, 4.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .templeteAnuncianteModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      TempleteAnuncianteWidget(
                                                    documentoAnunciante: widget
                                                        .documentoRefAnunciante!,
                                                    produtosDoc:
                                                        anunciantePageProdutoRecordList,
                                                    anuncios:
                                                        containerAnunciosRecordList,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
