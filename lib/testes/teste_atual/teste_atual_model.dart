import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'teste_atual_widget.dart' show TesteAtualWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TesteAtualModel extends FlutterFlowModel<TesteAtualWidget> {
  ///  Local state fields for this page.

  DocumentReference? antigoRef;

  List<DocumentReference> all = [];
  void addToAll(DocumentReference item) => all.add(item);
  void removeFromAll(DocumentReference item) => all.remove(item);
  void removeAtIndexFromAll(int index) => all.removeAt(index);
  void insertAtIndexInAll(int index, DocumentReference item) =>
      all.insert(index, item);
  void updateAllAtIndex(int index, Function(DocumentReference) updateFn) =>
      all[index] = updateFn(all[index]);

  List<DocumentReference> antigaTabelaEnderecoRef = [];
  void addToAntigaTabelaEnderecoRef(DocumentReference item) =>
      antigaTabelaEnderecoRef.add(item);
  void removeFromAntigaTabelaEnderecoRef(DocumentReference item) =>
      antigaTabelaEnderecoRef.remove(item);
  void removeAtIndexFromAntigaTabelaEnderecoRef(int index) =>
      antigaTabelaEnderecoRef.removeAt(index);
  void insertAtIndexInAntigaTabelaEnderecoRef(
          int index, DocumentReference item) =>
      antigaTabelaEnderecoRef.insert(index, item);
  void updateAntigaTabelaEnderecoRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      antigaTabelaEnderecoRef[index] = updateFn(antigaTabelaEnderecoRef[index]);

  List<EnderecoRecord> updateEndereco = [];
  void addToUpdateEndereco(EnderecoRecord item) => updateEndereco.add(item);
  void removeFromUpdateEndereco(EnderecoRecord item) =>
      updateEndereco.remove(item);
  void removeAtIndexFromUpdateEndereco(int index) =>
      updateEndereco.removeAt(index);
  void insertAtIndexInUpdateEndereco(int index, EnderecoRecord item) =>
      updateEndereco.insert(index, item);
  void updateUpdateEnderecoAtIndex(
          int index, Function(EnderecoRecord) updateFn) =>
      updateEndereco[index] = updateFn(updateEndereco[index]);

  List<AnuncianteRecord> listaAnuciantesDoc = [];
  void addToListaAnuciantesDoc(AnuncianteRecord item) =>
      listaAnuciantesDoc.add(item);
  void removeFromListaAnuciantesDoc(AnuncianteRecord item) =>
      listaAnuciantesDoc.remove(item);
  void removeAtIndexFromListaAnuciantesDoc(int index) =>
      listaAnuciantesDoc.removeAt(index);
  void insertAtIndexInListaAnuciantesDoc(int index, AnuncianteRecord item) =>
      listaAnuciantesDoc.insert(index, item);
  void updateListaAnuciantesDocAtIndex(
          int index, Function(AnuncianteRecord) updateFn) =>
      listaAnuciantesDoc[index] = updateFn(listaAnuciantesDoc[index]);

  AnuncianteRecord? anuncianteEmExecucaoDoc;

  EnderecoRecord? enderEmExecucaoDoc;

  String? testeAAAAAString;

  double? testeAAAAADouble;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldAAAA widget.
  FocusNode? textFieldAAAAFocusNode;
  TextEditingController? textFieldAAAATextController;
  String? Function(BuildContext, String?)? textFieldAAAATextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldAAAAFocusNode?.dispose();
    textFieldAAAATextController?.dispose();
  }
}
