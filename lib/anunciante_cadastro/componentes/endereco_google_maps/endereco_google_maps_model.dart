import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'endereco_google_maps_widget.dart' show EnderecoGoogleMapsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EnderecoGoogleMapsModel
    extends FlutterFlowModel<EnderecoGoogleMapsWidget> {
  ///  Local state fields for this component.

  String enderecoGoogle = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap_obrigatorio widget.
  LatLng? googleMapObrigatoriosCenter;
  final googleMapObrigatoriosController = Completer<GoogleMapController>();
  // State field(s) for PickerBTNConfirmacao widget.
  FFPlace pickerBTNConfirmacaoValue = FFPlace();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  EnderecoRecord? enderecoRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
