import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'popup_enviar_pedido_model.dart';
export 'popup_enviar_pedido_model.dart';

class PopupEnviarPedidoWidget extends StatefulWidget {
  const PopupEnviarPedidoWidget({
    super.key,
    this.anunciante,
    this.carrinhoDeComprasUsuarioRef,
  });

  final AnuncianteRecord? anunciante;
  final CarrinhoDeComprasUsuarioRecord? carrinhoDeComprasUsuarioRef;

  @override
  State<PopupEnviarPedidoWidget> createState() =>
      _PopupEnviarPedidoWidgetState();
}

class _PopupEnviarPedidoWidgetState extends State<PopupEnviarPedidoWidget>
    with TickerProviderStateMixin {
  late PopupEnviarPedidoModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 800.ms,
          duration: 600.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupEnviarPedidoModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 6.0,
        ),
        child: StreamBuilder<List<CarrinhoDeComprasUsuarioRecord>>(
          stream: queryCarrinhoDeComprasUsuarioRecord(
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
            List<CarrinhoDeComprasUsuarioRecord>
                containerCarrinhoDeComprasUsuarioRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x4D000000),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 530.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x19000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (containerCarrinhoDeComprasUsuarioRecordList
                                    .length >=
                                1) {
                              return Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enviar pedido ao responsável',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation1']!),
                                        Text(
                                          'Segue a lista de itens do seu pedido:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation2']!),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final containerVar =
                                            containerCarrinhoDeComprasUsuarioRecordList
                                                .toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: containerVar.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 4.0),
                                          itemBuilder:
                                              (context, containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x20000000),
                                                    offset: Offset(0.0, 1.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 12.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              containerVarItem
                                                                  .nomeProduto,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              formatNumber(
                                                                containerVarItem
                                                                    .valorUnitario,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .commaDecimal,
                                                                currency: 'R\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (containerVarItem
                                                                        .quantidadeProduto <=
                                                                    1) {
                                                                  await containerVarItem
                                                                      .reference
                                                                      .delete();
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .qntdItensCarrinho = -1;
                                                                    FFAppState()
                                                                        .removeFromNomesProdutosCarrinhoUsuer(
                                                                            containerVarItem.nomeProduto);
                                                                  });
                                                                } else {
                                                                  await containerVarItem
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'quantidadeProduto':
                                                                            FieldValue.increment(-(1)),
                                                                      },
                                                                    ),
                                                                  });
                                                                }
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (containerVarItem
                                                                          .quantidadeProduto <=
                                                                      1)
                                                                    Icon(
                                                                      FFIcons
                                                                          .ktrashOutline,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          16.0,
                                                                    ),
                                                                  if (containerVarItem
                                                                          .quantidadeProduto >=
                                                                      2)
                                                                    FaIcon(
                                                                      FontAwesomeIcons
                                                                          .minus,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              containerVarItem
                                                                  .quantidadeProduto
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await containerVarItem
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'quantidadeProduto':
                                                                          FieldValue.increment(
                                                                              1),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .plus,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!);
                                          },
                                        );
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Observações',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation3']!),
                                        TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Observações',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: valueOrDefault<Color>(
                                                  widget.anunciante?.cor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: 3,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Próximos passos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation4']!),
                                        Text(
                                          'Confirme o pedido e você será redirecionado para o WhatsApp do(a) ${widget.anunciante?.nomeFantasia}.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation5']!),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.listaProdutosCarrinho =
                                              await queryCarrinhoDeComprasUsuarioRecordOnce(
                                            parent: currentUserReference,
                                          );

                                          var pedidoWhatsappRecordReference =
                                              PedidoWhatsappRecord.createDoc(
                                                  widget.anunciante!.reference);
                                          await pedidoWhatsappRecordReference
                                              .set({
                                            ...createPedidoWhatsappRecordData(
                                              usuarioRef: currentUserReference,
                                              nomeUsuario:
                                                  currentUserDisplayName,
                                              emailUsuario: currentUserEmail,
                                              whatsapp: valueOrDefault(
                                                  currentUserDocument?.whatsapp,
                                                  ''),
                                              codigoPedido:
                                                  random_data.randomString(
                                                5,
                                                10,
                                                false,
                                                false,
                                                true,
                                              ),
                                              pedido: () {
                                                if (_model.listaProdutosCarrinho
                                                        ?.length ==
                                                    1) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    2) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    3) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    4) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    5) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.nomeProduto}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}, ${_model.listaProdutosCarrinho?[4]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[4]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    6) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}, ${_model.listaProdutosCarrinho?[4]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[4]?.nomeProduto}, ${_model.listaProdutosCarrinho?[5]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[5]?.nomeProduto}';
                                                } else {
                                                  return '${_model.listaProdutosCarrinho?.first?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?.first?.nomeProduto}';
                                                }
                                              }(),
                                              observacaoPedido:
                                                  _model.textController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'horarioPedido': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.novoPedidoWhatsappAnunciante =
                                              PedidoWhatsappRecord
                                                  .getDocumentFromData({
                                            ...createPedidoWhatsappRecordData(
                                              usuarioRef: currentUserReference,
                                              nomeUsuario:
                                                  currentUserDisplayName,
                                              emailUsuario: currentUserEmail,
                                              whatsapp: valueOrDefault(
                                                  currentUserDocument?.whatsapp,
                                                  ''),
                                              codigoPedido:
                                                  random_data.randomString(
                                                5,
                                                10,
                                                false,
                                                false,
                                                true,
                                              ),
                                              pedido: () {
                                                if (_model.listaProdutosCarrinho
                                                        ?.length ==
                                                    1) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    2) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    3) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    4) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    5) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.nomeProduto}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}, ${_model.listaProdutosCarrinho?[4]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[4]?.nomeProduto}';
                                                } else if (_model
                                                        .listaProdutosCarrinho
                                                        ?.length ==
                                                    6) {
                                                  return '${_model.listaProdutosCarrinho?[0]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[0]?.nomeProduto}, ${_model.listaProdutosCarrinho?[1]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[1]?.nomeProduto}, ${_model.listaProdutosCarrinho?[2]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[2]?.nomeProduto}, ${_model.listaProdutosCarrinho?[3]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[3]?.nomeProduto}, ${_model.listaProdutosCarrinho?[4]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[4]?.nomeProduto}, ${_model.listaProdutosCarrinho?[5]?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?[5]?.nomeProduto}';
                                                } else {
                                                  return '${_model.listaProdutosCarrinho?.first?.quantidadeProduto?.toString()}x ${_model.listaProdutosCarrinho?.first?.nomeProduto}';
                                                }
                                              }(),
                                              observacaoPedido:
                                                  _model.textController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'horarioPedido': DateTime.now(),
                                              },
                                            ),
                                          }, pedidoWhatsappRecordReference);
                                          setState(() {
                                            FFAppState().qntdItensCarrinho =
                                                _model.listaProdutosCarrinho!
                                                        .length -
                                                    1;
                                          });
                                          while (
                                              FFAppState().qntdItensCarrinho >
                                                  0) {
                                            await _model
                                                .listaProdutosCarrinho![
                                                    FFAppState()
                                                        .qntdItensCarrinho]
                                                .reference
                                                .delete();
                                            setState(() {
                                              FFAppState().qntdItensCarrinho =
                                                  FFAppState()
                                                          .qntdItensCarrinho +
                                                      -1;
                                            });
                                          }
                                          setState(() {
                                            FFAppState()
                                                .nomesProdutosCarrinhoUsuer = [];
                                            FFAppState().qntdItensCarrinho = 0;
                                          });
                                          // esse irá excluir o último documento da lista de do carrinho do usuario
                                          await _model.listaProdutosCarrinho!
                                              .first.reference
                                              .delete();
                                          Navigator.pop(context);

                                          setState(() {});
                                        },
                                        text: 'Enviar pedido',
                                        icon: FaIcon(
                                          FontAwesomeIcons.whatsapp,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: valueOrDefault<Color>(
                                            widget.anunciante?.cor,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: valueOrDefault<Color>(
                                              widget.anunciante?.cor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'buttonOnPageLoadAnimation1']!),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancelar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation2']!),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Seu carrinho ainda está vazio',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall,
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation6']!),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons
                                                    .remove_shopping_cart_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                size: 90.0,
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Próximos passos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation7']!),
                                          Text(
                                            'Você pode iniciar uma conversa  no WhatsApp do(a) ${widget.anunciante?.nomeFantasia} ou voltar para os produtos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ).animateOnPageLoad(animationsMap[
                                              'textOnPageLoadAnimation8']!),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text('abrir whats'),
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
                                            setState(() {
                                              FFAppState()
                                                  .nomesProdutosCarrinhoUsuer = [];
                                            });
                                          },
                                          text: 'Chamar no whatsapp',
                                          icon: FaIcon(
                                            FontAwesomeIcons.whatsapp,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
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
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: valueOrDefault<Color>(
                                                FFAppState()
                                                    .corSelecionadaAnunciante,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'buttonOnPageLoadAnimation3']!),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().qntdItensCarrinho = 0;
                                            FFAppState()
                                                .nomesProdutosCarrinhoUsuer = [];
                                          });
                                          Navigator.pop(context);
                                        },
                                        text: 'Voltar para os itens',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'buttonOnPageLoadAnimation4']!),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
