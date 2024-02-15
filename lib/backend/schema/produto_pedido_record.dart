import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoPedidoRecord extends FirestoreRecord {
  ProdutoPedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  bool hasProduto() => _produto != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  bool hasQuantidade() => _quantidade != null;

  // "valorUnitario" field.
  double? _valorUnitario;
  double get valorUnitario => _valorUnitario ?? 0.0;
  bool hasValorUnitario() => _valorUnitario != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _produto = snapshotData['produto'] as DocumentReference?;
    _quantidade = castToType<int>(snapshotData['quantidade']);
    _valorUnitario = castToType<double>(snapshotData['valorUnitario']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('produtoPedido')
          : FirebaseFirestore.instance.collectionGroup('produtoPedido');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('produtoPedido').doc(id);

  static Stream<ProdutoPedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoPedidoRecord.fromSnapshot(s));

  static Future<ProdutoPedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoPedidoRecord.fromSnapshot(s));

  static ProdutoPedidoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoPedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoPedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoPedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoPedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoPedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoPedidoRecordData({
  DocumentReference? produto,
  int? quantidade,
  double? valorUnitario,
  double? subTotal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'produto': produto,
      'quantidade': quantidade,
      'valorUnitario': valorUnitario,
      'subTotal': subTotal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoPedidoRecordDocumentEquality
    implements Equality<ProdutoPedidoRecord> {
  const ProdutoPedidoRecordDocumentEquality();

  @override
  bool equals(ProdutoPedidoRecord? e1, ProdutoPedidoRecord? e2) {
    return e1?.produto == e2?.produto &&
        e1?.quantidade == e2?.quantidade &&
        e1?.valorUnitario == e2?.valorUnitario &&
        e1?.subTotal == e2?.subTotal;
  }

  @override
  int hash(ProdutoPedidoRecord? e) => const ListEquality()
      .hash([e?.produto, e?.quantidade, e?.valorUnitario, e?.subTotal]);

  @override
  bool isValidKey(Object? o) => o is ProdutoPedidoRecord;
}
