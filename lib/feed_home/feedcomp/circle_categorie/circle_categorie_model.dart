import '/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'circle_categorie_widget.dart' show CircleCategorieWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CircleCategorieModel extends FlutterFlowModel<CircleCategorieWidget> {
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
