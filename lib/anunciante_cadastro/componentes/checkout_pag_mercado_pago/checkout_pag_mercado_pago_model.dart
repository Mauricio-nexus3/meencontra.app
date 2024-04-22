import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'checkout_pag_mercado_pago_widget.dart'
    show CheckoutPagMercadoPagoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CheckoutPagMercadoPagoModel
    extends FlutterFlowModel<CheckoutPagMercadoPagoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  final numeroMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  // State field(s) for mesAno widget.
  FocusNode? mesAnoFocusNode;
  TextEditingController? mesAnoTextController;
  final mesAnoMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? mesAnoTextControllerValidator;
  // State field(s) for cvc widget.
  FocusNode? cvcFocusNode;
  TextEditingController? cvcTextController;
  String? Function(BuildContext, String?)? cvcTextControllerValidator;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for documento widget.
  FocusNode? documentoFocusNode;
  TextEditingController? documentoTextController;
  final documentoMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? documentoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    mesAnoFocusNode?.dispose();
    mesAnoTextController?.dispose();

    cvcFocusNode?.dispose();
    cvcTextController?.dispose();

    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    documentoFocusNode?.dispose();
    documentoTextController?.dispose();
  }
}
