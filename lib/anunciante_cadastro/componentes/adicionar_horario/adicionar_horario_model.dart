import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'adicionar_horario_widget.dart' show AdicionarHorarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdicionarHorarioModel extends FlutterFlowModel<AdicionarHorarioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDownPeriodo widget.
  String? dropDownPeriodoValue;
  FormFieldController<String>? dropDownPeriodoValueController;
  // State field(s) for Checkbox_UltrapassaMeiaNoite widget.
  bool? checkboxUltrapassaMeiaNoiteValue;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
