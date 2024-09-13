import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'teste_atual_widget.dart' show TesteAtualWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  List<MateriasRecord> listaMateriasDoc = [];
  void addToListaMateriasDoc(MateriasRecord item) => listaMateriasDoc.add(item);
  void removeFromListaMateriasDoc(MateriasRecord item) =>
      listaMateriasDoc.remove(item);
  void removeAtIndexFromListaMateriasDoc(int index) =>
      listaMateriasDoc.removeAt(index);
  void insertAtIndexInListaMateriasDoc(int index, MateriasRecord item) =>
      listaMateriasDoc.insert(index, item);
  void updateListaMateriasDocAtIndex(
          int index, Function(MateriasRecord) updateFn) =>
      listaMateriasDoc[index] = updateFn(listaMateriasDoc[index]);

  MateriasRecord? listaMateriasExecutando;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
