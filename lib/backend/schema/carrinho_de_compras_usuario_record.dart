import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoDeComprasUsuarioRecord extends FirestoreRecord {
  CarrinhoDeComprasUsuarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "anuncianteRef" field.
  DocumentReference? _anuncianteRef;
  DocumentReference? get anuncianteRef => _anuncianteRef;
  bool hasAnuncianteRef() => _anuncianteRef != null;

  // "ProdutoRef" field.
  DocumentReference? _produtoRef;
  DocumentReference? get produtoRef => _produtoRef;
  bool hasProdutoRef() => _produtoRef != null;

  // "nomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  // "quantidadeProduto" field.
  int? _quantidadeProduto;
  int get quantidadeProduto => _quantidadeProduto ?? 0;
  bool hasQuantidadeProduto() => _quantidadeProduto != null;

  // "valorUnitario" field.
  double? _valorUnitario;
  double get valorUnitario => _valorUnitario ?? 0.0;
  bool hasValorUnitario() => _valorUnitario != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "nomeFantasiaAnunciante" field.
  String? _nomeFantasiaAnunciante;
  String get nomeFantasiaAnunciante => _nomeFantasiaAnunciante ?? '';
  bool hasNomeFantasiaAnunciante() => _nomeFantasiaAnunciante != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _anuncianteRef = snapshotData['anuncianteRef'] as DocumentReference?;
    _produtoRef = snapshotData['ProdutoRef'] as DocumentReference?;
    _nomeProduto = snapshotData['nomeProduto'] as String?;
    _quantidadeProduto = castToType<int>(snapshotData['quantidadeProduto']);
    _valorUnitario = castToType<double>(snapshotData['valorUnitario']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _nomeFantasiaAnunciante = snapshotData['nomeFantasiaAnunciante'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CarrinhoDeComprasUsuario')
          : FirebaseFirestore.instance
              .collectionGroup('CarrinhoDeComprasUsuario');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CarrinhoDeComprasUsuario').doc(id);

  static Stream<CarrinhoDeComprasUsuarioRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CarrinhoDeComprasUsuarioRecord.fromSnapshot(s));

  static Future<CarrinhoDeComprasUsuarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CarrinhoDeComprasUsuarioRecord.fromSnapshot(s));

  static CarrinhoDeComprasUsuarioRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CarrinhoDeComprasUsuarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrinhoDeComprasUsuarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrinhoDeComprasUsuarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrinhoDeComprasUsuarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrinhoDeComprasUsuarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrinhoDeComprasUsuarioRecordData({
  DocumentReference? anuncianteRef,
  DocumentReference? produtoRef,
  String? nomeProduto,
  int? quantidadeProduto,
  double? valorUnitario,
  double? subTotal,
  String? nomeFantasiaAnunciante,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'anuncianteRef': anuncianteRef,
      'ProdutoRef': produtoRef,
      'nomeProduto': nomeProduto,
      'quantidadeProduto': quantidadeProduto,
      'valorUnitario': valorUnitario,
      'subTotal': subTotal,
      'nomeFantasiaAnunciante': nomeFantasiaAnunciante,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrinhoDeComprasUsuarioRecordDocumentEquality
    implements Equality<CarrinhoDeComprasUsuarioRecord> {
  const CarrinhoDeComprasUsuarioRecordDocumentEquality();

  @override
  bool equals(
      CarrinhoDeComprasUsuarioRecord? e1, CarrinhoDeComprasUsuarioRecord? e2) {
    return e1?.anuncianteRef == e2?.anuncianteRef &&
        e1?.produtoRef == e2?.produtoRef &&
        e1?.nomeProduto == e2?.nomeProduto &&
        e1?.quantidadeProduto == e2?.quantidadeProduto &&
        e1?.valorUnitario == e2?.valorUnitario &&
        e1?.subTotal == e2?.subTotal &&
        e1?.nomeFantasiaAnunciante == e2?.nomeFantasiaAnunciante;
  }

  @override
  int hash(CarrinhoDeComprasUsuarioRecord? e) => const ListEquality().hash([
        e?.anuncianteRef,
        e?.produtoRef,
        e?.nomeProduto,
        e?.quantidadeProduto,
        e?.valorUnitario,
        e?.subTotal,
        e?.nomeFantasiaAnunciante
      ]);

  @override
  bool isValidKey(Object? o) => o is CarrinhoDeComprasUsuarioRecord;
}
