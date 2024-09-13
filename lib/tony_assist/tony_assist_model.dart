import '/backend/api_requests/api_calls.dart';
import '/components/tony_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tony_assist_widget.dart' show TonyAssistWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TonyAssistModel extends FlutterFlowModel<TonyAssistWidget> {
  ///  Local state fields for this page.

  List<String> geminiHistorico = [];
  void addToGeminiHistorico(String item) => geminiHistorico.add(item);
  void removeFromGeminiHistorico(String item) => geminiHistorico.remove(item);
  void removeAtIndexFromGeminiHistorico(int index) =>
      geminiHistorico.removeAt(index);
  void insertAtIndexInGeminiHistorico(int index, String item) =>
      geminiHistorico.insert(index, item);
  void updateGeminiHistoricoAtIndex(int index, Function(String) updateFn) =>
      geminiHistorico[index] = updateFn(geminiHistorico[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for inputText widget.
  FocusNode? inputTextFocusNode;
  TextEditingController? inputTextTextController;
  String? Function(BuildContext, String?)? inputTextTextControllerValidator;
  // Stores action output result for [Backend Call - API (Geminiai)] action in IconButton widget.
  ApiCallResponse? saidaGeminai;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputTextFocusNode?.dispose();
    inputTextTextController?.dispose();
  }
}
