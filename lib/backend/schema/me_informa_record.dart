import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeInformaRecord extends FirestoreRecord {
  MeInformaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LogoImprensa" field.
  String? _logoImprensa;
  String get logoImprensa => _logoImprensa ?? '';
  bool hasLogoImprensa() => _logoImprensa != null;

  // "NomeImprensa" field.
  String? _nomeImprensa;
  String get nomeImprensa => _nomeImprensa ?? '';
  bool hasNomeImprensa() => _nomeImprensa != null;

  // "UsuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "NomeUsuario_Referencia" field.
  String? _nomeUsuarioReferencia;
  String get nomeUsuarioReferencia => _nomeUsuarioReferencia ?? '';
  bool hasNomeUsuarioReferencia() => _nomeUsuarioReferencia != null;

  // "MateriasPublicadas" field.
  List<int>? _materiasPublicadas;
  List<int> get materiasPublicadas => _materiasPublicadas ?? const [];
  bool hasMateriasPublicadas() => _materiasPublicadas != null;

  void _initializeFields() {
    _logoImprensa = snapshotData['LogoImprensa'] as String?;
    _nomeImprensa = snapshotData['NomeImprensa'] as String?;
    _usuarioRef = snapshotData['UsuarioRef'] as DocumentReference?;
    _nomeUsuarioReferencia = snapshotData['NomeUsuario_Referencia'] as String?;
    _materiasPublicadas = getDataList(snapshotData['MateriasPublicadas']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meInforma');

  static Stream<MeInformaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeInformaRecord.fromSnapshot(s));

  static Future<MeInformaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeInformaRecord.fromSnapshot(s));

  static MeInformaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeInformaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeInformaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeInformaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeInformaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeInformaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeInformaRecordData({
  String? logoImprensa,
  String? nomeImprensa,
  DocumentReference? usuarioRef,
  String? nomeUsuarioReferencia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LogoImprensa': logoImprensa,
      'NomeImprensa': nomeImprensa,
      'UsuarioRef': usuarioRef,
      'NomeUsuario_Referencia': nomeUsuarioReferencia,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeInformaRecordDocumentEquality implements Equality<MeInformaRecord> {
  const MeInformaRecordDocumentEquality();

  @override
  bool equals(MeInformaRecord? e1, MeInformaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logoImprensa == e2?.logoImprensa &&
        e1?.nomeImprensa == e2?.nomeImprensa &&
        e1?.usuarioRef == e2?.usuarioRef &&
        e1?.nomeUsuarioReferencia == e2?.nomeUsuarioReferencia &&
        listEquality.equals(e1?.materiasPublicadas, e2?.materiasPublicadas);
  }

  @override
  int hash(MeInformaRecord? e) => const ListEquality().hash([
        e?.logoImprensa,
        e?.nomeImprensa,
        e?.usuarioRef,
        e?.nomeUsuarioReferencia,
        e?.materiasPublicadas
      ]);

  @override
  bool isValidKey(Object? o) => o is MeInformaRecord;
}
