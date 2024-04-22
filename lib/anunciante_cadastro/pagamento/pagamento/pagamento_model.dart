import '/anunciante_cadastro/pagamento/popup_pagamento/popup_pagamento_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pagamento_widget.dart' show PagamentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PagamentoModel extends FlutterFlowModel<PagamentoWidget> {
  ///  Local state fields for this page.

  String plano = 'Premium';

  String? idStripeIntent;

  String? statusStripeIntent;

  DateTime? dataStripeIntent;

  String planoSelecionado = 'gratis';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // State field(s) for Anual widget.
  bool? anualValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future fluxoAssinatura(
    BuildContext context, {
    String? planoSelecionado,
    required String? planoAssinatura,
    required String? nomeFantasia,
  }) async {
    ApiCallResponse? stripeSessaoGerada;
    AssinaturasRecord? documentoAssinatura;

    stripeSessaoGerada = await StripeGroup.createCheckoutSessionCall.call(
      lineItemsPrice: planoSelecionado,
      mode: 'subscription',
      customerEmail: currentUserEmail,
    );
    if ((stripeSessaoGerada?.succeeded ?? true)) {
      await launchURL(getJsonField(
        (stripeSessaoGerada?.jsonBody ?? ''),
        r'''$.url''',
      ).toString().toString());

      var assinaturasRecordReference =
          AssinaturasRecord.createDoc(widget.anuncianteRef!);
      await assinaturasRecordReference.set(createAssinaturasRecordData(
        idSessao: getJsonField(
          (stripeSessaoGerada?.jsonBody ?? ''),
          r'''$.id''',
        ).toString().toString(),
        ativo: false,
        planoAssinatura: planoAssinatura,
      ));
      documentoAssinatura = AssinaturasRecord.getDocumentFromData(
          createAssinaturasRecordData(
            idSessao: getJsonField(
              (stripeSessaoGerada?.jsonBody ?? ''),
              r'''$.id''',
            ).toString().toString(),
            ativo: false,
            planoAssinatura: planoAssinatura,
          ),
          assinaturasRecordReference);

      await widget.anuncianteRef!.update(createAnuncianteRecordData(
        anuncianteUser: currentUserReference,
        emailUsuarioAdm: currentUserEmail,
      ));
      await Future.delayed(const Duration(milliseconds: 500));
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () => unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: PopupPagamentoWidget(
                  parameter1: widget.anuncianteRef!,
                  planoAssinatura: widget.planoAssinatura!,
                  idSession: getJsonField(
                    (stripeSessaoGerada?.jsonBody ?? ''),
                    r'''$.id''',
                  ).toString().toString(),
                  statusSession: 'complete',
                  nomeFantasia: widget.nomeFantasia!,
                  nextToPagConfirmado: () async {
                    context.pushNamed(
                      'ConcluirCadastro',
                      queryParameters: {
                        'anuncianteRef': serializeParam(
                          widget.anuncianteRef,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  pagamentoNegado: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'deu ruim',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    }
  }
}
