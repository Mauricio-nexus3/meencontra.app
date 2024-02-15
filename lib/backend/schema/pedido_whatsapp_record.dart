import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoWhatsappRecord extends FirestoreRecord {
  PedidoWhatsappRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "usuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "nomeUsuario" field.
  String? _nomeUsuario;
  String get nomeUsuario => _nomeUsuario ?? '';
  bool hasNomeUsuario() => _nomeUsuario != null;

  // "emailUsuario" field.
  String? _emailUsuario;
  String get emailUsuario => _emailUsuario ?? '';
  bool hasEmailUsuario() => _emailUsuario != null;

  // "Whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "ValorTotal" field.
  double? _valorTotal;
  double get valorTotal => _valorTotal ?? 0.0;
  bool hasValorTotal() => _valorTotal != null;

  // "CodigoPedido" field.
  String? _codigoPedido;
  String get codigoPedido => _codigoPedido ?? '';
  bool hasCodigoPedido() => _codigoPedido != null;

  // "pedido" field.
  String? _pedido;
  String get pedido => _pedido ?? '';
  bool hasPedido() => _pedido != null;

  // "observacaoPedido" field.
  String? _observacaoPedido;
  String get observacaoPedido => _observacaoPedido ?? '';
  bool hasObservacaoPedido() => _observacaoPedido != null;

  // "horarioPedido" field.
  DateTime? _horarioPedido;
  DateTime? get horarioPedido => _horarioPedido;
  bool hasHorarioPedido() => _horarioPedido != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _usuarioRef = snapshotData['usuarioRef'] as DocumentReference?;
    _nomeUsuario = snapshotData['nomeUsuario'] as String?;
    _emailUsuario = snapshotData['emailUsuario'] as String?;
    _whatsapp = snapshotData['Whatsapp'] as String?;
    _valorTotal = castToType<double>(snapshotData['ValorTotal']);
    _codigoPedido = snapshotData['CodigoPedido'] as String?;
    _pedido = snapshotData['pedido'] as String?;
    _observacaoPedido = snapshotData['observacaoPedido'] as String?;
    _horarioPedido = snapshotData['horarioPedido'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pedidoWhatsapp')
          : FirebaseFirestore.instance.collectionGroup('pedidoWhatsapp');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pedidoWhatsapp').doc(id);

  static Stream<PedidoWhatsappRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidoWhatsappRecord.fromSnapshot(s));

  static Future<PedidoWhatsappRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidoWhatsappRecord.fromSnapshot(s));

  static PedidoWhatsappRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidoWhatsappRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidoWhatsappRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidoWhatsappRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidoWhatsappRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidoWhatsappRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidoWhatsappRecordData({
  DocumentReference? usuarioRef,
  String? nomeUsuario,
  String? emailUsuario,
  String? whatsapp,
  double? valorTotal,
  String? codigoPedido,
  String? pedido,
  String? observacaoPedido,
  DateTime? horarioPedido,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usuarioRef': usuarioRef,
      'nomeUsuario': nomeUsuario,
      'emailUsuario': emailUsuario,
      'Whatsapp': whatsapp,
      'ValorTotal': valorTotal,
      'CodigoPedido': codigoPedido,
      'pedido': pedido,
      'observacaoPedido': observacaoPedido,
      'horarioPedido': horarioPedido,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidoWhatsappRecordDocumentEquality
    implements Equality<PedidoWhatsappRecord> {
  const PedidoWhatsappRecordDocumentEquality();

  @override
  bool equals(PedidoWhatsappRecord? e1, PedidoWhatsappRecord? e2) {
    return e1?.usuarioRef == e2?.usuarioRef &&
        e1?.nomeUsuario == e2?.nomeUsuario &&
        e1?.emailUsuario == e2?.emailUsuario &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.valorTotal == e2?.valorTotal &&
        e1?.codigoPedido == e2?.codigoPedido &&
        e1?.pedido == e2?.pedido &&
        e1?.observacaoPedido == e2?.observacaoPedido &&
        e1?.horarioPedido == e2?.horarioPedido;
  }

  @override
  int hash(PedidoWhatsappRecord? e) => const ListEquality().hash([
        e?.usuarioRef,
        e?.nomeUsuario,
        e?.emailUsuario,
        e?.whatsapp,
        e?.valorTotal,
        e?.codigoPedido,
        e?.pedido,
        e?.observacaoPedido,
        e?.horarioPedido
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidoWhatsappRecord;
}
