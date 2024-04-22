import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssinaturasRecord extends FirestoreRecord {
  AssinaturasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idSessao" field.
  String? _idSessao;
  String get idSessao => _idSessao ?? '';
  bool hasIdSessao() => _idSessao != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "planoAssinatura" field.
  String? _planoAssinatura;
  String get planoAssinatura => _planoAssinatura ?? '';
  bool hasPlanoAssinatura() => _planoAssinatura != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idSessao = snapshotData['idSessao'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
    _planoAssinatura = snapshotData['planoAssinatura'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('assinaturas')
          : FirebaseFirestore.instance.collectionGroup('assinaturas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('assinaturas').doc(id);

  static Stream<AssinaturasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AssinaturasRecord.fromSnapshot(s));

  static Future<AssinaturasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AssinaturasRecord.fromSnapshot(s));

  static AssinaturasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AssinaturasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AssinaturasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AssinaturasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AssinaturasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AssinaturasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAssinaturasRecordData({
  String? idSessao,
  bool? ativo,
  String? planoAssinatura,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idSessao': idSessao,
      'ativo': ativo,
      'planoAssinatura': planoAssinatura,
    }.withoutNulls,
  );

  return firestoreData;
}

class AssinaturasRecordDocumentEquality implements Equality<AssinaturasRecord> {
  const AssinaturasRecordDocumentEquality();

  @override
  bool equals(AssinaturasRecord? e1, AssinaturasRecord? e2) {
    return e1?.idSessao == e2?.idSessao &&
        e1?.ativo == e2?.ativo &&
        e1?.planoAssinatura == e2?.planoAssinatura;
  }

  @override
  int hash(AssinaturasRecord? e) =>
      const ListEquality().hash([e?.idSessao, e?.ativo, e?.planoAssinatura]);

  @override
  bool isValidKey(Object? o) => o is AssinaturasRecord;
}
