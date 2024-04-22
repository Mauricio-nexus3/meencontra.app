import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelatorioRecord extends FirestoreRecord {
  RelatorioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ConversasWhatsapp" field.
  double? _conversasWhatsapp;
  double get conversasWhatsapp => _conversasWhatsapp ?? 0.0;
  bool hasConversasWhatsapp() => _conversasWhatsapp != null;

  // "Ligacaoes" field.
  double? _ligacaoes;
  double get ligacaoes => _ligacaoes ?? 0.0;
  bool hasLigacaoes() => _ligacaoes != null;

  // "visualizacaoMapa" field.
  double? _visualizacaoMapa;
  double get visualizacaoMapa => _visualizacaoMapa ?? 0.0;
  bool hasVisualizacaoMapa() => _visualizacaoMapa != null;

  // "visualizacaoPagina" field.
  double? _visualizacaoPagina;
  double get visualizacaoPagina => _visualizacaoPagina ?? 0.0;
  bool hasVisualizacaoPagina() => _visualizacaoPagina != null;

  // "AidRef" field.
  String? _aidRef;
  String get aidRef => _aidRef ?? '';
  bool hasAidRef() => _aidRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _conversasWhatsapp = castToType<double>(snapshotData['ConversasWhatsapp']);
    _ligacaoes = castToType<double>(snapshotData['Ligacaoes']);
    _visualizacaoMapa = castToType<double>(snapshotData['visualizacaoMapa']);
    _visualizacaoPagina =
        castToType<double>(snapshotData['visualizacaoPagina']);
    _aidRef = snapshotData['AidRef'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Relatorio')
          : FirebaseFirestore.instance.collectionGroup('Relatorio');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Relatorio').doc(id);

  static Stream<RelatorioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelatorioRecord.fromSnapshot(s));

  static Future<RelatorioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelatorioRecord.fromSnapshot(s));

  static RelatorioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelatorioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelatorioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelatorioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelatorioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelatorioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelatorioRecordData({
  double? conversasWhatsapp,
  double? ligacaoes,
  double? visualizacaoMapa,
  double? visualizacaoPagina,
  String? aidRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ConversasWhatsapp': conversasWhatsapp,
      'Ligacaoes': ligacaoes,
      'visualizacaoMapa': visualizacaoMapa,
      'visualizacaoPagina': visualizacaoPagina,
      'AidRef': aidRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelatorioRecordDocumentEquality implements Equality<RelatorioRecord> {
  const RelatorioRecordDocumentEquality();

  @override
  bool equals(RelatorioRecord? e1, RelatorioRecord? e2) {
    return e1?.conversasWhatsapp == e2?.conversasWhatsapp &&
        e1?.ligacaoes == e2?.ligacaoes &&
        e1?.visualizacaoMapa == e2?.visualizacaoMapa &&
        e1?.visualizacaoPagina == e2?.visualizacaoPagina &&
        e1?.aidRef == e2?.aidRef;
  }

  @override
  int hash(RelatorioRecord? e) => const ListEquality().hash([
        e?.conversasWhatsapp,
        e?.ligacaoes,
        e?.visualizacaoMapa,
        e?.visualizacaoPagina,
        e?.aidRef
      ]);

  @override
  bool isValidKey(Object? o) => o is RelatorioRecord;
}
