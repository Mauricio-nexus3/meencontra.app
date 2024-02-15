import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoCarrinhoRecord extends FirestoreRecord {
  ProdutoCarrinhoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "produto" field.
  DocumentReference? _produto;
  DocumentReference? get produto => _produto;
  bool hasProduto() => _produto != null;

  // "valorUnitario" field.
  double? _valorUnitario;
  double get valorUnitario => _valorUnitario ?? 0.0;
  bool hasValorUnitario() => _valorUnitario != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  bool hasQuantidade() => _quantidade != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "nomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _produto = snapshotData['produto'] as DocumentReference?;
    _valorUnitario = castToType<double>(snapshotData['valorUnitario']);
    _quantidade = castToType<int>(snapshotData['quantidade']);
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _nomeProduto = snapshotData['nomeProduto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('produtoCarrinho')
          : FirebaseFirestore.instance.collectionGroup('produtoCarrinho');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('produtoCarrinho').doc(id);

  static Stream<ProdutoCarrinhoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoCarrinhoRecord.fromSnapshot(s));

  static Future<ProdutoCarrinhoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoCarrinhoRecord.fromSnapshot(s));

  static ProdutoCarrinhoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoCarrinhoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoCarrinhoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoCarrinhoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoCarrinhoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoCarrinhoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoCarrinhoRecordData({
  DocumentReference? produto,
  double? valorUnitario,
  int? quantidade,
  double? subTotal,
  String? nomeProduto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'produto': produto,
      'valorUnitario': valorUnitario,
      'quantidade': quantidade,
      'subTotal': subTotal,
      'nomeProduto': nomeProduto,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoCarrinhoRecordDocumentEquality
    implements Equality<ProdutoCarrinhoRecord> {
  const ProdutoCarrinhoRecordDocumentEquality();

  @override
  bool equals(ProdutoCarrinhoRecord? e1, ProdutoCarrinhoRecord? e2) {
    return e1?.produto == e2?.produto &&
        e1?.valorUnitario == e2?.valorUnitario &&
        e1?.quantidade == e2?.quantidade &&
        e1?.subTotal == e2?.subTotal &&
        e1?.nomeProduto == e2?.nomeProduto;
  }

  @override
  int hash(ProdutoCarrinhoRecord? e) => const ListEquality().hash([
        e?.produto,
        e?.valorUnitario,
        e?.quantidade,
        e?.subTotal,
        e?.nomeProduto
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoCarrinhoRecord;
}
