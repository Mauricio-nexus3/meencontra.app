import '/anunciante/new_componentes/grid_produto/grid_produto_widget.dart';
import '/anunciante/new_componentes/popup_enviar_pedido/popup_enviar_pedido_widget.dart';
import '/anunciante/new_componentes/popup_esvaziar_carrinho/popup_esvaziar_carrinho_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/usar_deslogado_uso_exclusivo_comp/usar_deslogado_uso_exclusivo_comp_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'detalhes_produto_model.dart';
export 'detalhes_produto_model.dart';

class DetalhesProdutoWidget extends StatefulWidget {
  const DetalhesProdutoWidget({
    super.key,
    required this.detalhesProduto,
    required this.anunciante,
    this.carrinhoDeComprasUsuarioDoc,
  });

  final ProdutoRecord? detalhesProduto;
  final AnuncianteRecord? anunciante;
  final CarrinhoDeComprasUsuarioRecord? carrinhoDeComprasUsuarioDoc;

  @override
  State<DetalhesProdutoWidget> createState() => _DetalhesProdutoWidgetState();
}

class _DetalhesProdutoWidgetState extends State<DetalhesProdutoWidget>
    with TickerProviderStateMixin {
  late DetalhesProdutoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesProdutoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.detalhesProduto!.reference.update({
        ...mapToFirestore(
          {
            'numeroVisualizacoes': FieldValue.increment(1.0),
          },
        ),
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

    return StreamBuilder<List<CarrinhoDeComprasUsuarioRecord>>(
      stream: queryCarrinhoDeComprasUsuarioRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF622AE2),
                  ),
                ),
              ),
            ),
          );
        }
        List<CarrinhoDeComprasUsuarioRecord>
            detalhesProdutoCarrinhoDeComprasUsuarioRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: MediaQuery.sizeOf(context).width > 500.0
              ? PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    actions: [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              buttonSize: 48.0,
                              icon: Icon(
                                FFIcons.karrowBack,
                                color: valueOrDefault<Color>(
                                  FFAppState().corSelecionadaAnunciante,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(
                                  'AnuncianteCopy',
                                  queryParameters: {
                                    'documentoRefAnunciante': serializeParam(
                                      widget.anunciante,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'documentoRefAnunciante': widget.anunciante,
                                  },
                                );
                              },
                            ),
                            Text(
                              'Detalhes',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: valueOrDefault<Color>(
                                      FFAppState().corSelecionadaAnunciante,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (loggedIn == true) {
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
                                            child: PopupEnviarPedidoWidget(
                                              anunciante: widget.anunciante,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child:
                                                UsarDeslogadoUsoExclusivoCompWidget(
                                              usoExclusivo: true,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: badges.Badge(
                                  badgeContent: Text(
                                    valueOrDefault<String>(
                                      detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                          .length
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                  showBadge: true,
                                  shape: badges.BadgeShape.circle,
                                  badgeColor: valueOrDefault<Color>(
                                    FFAppState().corSelecionadaAnunciante,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  elevation: 2.0,
                                  padding: EdgeInsets.all(8.0),
                                  position: badges.BadgePosition.topEnd(),
                                  animationType:
                                      badges.BadgeAnimationType.scale,
                                  toAnimate: true,
                                  child: Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 48.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: valueOrDefault<Color>(
                                          FFAppState().corSelecionadaAnunciante,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        if (loggedIn == true) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child:
                                                      PopupEnviarPedidoWidget(
                                                    anunciante:
                                                        widget.anunciante,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      UsarDeslogadoUsoExclusivoCompWidget(
                                                    usoExclusivo: true,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      centerTitle: true,
                      expandedTitleScale: 1.0,
                    ),
                    elevation: 0.8,
                  ),
                )
              : null,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Wrap(
                      spacing: 24.0,
                      runSpacing: 12.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 500.0,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width < 400.0
                                ? MediaQuery.sizeOf(context).width
                                : valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width,
                                    500.0,
                                  ),
                          ),
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width >
                                              kBreakpointSmall
                                          ? 32.0
                                          : 0.0,
                                      0.0,
                                    ),
                                    0.0,
                                    0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 350.0,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height * 0.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDBE2E7),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final imagensProduto = widget
                                              .detalhesProduto?.imagensProduto
                                              ?.toList() ??
                                          [];
                                      return Container(
                                        width: double.infinity,
                                        height: 250.0,
                                        child: Stack(
                                          children: [
                                            PageView.builder(
                                              controller:
                                                  _model.pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              imagensProduto
                                                                      .length -
                                                                  1)),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: imagensProduto.length,
                                              itemBuilder: (context,
                                                  imagensProdutoIndex) {
                                                final imagensProdutoItem =
                                                    imagensProduto[
                                                        imagensProdutoIndex];
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    imagensProdutoItem,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              imagensProduto
                                                                      .length -
                                                                  1)),
                                                  count: imagensProduto.length,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) async {
                                                    await _model
                                                        .pageViewController!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .ExpandingDotsEffect(
                                                    expansionFactor: 2.0,
                                                    spacing: 8.0,
                                                    radius: 16.0,
                                                    dotWidth: 8.0,
                                                    dotHeight: 8.0,
                                                    dotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    activeDotColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.chevron_left_sharp,
                                          color: valueOrDefault<Color>(
                                            FFAppState()
                                                .corSelecionadaAnunciante,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            'AnuncianteCopy',
                                            queryParameters: {
                                              'documentoRefAnunciante':
                                                  serializeParam(
                                                widget.anunciante,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'documentoRefAnunciante':
                                                  widget.anunciante,
                                            },
                                          );
                                        },
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (loggedIn == true) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          PopupEnviarPedidoWidget(
                                                        anunciante:
                                                            widget.anunciante,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          UsarDeslogadoUsoExclusivoCompWidget(
                                                        usoExclusivo: true,
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
                                                detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                                    .length
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                            showBadge: true,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor: valueOrDefault<Color>(
                                              FFAppState()
                                                  .corSelecionadaAnunciante,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            elevation: 2.0,
                                            padding: EdgeInsets.all(8.0),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 48.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: valueOrDefault<Color>(
                                                    FFAppState()
                                                        .corSelecionadaAnunciante,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  if (loggedIn == true) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
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
                                                                PopupEnviarPedidoWidget(
                                                              anunciante: widget
                                                                  .anunciante,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
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
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 500.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.detalhesProduto?.nomeProduto,
                                        'nome',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState()
                                              .nomesProdutosCarrinhoUsuer = [];
                                        });
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            widget.detalhesProduto?.valorVenda,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.commaDecimal,
                                            currency: 'R\$',
                                          ),
                                          '1.000,00',
                                        ),
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
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.detalhesProduto?.nomeDaCategoria,
                                        'Categoria',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'DESCRIÇÃO',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget
                                            .detalhesProduto?.descricaoProduto,
                                        'Descrição',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            if (FFAppState()
                                                    .qntdItensCarrinho >=
                                                1) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          PopupEnviarPedidoWidget(
                                                        anunciante:
                                                            widget.anunciante,
                                                        carrinhoDeComprasUsuarioRef:
                                                            widget
                                                                .carrinhoDeComprasUsuarioDoc,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title:
                                                          Text('abrir whtaspp'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          text: 'Realizar pedido',
                                          icon: FaIcon(
                                            FontAwesomeIcons.whatsapp,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 45.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: valueOrDefault<Color>(
                                              FFAppState()
                                                  .corSelecionadaAnunciante,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if ((detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                                      .first.anuncianteRef !=
                                                  widget
                                                      .anunciante?.reference) &&
                                              (detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                                      .length >=
                                                  1)) {
                                            return Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              PopupEsvaziarCarrinhoWidget(
                                                            anunciante: widget
                                                                .anunciante!,
                                                            carrinhoDeComprasUsuarioRef:
                                                                widget
                                                                    .carrinhoDeComprasUsuarioDoc,
                                                            novoItem: widget
                                                                .detalhesProduto!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                text:
                                                    'Carrinho cheio: esvaziar',
                                                icon: Icon(
                                                  Icons
                                                      .remove_shopping_cart_rounded,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 45.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget
                                                              .anunciante?.cor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          } else if ((detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                                      .first.anuncianteRef ==
                                                  widget
                                                      .anunciante?.reference) &&
                                              (detalhesProdutoCarrinhoDeComprasUsuarioRecordList
                                                      .length ==
                                                  5)) {
                                            return Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              PopupEnviarPedidoWidget(
                                                            anunciante: widget
                                                                .anunciante,
                                                            carrinhoDeComprasUsuarioRef:
                                                                widget
                                                                    .carrinhoDeComprasUsuarioDoc,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                text: 'Seu carrinho cheio',
                                                icon: Icon(
                                                  Icons
                                                      .remove_shopping_cart_rounded,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 45.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget
                                                              .anunciante?.cor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .corSelecionadaAnunciante,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Visibility(
                                              visible: FFAppState()
                                                      .qntdItensCarrinho <
                                                  5,
                                              child: Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    if (loggedIn == true) {
                                                      if (FFAppState()
                                                              .qntdItensCarrinho >=
                                                          1) {
                                                        if (FFAppState()
                                                            .nomesProdutosCarrinhoUsuer
                                                            .contains(widget
                                                                .detalhesProduto
                                                                ?.nomeProduto)) {
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
                                                                              Text('Esse item já consta em seu carrinho'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Continuar comprando'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Ir para o carrinho'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
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
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        PopupEnviarPedidoWidget(
                                                                      anunciante:
                                                                          widget
                                                                              .anunciante,
                                                                      carrinhoDeComprasUsuarioRef:
                                                                          widget
                                                                              .carrinhoDeComprasUsuarioDoc,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            return;
                                                          } else {
                                                            return;
                                                          }
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .addToNomesProdutosCarrinhoUsuer(widget
                                                                    .detalhesProduto!
                                                                    .nomeProduto);
                                                            FFAppState()
                                                                    .qntdItensCarrinho =
                                                                FFAppState()
                                                                        .qntdItensCarrinho +
                                                                    1;
                                                          });
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'produto adicionado ao carrinho',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );

                                                          await CarrinhoDeComprasUsuarioRecord
                                                                  .createDoc(
                                                                      currentUserReference!)
                                                              .set(
                                                                  createCarrinhoDeComprasUsuarioRecordData(
                                                            anuncianteRef:
                                                                widget
                                                                    .anunciante
                                                                    ?.reference,
                                                            produtoRef: widget
                                                                .detalhesProduto
                                                                ?.reference,
                                                            nomeProduto:
                                                                valueOrDefault<
                                                                    String>(
                                                              widget
                                                                  .detalhesProduto
                                                                  ?.nomeProduto,
                                                              'nome',
                                                            ),
                                                            nomeFantasiaAnunciante:
                                                                widget
                                                                    .anunciante
                                                                    ?.nomeFantasia,
                                                            quantidadeProduto:
                                                                1,
                                                            valorUnitario: widget
                                                                .detalhesProduto
                                                                ?.valorVenda,
                                                          ));
                                                          if (FFAppState()
                                                                  .qntdItensCarrinho ==
                                                              3) {
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
                                                                                Text('Carrinho quase cheio'),
                                                                            content:
                                                                                Text('Você já possui 3 itens no seu carrinho do limite de 5'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Continuar comprando'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Ir para o carrinho'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
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
                                                                          PopupEnviarPedidoWidget(
                                                                        anunciante:
                                                                            widget.anunciante,
                                                                        carrinhoDeComprasUsuarioRef:
                                                                            widget.carrinhoDeComprasUsuarioDoc,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              return;
                                                            }
                                                          } else if (FFAppState()
                                                                  .qntdItensCarrinho ==
                                                              5) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    title: Text(
                                                                        'Carrinho cheio'),
                                                                    content: Text(
                                                                        'Você já possui 5 itens no carrinho'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ir para o carrinho'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
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
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        PopupEnviarPedidoWidget(
                                                                      anunciante:
                                                                          widget
                                                                              .anunciante,
                                                                      carrinhoDeComprasUsuarioRef:
                                                                          widget
                                                                              .carrinhoDeComprasUsuarioDoc,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            return;
                                                          }
                                                        }
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                              .addToNomesProdutosCarrinhoUsuer(widget
                                                                  .detalhesProduto!
                                                                  .nomeProduto);
                                                          FFAppState()
                                                                  .qntdItensCarrinho =
                                                              FFAppState()
                                                                      .qntdItensCarrinho +
                                                                  1;
                                                        });

                                                        await CarrinhoDeComprasUsuarioRecord
                                                                .createDoc(
                                                                    currentUserReference!)
                                                            .set(
                                                                createCarrinhoDeComprasUsuarioRecordData(
                                                          anuncianteRef: widget
                                                              .anunciante
                                                              ?.reference,
                                                          produtoRef: widget
                                                              .detalhesProduto
                                                              ?.reference,
                                                          nomeProduto:
                                                              valueOrDefault<
                                                                  String>(
                                                            widget
                                                                .detalhesProduto
                                                                ?.nomeProduto,
                                                            'nome',
                                                          ),
                                                          nomeFantasiaAnunciante:
                                                              widget.anunciante
                                                                  ?.nomeFantasia,
                                                          quantidadeProduto: 1,
                                                          valorUnitario: widget
                                                              .detalhesProduto
                                                              ?.valorVenda,
                                                        ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'produto adicionado ao carrinho',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
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
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      return;
                                                    }
                                                  },
                                                  text: 'Adicionar ao carrinho',
                                                  icon: Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 45.0,
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            widget.anunciante
                                                                ?.cor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .corSelecionadaAnunciante,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Veja mais produtos',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'AnuncianteCopy',
                                          queryParameters: {
                                            'documentoRefAnunciante':
                                                serializeParam(
                                              widget.anunciante,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'documentoRefAnunciante':
                                                widget.anunciante,
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Ver todos',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: StreamBuilder<List<ProdutoRecord>>(
                                    stream: queryProdutoRecord(
                                      parent: widget.anunciante?.reference,
                                      queryBuilder: (produtoRecord) =>
                                          produtoRecord.where(
                                        'NomeProduto',
                                        isNotEqualTo:
                                            widget.detalhesProduto?.nomeProduto,
                                      ),
                                      limit: 8,
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
                                      List<ProdutoRecord>
                                          listViewProdutoRecordList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            listViewProdutoRecordList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 12.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewProdutoRecord =
                                              listViewProdutoRecordList[
                                                  listViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'DetalhesProduto',
                                                queryParameters: {
                                                  'detalhesProduto':
                                                      serializeParam(
                                                    listViewProdutoRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'anunciante': serializeParam(
                                                    widget.anunciante,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'detalhesProduto':
                                                      listViewProdutoRecord,
                                                  'anunciante':
                                                      widget.anunciante,
                                                },
                                              );
                                            },
                                            child: GridProdutoWidget(
                                              key: Key(
                                                  'Keykpl_${listViewIndex}_of_${listViewProdutoRecordList.length}'),
                                              titulo: listViewProdutoRecord
                                                  .nomeProduto,
                                              valor: listViewProdutoRecord
                                                  .valorVenda,
                                              img: listViewProdutoRecord
                                                  .imagensProduto
                                                  .take(1)
                                                  .toList(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .around(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
