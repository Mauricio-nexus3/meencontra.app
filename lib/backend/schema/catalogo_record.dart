import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogoRecord extends FirestoreRecord {
  CatalogoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeCategoria" field.
  String? _nomeCategoria;
  String get nomeCategoria => _nomeCategoria ?? '';
  bool hasNomeCategoria() => _nomeCategoria != null;

  // "categoriaRef_Stg" field.
  String? _categoriaRefStg;
  String get categoriaRefStg => _categoriaRefStg ?? '';
  bool hasCategoriaRefStg() => _categoriaRefStg != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeCategoria = snapshotData['nomeCategoria'] as String?;
    _categoriaRefStg = snapshotData['categoriaRef_Stg'] as String?;
    _ativo = snapshotData['ativo'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Catalogo')
          : FirebaseFirestore.instance.collectionGroup('Catalogo');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Catalogo').doc(id);

  static Stream<CatalogoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatalogoRecord.fromSnapshot(s));

  static Future<CatalogoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatalogoRecord.fromSnapshot(s));

  static CatalogoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatalogoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatalogoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatalogoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatalogoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatalogoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatalogoRecordData({
  String? nomeCategoria,
  String? categoriaRefStg,
  bool? ativo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeCategoria': nomeCategoria,
      'categoriaRef_Stg': categoriaRefStg,
      'ativo': ativo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatalogoRecordDocumentEquality implements Equality<CatalogoRecord> {
  const CatalogoRecordDocumentEquality();

  @override
  bool equals(CatalogoRecord? e1, CatalogoRecord? e2) {
    return e1?.nomeCategoria == e2?.nomeCategoria &&
        e1?.categoriaRefStg == e2?.categoriaRefStg &&
        e1?.ativo == e2?.ativo;
  }

  @override
  int hash(CatalogoRecord? e) => const ListEquality()
      .hash([e?.nomeCategoria, e?.categoriaRefStg, e?.ativo]);

  @override
  bool isValidKey(Object? o) => o is CatalogoRecord;
}
