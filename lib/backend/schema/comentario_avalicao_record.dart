import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentarioAvalicaoRecord extends FirestoreRecord {
  ComentarioAvalicaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Comentario" field.
  String? _comentario;
  String get comentario => _comentario ?? '';
  bool hasComentario() => _comentario != null;

  // "NotaIndividual" field.
  double? _notaIndividual;
  double get notaIndividual => _notaIndividual ?? 0.0;
  bool hasNotaIndividual() => _notaIndividual != null;

  // "NotaQnt" field.
  int? _notaQnt;
  int get notaQnt => _notaQnt ?? 0;
  bool hasNotaQnt() => _notaQnt != null;

  // "ComentadoPor" field.
  DocumentReference? _comentadoPor;
  DocumentReference? get comentadoPor => _comentadoPor;
  bool hasComentadoPor() => _comentadoPor != null;

  // "ComentadoNoDIA" field.
  DateTime? _comentadoNoDIA;
  DateTime? get comentadoNoDIA => _comentadoNoDIA;
  bool hasComentadoNoDIA() => _comentadoNoDIA != null;

  // "SomaDasNotasFORMATOteste" field.
  String? _somaDasNotasFORMATOteste;
  String get somaDasNotasFORMATOteste => _somaDasNotasFORMATOteste ?? '';
  bool hasSomaDasNotasFORMATOteste() => _somaDasNotasFORMATOteste != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comentario = snapshotData['Comentario'] as String?;
    _notaIndividual = castToType<double>(snapshotData['NotaIndividual']);
    _notaQnt = castToType<int>(snapshotData['NotaQnt']);
    _comentadoPor = snapshotData['ComentadoPor'] as DocumentReference?;
    _comentadoNoDIA = snapshotData['ComentadoNoDIA'] as DateTime?;
    _somaDasNotasFORMATOteste =
        snapshotData['SomaDasNotasFORMATOteste'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ComentarioAvalicao')
          : FirebaseFirestore.instance.collectionGroup('ComentarioAvalicao');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ComentarioAvalicao').doc(id);

  static Stream<ComentarioAvalicaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentarioAvalicaoRecord.fromSnapshot(s));

  static Future<ComentarioAvalicaoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ComentarioAvalicaoRecord.fromSnapshot(s));

  static ComentarioAvalicaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentarioAvalicaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentarioAvalicaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentarioAvalicaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentarioAvalicaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentarioAvalicaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentarioAvalicaoRecordData({
  String? comentario,
  double? notaIndividual,
  int? notaQnt,
  DocumentReference? comentadoPor,
  DateTime? comentadoNoDIA,
  String? somaDasNotasFORMATOteste,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Comentario': comentario,
      'NotaIndividual': notaIndividual,
      'NotaQnt': notaQnt,
      'ComentadoPor': comentadoPor,
      'ComentadoNoDIA': comentadoNoDIA,
      'SomaDasNotasFORMATOteste': somaDasNotasFORMATOteste,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentarioAvalicaoRecordDocumentEquality
    implements Equality<ComentarioAvalicaoRecord> {
  const ComentarioAvalicaoRecordDocumentEquality();

  @override
  bool equals(ComentarioAvalicaoRecord? e1, ComentarioAvalicaoRecord? e2) {
    return e1?.comentario == e2?.comentario &&
        e1?.notaIndividual == e2?.notaIndividual &&
        e1?.notaQnt == e2?.notaQnt &&
        e1?.comentadoPor == e2?.comentadoPor &&
        e1?.comentadoNoDIA == e2?.comentadoNoDIA &&
        e1?.somaDasNotasFORMATOteste == e2?.somaDasNotasFORMATOteste;
  }

  @override
  int hash(ComentarioAvalicaoRecord? e) => const ListEquality().hash([
        e?.comentario,
        e?.notaIndividual,
        e?.notaQnt,
        e?.comentadoPor,
        e?.comentadoNoDIA,
        e?.somaDasNotasFORMATOteste
      ]);

  @override
  bool isValidKey(Object? o) => o is ComentarioAvalicaoRecord;
}
