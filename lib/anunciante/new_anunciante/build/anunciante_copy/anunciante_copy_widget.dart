import '/anunciante/new_anunciante/build/templete_anunciante/templete_anunciante_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/anunciante/new_componentes/popup_enviar_pedido/popup_enviar_pedido_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'anunciante_copy_model.dart';
export 'anunciante_copy_model.dart';

class AnuncianteCopyWidget extends StatefulWidget {
  const AnuncianteCopyWidget({
    super.key,
    required this.documentoRefAnunciante,
  });

  final AnuncianteRecord? documentoRefAnunciante;

  @override
  State<AnuncianteCopyWidget> createState() => _AnuncianteCopyWidgetState();
}

class _AnuncianteCopyWidgetState extends State<AnuncianteCopyWidget> {
  late AnuncianteCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnuncianteCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryCarrinhoDeComprasUsuarioRecordCount(
        parent: currentUserReference,
      ),
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
        int anuncianteCopyCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: widget.documentoRefAnunciante?.aid ==
                  valueOrDefault(currentUserDocument?.iDUser, ''),
              child: AuthUserStreamWidget(
                builder: (context) => FloatingActionButton(
                  onPressed: () async {
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
                        model: _model.newDashAnuncianteModel2,
                        updateCallback: () => setState(() {}),
                        child: NewDashAnuncianteWidget(
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
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            if (valueOrDefault<String>(
                                  widget.documentoRefAnunciante?.aid,
                                  'Nome Fantasia',
                                ) ==
                                valueOrDefault(
                                    currentUserDocument?.iDUser, '')) {
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
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Text(
                                        'Meu perfil',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .corSelecionadaAnunciante,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
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
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('testeAtual');
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
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_back_ios_new,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor: valueOrDefault<Color>(
                                                FFAppState()
                                                    .corSelecionadaAnunciante,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              icon: Icon(
                                                Icons.share_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
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
                                                        valueOrDefault<String>(
                                                      widget
                                                          .documentoRefAnunciante
                                                          ?.logo,
                                                      'Nome Fantasia',
                                                    ),
                                                    description: widget
                                                        .documentoRefAnunciante
                                                        ?.descricao,
                                                  );

                                                  await launchURL(
                                                      _model.currentPageLink);
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
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
                                                      safeSetState(() {}));
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
                                                      valueOrDefault<Color>(
                                                    FFAppState()
                                                        .corSelecionadaAnunciante,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      valueOrDefault<Color>(
                                                    FFAppState()
                                                        .corSelecionadaAnunciante,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  icon: Icon(
                                                    FFIcons.kresgatar,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (loggedIn == true) {
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
                                                                      title: Text(
                                                                          'Resgatar o meu negócio'),
                                                                      content: Text(
                                                                          'Você é o proprietário ou responsável deste estabelecimento? Ao confirmar, você terá controle total sobre o perfil, incluindo atualizações e personalizações. '),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Não, não sou'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Sim, Resgatar'),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        context.pushNamed(
                                                          'PagamentoInterno',
                                                          queryParameters: {
                                                            'anuncianteREF':
                                                                serializeParam(
                                                              widget
                                                                  .documentoRefAnunciante
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
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
                                                            Colors.transparent,
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
                                                                      .requestFocus(
                                                                          _model
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
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                ),
                                              ),
                                            AlignedTooltip(
                                              content: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'Resgatar estabele',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  )),
                                              offset: 4.0,
                                              preferredDirection:
                                                  AxisDirection.down,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              tailBaseWidth: 24.0,
                                              tailLength: 12.0,
                                              waitDuration:
                                                  Duration(milliseconds: 100),
                                              showDuration:
                                                  Duration(milliseconds: 1500),
                                              triggerMode:
                                                  TooltipTriggerMode.tap,
                                              child: Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (loggedIn == true) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
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
                                                                child:
                                                                    PopupEnviarPedidoWidget(
                                                                  anunciante: widget
                                                                      .documentoRefAnunciante,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
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
                                                                      .requestFocus(
                                                                          _model
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
                                                          safeSetState(() {}));
                                                    }
                                                  },
                                                  child: badges.Badge(
                                                    badgeContent: Text(
                                                      valueOrDefault<String>(
                                                        anuncianteCopyCount
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    showBadge: true,
                                                    shape: badges
                                                        .BadgeShape.circle,
                                                    badgeColor:
                                                        valueOrDefault<Color>(
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
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    position: badges
                                                        .BadgePosition.topEnd(),
                                                    animationType: badges
                                                        .BadgeAnimationType
                                                        .scale,
                                                    toAnimate: true,
                                                    child:
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
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
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
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.newDashAnuncianteModel1,
                                    updateCallback: () => setState(() {}),
                                    child: NewDashAnuncianteWidget(
                                      paginaAtual: 'paginaAnunciante',
                                      anuncianteDoc:
                                          widget.documentoRefAnunciante!,
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
                                  child: Container(
                                    width: 393.0,
                                    constraints: BoxConstraints(
                                      minWidth: 363.0,
                                      maxWidth: 480.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          1.0, 0.0, 1.0, 4.0),
                                      child: wrapWithModel(
                                        model: _model.templeteAnuncianteModel,
                                        updateCallback: () => setState(() {}),
                                        child: TempleteAnuncianteWidget(
                                          documentoAnunciante:
                                              widget.documentoRefAnunciante!,
                                        ),
                                      ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
