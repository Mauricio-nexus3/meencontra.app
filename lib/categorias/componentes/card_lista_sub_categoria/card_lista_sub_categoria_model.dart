import '/anunciante/assinatura/selos_anunciante/selos_anunciante_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'card_lista_sub_categoria_widget.dart' show CardListaSubCategoriaWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardListaSubCategoriaModel
    extends FlutterFlowModel<CardListaSubCategoriaWidget> {
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
