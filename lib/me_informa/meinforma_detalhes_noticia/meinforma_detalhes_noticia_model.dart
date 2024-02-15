import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/componentes/appbar_grupo_me/appbar_grupo_me_widget.dart';
import '/components/acao_tabale_widget.dart';
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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeinformaDetalhesNoticiaModel
    extends FlutterFlowModel<MeinformaDetalhesNoticiaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppbarGrupoMe component.
  late AppbarGrupoMeModel appbarGrupoMeModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? usuariosRef;
  String currentPageLink = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarGrupoMeModel = createModel(context, () => AppbarGrupoMeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarGrupoMeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
