import '/anunciante/new_anunciante/build/new_anuncio_lista_de_imgns/new_anuncio_lista_de_imgns_widget.dart';
import '/anunciante/new_anunciante/build/new_anuncio_produto_lista/new_anuncio_produto_lista_widget.dart';
import '/anunciante/new_componentes/new_dash_anunciante/new_dash_anunciante_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_n_w_anuncios_widget.dart' show DashboardNWAnunciosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardNWAnunciosModel
    extends FlutterFlowModel<DashboardNWAnunciosWidget> {
  ///  Local state fields for this page.

  String? tabBar;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for NewDashAnunciante component.
  late NewDashAnuncianteModel newDashAnuncianteModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    newDashAnuncianteModel1 =
        createModel(context, () => NewDashAnuncianteModel());
    newDashAnuncianteModel2 =
        createModel(context, () => NewDashAnuncianteModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    newDashAnuncianteModel1.dispose();
    newDashAnuncianteModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
