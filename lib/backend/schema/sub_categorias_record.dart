import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCategoriasRecord extends FirestoreRecord {
  SubCategoriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NomeCategoriaPai" field.
  String? _nomeCategoriaPai;
  String get nomeCategoriaPai => _nomeCategoriaPai ?? '';
  bool hasNomeCategoriaPai() => _nomeCategoriaPai != null;

  // "NomeSubCategoria" field.
  String? _nomeSubCategoria;
  String get nomeSubCategoria => _nomeSubCategoria ?? '';
  bool hasNomeSubCategoria() => _nomeSubCategoria != null;

  void _initializeFields() {
    _nomeCategoriaPai = snapshotData['NomeCategoriaPai'] as String?;
    _nomeSubCategoria = snapshotData['NomeSubCategoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SubCategorias');

  static Stream<SubCategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubCategoriasRecord.fromSnapshot(s));

  static Future<SubCategoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubCategoriasRecord.fromSnapshot(s));

  static SubCategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubCategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCategoriasRecordData({
  String? nomeCategoriaPai,
  String? nomeSubCategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NomeCategoriaPai': nomeCategoriaPai,
      'NomeSubCategoria': nomeSubCategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCategoriasRecordDocumentEquality
    implements Equality<SubCategoriasRecord> {
  const SubCategoriasRecordDocumentEquality();

  @override
  bool equals(SubCategoriasRecord? e1, SubCategoriasRecord? e2) {
    return e1?.nomeCategoriaPai == e2?.nomeCategoriaPai &&
        e1?.nomeSubCategoria == e2?.nomeSubCategoria;
  }

  @override
  int hash(SubCategoriasRecord? e) =>
      const ListEquality().hash([e?.nomeCategoriaPai, e?.nomeSubCategoria]);

  @override
  bool isValidKey(Object? o) => o is SubCategoriasRecord;
}
