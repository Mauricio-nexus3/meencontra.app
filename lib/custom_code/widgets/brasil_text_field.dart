// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

class BrasilTextField extends StatefulWidget {
  const BrasilTextField({
    Key? key,
    this.width,
    this.height,
    this.value,
    required this.filledColor,
    required this.fontSize,
    required this.colorText,
    required this.borderColor,
    this.hintText,
    required this.borderRadius,
    required this.borderSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? value;
  final Color filledColor;
  final double fontSize;
  final Color colorText;
  final Color borderColor;
  final String? hintText;
  final int borderRadius;
  final int borderSize;

  @override
  _BrasilTextFieldState createState() => _BrasilTextFieldState();
}

class _BrasilTextFieldState extends State<BrasilTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      keyboardType: TextInputType.number,
      inputFormatters: [
        CurrencyTextInputFormatter(
          locale: 'pt_BR',
          decimalDigits: 2,
          symbol: 'R\$',
          enableNegative: true,
        ),
        LengthLimitingTextInputFormatter(16),
      ],
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: widget.colorText,
        fontSize: widget.fontSize,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.toDouble()),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderSize.toDouble(),
          ),
        ),
        filled: true,
        fillColor: widget.filledColor,
      ),
      onChanged: (text) {
        updateValues(text);
      },
    );
  }

  void updateValues(String text) {
    double parsedValue = parseCurrency(text);
    FFAppState().valueFormat =
        text; // Altere para o nome do seu Appstate de valor formatado(string)
    FFAppState().valueDouble =
        parsedValue; // Altere para o nome do seu Appstate de valor em double
  }

  double parseCurrency(String text) {
    String sanitizedValue =
        text.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.');
    return double.parse(sanitizedValue);
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right
