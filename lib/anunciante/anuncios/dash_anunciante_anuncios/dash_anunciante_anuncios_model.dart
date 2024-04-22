import '/anunciante/anunciante_page/menu_dash_anunciante/menu_dash_anunciante_widget.dart';
import '/anunciante/anunciante_page/produtos/new_anuncio_produto_lista/new_anuncio_produto_lista_widget.dart';
import '/anunciante/anuncios/new_anuncio_lista_de_imgns/new_anuncio_lista_de_imgns_widget.dart';
import '/anunciante/assinatura/estrela_bloqueio/estrela_bloqueio_widget.dart';
import '/anunciante/assinatura/upgrade/upgrade_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dash_anunciante_anuncios_widget.dart' show DashAnuncianteAnunciosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashAnuncianteAnunciosModel
    extends FlutterFlowModel<DashAnuncianteAnunciosWidget> {
  ///  Local state fields for this page.

  String? tabBar;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel1;
  // Model for EstrelaBloqueio component.
  late EstrelaBloqueioModel estrelaBloqueioModel2;
  // Model for MenuDashAnunciante component.
  late MenuDashAnuncianteModel menuDashAnuncianteModel2;

  @override
  void initState(BuildContext context) {
    menuDashAnuncianteModel1 =
        createModel(context, () => MenuDashAnuncianteModel());
    estrelaBloqueioModel1 = createModel(context, () => EstrelaBloqueioModel());
    estrelaBloqueioModel2 = createModel(context, () => EstrelaBloqueioModel());
    menuDashAnuncianteModel2 =
        createModel(context, () => MenuDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    menuDashAnuncianteModel1.dispose();
    estrelaBloqueioModel1.dispose();
    estrelaBloqueioModel2.dispose();
    menuDashAnuncianteModel2.dispose();
  }
}
