import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'popup_pagamento_model.dart';
export 'popup_pagamento_model.dart';

class PopupPagamentoWidget extends StatefulWidget {
  const PopupPagamentoWidget({
    super.key,
    required this.parameter1,
    required this.nextToPagConfirmado,
    required this.planoAssinatura,
    required this.pagamentoNegado,
    String? idSession,
    required this.statusSession,
    required this.nomeFantasia,
  }) : this.idSession = idSession ?? '';

  final DocumentReference? parameter1;
  final Future Function()? nextToPagConfirmado;
  final String? planoAssinatura;
  final Future Function()? pagamentoNegado;
  final String idSession;
  final String? statusSession;
  final String? nomeFantasia;

  @override
  State<PopupPagamentoWidget> createState() => _PopupPagamentoWidgetState();
}

class _PopupPagamentoWidgetState extends State<PopupPagamentoWidget> {
  late PopupPagamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupPagamentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Builder(
          builder: (context) {
            if (_model.pagamentoEfetuado == 'Sim') {
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Parabens!',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Sua assinatura está ativa',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                      Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(60.0),
                        repeat: false,
                        animate: true,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Lembre-se que um perfil atualizado com publicações de produtos e serviços ajudam o cliente a encontrar seu perfil',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ]
                            .divide(SizedBox(height: 18.0))
                            .around(SizedBox(height: 18.0)),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'POPUP_PAGAMENTO_COMP_PRÓXIMO_BTN_ON_TAP');
                          _model.admin = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'email',
                              isEqualTo: 'mauricio@meencontra.app',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          await widget.nextToPagConfirmado?.call();
                          triggerPushNotification(
                            notificationTitle: 'Nova Assinatura',
                            notificationText:
                                '${'Anunciante: ${widget.nomeFantasia}'}, ${'Plano: ${widget.planoAssinatura}'}',
                            notificationSound: 'default',
                            userRefs: [_model.admin!.reference],
                            initialPageName: 'AnunciantePage',
                            parameterData: {
                              'documentoRefAnunciante': widget.parameter1,
                            },
                          );

                          setState(() {});
                        },
                        text: 'Próximo',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              );
            } else if ((_model.pagamentoEfetuado == 'Não') ||
                (_model.tentativasPagamento == 2)) {
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Ops, deu ruim. Tente novamente',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Lottie.network(
                        'https://lottie.host/fe7de415-2da8-4f76-b815-f693b730481c/tePuQ9pNiu.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(60.0),
                        repeat: false,
                        animate: true,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'POPUP_PAGAMENTO_COMP_FECHAR_BTN_ON_TAP');
                            await widget.pagamentoNegado?.call();
                          },
                          text: 'Fechar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 1.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .around(SizedBox(height: 24.0)),
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Aguardando confirmação',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Lottie.network(
                        'https://lottie.host/5f02b084-6754-4e16-9425-29d36f3267ad/gDZen3NRng.json',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        frameRate: FrameRate(60.0),
                        animate: true,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Está demorando um pouco. tente atualizar manualmente',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'POPUP_PAGAMENTO_ATUALIZAR_MANUALMENTE_BT');
                                _model.resultado2 = await StripeGroup
                                    .listCustomersUsuariosAtivoCall
                                    .call(
                                  email: currentUserEmail,
                                );
                                if (StripeGroup.listCustomersUsuariosAtivoCall
                                        .statusAssinatura(
                                      (_model.resultado2?.jsonBody ?? ''),
                                    ) ==
                                    'active') {
                                  setState(() {
                                    _model.pagamentoEfetuado = 'Sim';
                                  });

                                  await widget.parameter1!
                                      .update(createAnuncianteRecordData(
                                    planoAssinatura: widget.planoAssinatura,
                                  ));
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text(
                                              'Pagamento não identificado, tente novamente'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  setState(() {
                                    _model.tentativasPagamento =
                                        _model.tentativasPagamento! + 1;
                                  });
                                }

                                setState(() {});
                              },
                              text: 'Atualizar manualmente',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .around(SizedBox(height: 24.0)),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
