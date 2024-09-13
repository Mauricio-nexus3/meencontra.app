import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'meinforma_detalhes_noticia_widget.dart'
    show MeinformaDetalhesNoticiaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeinformaDetalhesNoticiaModel
    extends FlutterFlowModel<MeinformaDetalhesNoticiaWidget> {
  ///  Local state fields for this page.

  String logoMeinformaNotificacao =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/meencontra-gflgrp/assets/il24hbpde2nh/informame.png';

  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usuariosRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
