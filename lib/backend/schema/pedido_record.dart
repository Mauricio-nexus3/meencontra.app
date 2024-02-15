import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoRecord extends FirestoreRecord {
  PedidoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "anunciante" field.
  DocumentReference? _anunciante;
  DocumentReference? get anunciante => _anunciante;
  bool hasAnunciante() => _anunciante != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "valorTotal" field.
  double? _valorTotal;
  double get valorTotal => _valorTotal ?? 0.0;
  bool hasValorTotal() => _valorTotal != null;

  // "statusPedido" field.
  String? _statusPedido;
  String get statusPedido => _statusPedido ?? '';
  bool hasStatusPedido() => _statusPedido != null;

  // "codPedido" field.
  String? _codPedido;
  String get codPedido => _codPedido ?? '';
  bool hasCodPedido() => _codPedido != null;

  // "pedido" field.
  String? _pedido;
  String get pedido => _pedido ?? '';
  bool hasPedido() => _pedido != null;

  void _initializeFields() {
    _anunciante = snapshotData['anunciante'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _valorTotal = castToType<double>(snapshotData['valorTotal']);
    _statusPedido = snapshotData['statusPedido'] as String?;
    _codPedido = snapshotData['codPedido'] as String?;
    _pedido = snapshotData['pedido'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedido');

  static Stream<PedidoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidoRecord.fromSnapshot(s));

  static Future<PedidoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidoRecord.fromSnapshot(s));

  static PedidoRecord fromSnapshot(DocumentSnapshot snapshot) => PedidoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidoRecordData({
  DocumentReference? anunciante,
  DocumentReference? user,
  double? valorTotal,
  String? statusPedido,
  String? codPedido,
  String? pedido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'anunciante': anunciante,
      'user': user,
      'valorTotal': valorTotal,
      'statusPedido': statusPedido,
      'codPedido': codPedido,
      'pedido': pedido,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidoRecordDocumentEquality implements Equality<PedidoRecord> {
  const PedidoRecordDocumentEquality();

  @override
  bool equals(PedidoRecord? e1, PedidoRecord? e2) {
    return e1?.anunciante == e2?.anunciante &&
        e1?.user == e2?.user &&
        e1?.valorTotal == e2?.valorTotal &&
        e1?.statusPedido == e2?.statusPedido &&
        e1?.codPedido == e2?.codPedido &&
        e1?.pedido == e2?.pedido;
  }

  @override
  int hash(PedidoRecord? e) => const ListEquality().hash([
        e?.anunciante,
        e?.user,
        e?.valorTotal,
        e?.statusPedido,
        e?.codPedido,
        e?.pedido
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidoRecord;
}
