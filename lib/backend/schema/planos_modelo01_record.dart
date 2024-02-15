import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanosModelo01Record extends FirestoreRecord {
  PlanosModelo01Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Premium" field.
  bool? _premium;
  bool get premium => _premium ?? false;
  bool hasPremium() => _premium != null;

  // "Essencial" field.
  bool? _essencial;
  bool get essencial => _essencial ?? false;
  bool hasEssencial() => _essencial != null;

  // "Basico" field.
  bool? _basico;
  bool get basico => _basico ?? false;
  bool hasBasico() => _basico != null;

  // "NomeAnunciante" field.
  String? _nomeAnunciante;
  String get nomeAnunciante => _nomeAnunciante ?? '';
  bool hasNomeAnunciante() => _nomeAnunciante != null;

  // "refAnunciante" field.
  DocumentReference? _refAnunciante;
  DocumentReference? get refAnunciante => _refAnunciante;
  bool hasRefAnunciante() => _refAnunciante != null;

  void _initializeFields() {
    _premium = snapshotData['Premium'] as bool?;
    _essencial = snapshotData['Essencial'] as bool?;
    _basico = snapshotData['Basico'] as bool?;
    _nomeAnunciante = snapshotData['NomeAnunciante'] as String?;
    _refAnunciante = snapshotData['refAnunciante'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PlanosModelo01');

  static Stream<PlanosModelo01Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanosModelo01Record.fromSnapshot(s));

  static Future<PlanosModelo01Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanosModelo01Record.fromSnapshot(s));

  static PlanosModelo01Record fromSnapshot(DocumentSnapshot snapshot) =>
      PlanosModelo01Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanosModelo01Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanosModelo01Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanosModelo01Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanosModelo01Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanosModelo01RecordData({
  bool? premium,
  bool? essencial,
  bool? basico,
  String? nomeAnunciante,
  DocumentReference? refAnunciante,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Premium': premium,
      'Essencial': essencial,
      'Basico': basico,
      'NomeAnunciante': nomeAnunciante,
      'refAnunciante': refAnunciante,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanosModelo01RecordDocumentEquality
    implements Equality<PlanosModelo01Record> {
  const PlanosModelo01RecordDocumentEquality();

  @override
  bool equals(PlanosModelo01Record? e1, PlanosModelo01Record? e2) {
    return e1?.premium == e2?.premium &&
        e1?.essencial == e2?.essencial &&
        e1?.basico == e2?.basico &&
        e1?.nomeAnunciante == e2?.nomeAnunciante &&
        e1?.refAnunciante == e2?.refAnunciante;
  }

  @override
  int hash(PlanosModelo01Record? e) => const ListEquality().hash([
        e?.premium,
        e?.essencial,
        e?.basico,
        e?.nomeAnunciante,
        e?.refAnunciante
      ]);

  @override
  bool isValidKey(Object? o) => o is PlanosModelo01Record;
}
