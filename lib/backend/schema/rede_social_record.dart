import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedeSocialRecord extends FirestoreRecord {
  RedeSocialRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Arrobo_da_redeSocial" field.
  String? _arroboDaRedeSocial;
  String get arroboDaRedeSocial => _arroboDaRedeSocial ?? '';
  bool hasArroboDaRedeSocial() => _arroboDaRedeSocial != null;

  // "NomeRedeSocial" field.
  String? _nomeRedeSocial;
  String get nomeRedeSocial => _nomeRedeSocial ?? '';
  bool hasNomeRedeSocial() => _nomeRedeSocial != null;

  // "LogoRedeSocial" field.
  String? _logoRedeSocial;
  String get logoRedeSocial => _logoRedeSocial ?? '';
  bool hasLogoRedeSocial() => _logoRedeSocial != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _arroboDaRedeSocial = snapshotData['Arrobo_da_redeSocial'] as String?;
    _nomeRedeSocial = snapshotData['NomeRedeSocial'] as String?;
    _logoRedeSocial = snapshotData['LogoRedeSocial'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RedeSocial')
          : FirebaseFirestore.instance.collectionGroup('RedeSocial');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RedeSocial').doc(id);

  static Stream<RedeSocialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedeSocialRecord.fromSnapshot(s));

  static Future<RedeSocialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedeSocialRecord.fromSnapshot(s));

  static RedeSocialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedeSocialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedeSocialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedeSocialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedeSocialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedeSocialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedeSocialRecordData({
  String? arroboDaRedeSocial,
  String? nomeRedeSocial,
  String? logoRedeSocial,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Arrobo_da_redeSocial': arroboDaRedeSocial,
      'NomeRedeSocial': nomeRedeSocial,
      'LogoRedeSocial': logoRedeSocial,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedeSocialRecordDocumentEquality implements Equality<RedeSocialRecord> {
  const RedeSocialRecordDocumentEquality();

  @override
  bool equals(RedeSocialRecord? e1, RedeSocialRecord? e2) {
    return e1?.arroboDaRedeSocial == e2?.arroboDaRedeSocial &&
        e1?.nomeRedeSocial == e2?.nomeRedeSocial &&
        e1?.logoRedeSocial == e2?.logoRedeSocial;
  }

  @override
  int hash(RedeSocialRecord? e) => const ListEquality()
      .hash([e?.arroboDaRedeSocial, e?.nomeRedeSocial, e?.logoRedeSocial]);

  @override
  bool isValidKey(Object? o) => o is RedeSocialRecord;
}
