import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'popup_pagamento_widget.dart' show PopupPagamentoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PopupPagamentoModel extends FlutterFlowModel<PopupPagamentoWidget> {
  ///  Local state fields for this component.

  String pagamentoEfetuado = 'Aguardando';

  int? tentativasPagamento = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? admin;
  // Stores action output result for [Backend Call - API (List Customers UsuariosAtivo)] action in Button widget.
  ApiCallResponse? resultado2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
