import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasRecord extends FirestoreRecord {
  CategoriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NomeDaCategoria" field.
  String? _nomeDaCategoria;
  String get nomeDaCategoria => _nomeDaCategoria ?? '';
  bool hasNomeDaCategoria() => _nomeDaCategoria != null;

  // "NomeSubCategoria" field.
  List<String>? _nomeSubCategoria;
  List<String> get nomeSubCategoria => _nomeSubCategoria ?? const [];
  bool hasNomeSubCategoria() => _nomeSubCategoria != null;

  // "ImgBackgroundCategoria" field.
  String? _imgBackgroundCategoria;
  String get imgBackgroundCategoria => _imgBackgroundCategoria ?? '';
  bool hasImgBackgroundCategoria() => _imgBackgroundCategoria != null;

  void _initializeFields() {
    _nomeDaCategoria = snapshotData['NomeDaCategoria'] as String?;
    _nomeSubCategoria = getDataList(snapshotData['NomeSubCategoria']);
    _imgBackgroundCategoria = snapshotData['ImgBackgroundCategoria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categorias');

  static Stream<CategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasRecord.fromSnapshot(s));

  static Future<CategoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriasRecord.fromSnapshot(s));

  static CategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasRecordData({
  String? nomeDaCategoria,
  String? imgBackgroundCategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NomeDaCategoria': nomeDaCategoria,
      'ImgBackgroundCategoria': imgBackgroundCategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriasRecordDocumentEquality implements Equality<CategoriasRecord> {
  const CategoriasRecordDocumentEquality();

  @override
  bool equals(CategoriasRecord? e1, CategoriasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeDaCategoria == e2?.nomeDaCategoria &&
        listEquality.equals(e1?.nomeSubCategoria, e2?.nomeSubCategoria) &&
        e1?.imgBackgroundCategoria == e2?.imgBackgroundCategoria;
  }

  @override
  int hash(CategoriasRecord? e) => const ListEquality().hash(
      [e?.nomeDaCategoria, e?.nomeSubCategoria, e?.imgBackgroundCategoria]);

  @override
  bool isValidKey(Object? o) => o is CategoriasRecord;
}
