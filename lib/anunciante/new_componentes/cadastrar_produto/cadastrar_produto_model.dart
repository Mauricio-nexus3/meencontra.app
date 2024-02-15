import '/anunciante/new_componentes/cadastrar_categoria/cadastrar_categoria_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'cadastrar_produto_widget.dart' show CadastrarProdutoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CadastrarProdutoModel extends FlutterFlowModel<CadastrarProdutoWidget> {
  ///  Local state fields for this component.

  List<String> imgs = [];
  void addToImgs(String item) => imgs.add(item);
  void removeFromImgs(String item) => imgs.remove(item);
  void removeAtIndexFromImgs(int index) => imgs.removeAt(index);
  void insertAtIndexInImgs(int index, String item) => imgs.insert(index, item);
  void updateImgsAtIndex(int index, Function(String) updateFn) =>
      imgs[index] = updateFn(imgs[index]);

  String refCategoria = '';

  DocumentReference? cetegoriaRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CadastrarProduto widget.
  CatalogoRecord? codDropdowCategoria;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeProduto widget.
  FocusNode? nomeProdutoFocusNode;
  TextEditingController? nomeProdutoController;
  String? Function(BuildContext, String?)? nomeProdutoControllerValidator;
  // State field(s) for precoVenda widget.
  FocusNode? precoVendaFocusNode;
  TextEditingController? precoVendaController;
  String? Function(BuildContext, String?)? precoVendaControllerValidator;
  // State field(s) for DropDownCategoria2 widget.
  String? dropDownCategoria2Value;
  FormFieldController<String>? dropDownCategoria2ValueController;
  // State field(s) for codProduto widget.
  FocusNode? codProdutoFocusNode;
  TextEditingController? codProdutoController;
  String? Function(BuildContext, String?)? codProdutoControllerValidator;
  // State field(s) for descricaoProduto widget.
  FocusNode? descricaoProdutoFocusNode;
  TextEditingController? descricaoProdutoController;
  String? Function(BuildContext, String?)? descricaoProdutoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProdutoFocusNode?.dispose();
    nomeProdutoController?.dispose();

    precoVendaFocusNode?.dispose();
    precoVendaController?.dispose();

    codProdutoFocusNode?.dispose();
    codProdutoController?.dispose();

    descricaoProdutoFocusNode?.dispose();
    descricaoProdutoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
