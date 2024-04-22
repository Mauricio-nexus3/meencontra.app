import '/anunciante/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_comp_anuncios_gera_l_widget.dart' show NewCompAnunciosGeraLWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewCompAnunciosGeraLModel
    extends FlutterFlowModel<NewCompAnunciosGeraLWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for selosAnunciante component.
  late SelosAnuncianteModel selosAnuncianteModel;

  @override
  void initState(BuildContext context) {
    selosAnuncianteModel = createModel(context, () => SelosAnuncianteModel());
  }

  @override
  void dispose() {
    selosAnuncianteModel.dispose();
  }
}
