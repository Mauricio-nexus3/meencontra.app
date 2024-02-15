import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorarioAtendimentoRecord extends FirestoreRecord {
  HorarioAtendimentoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HoraAbre" field.
  DateTime? _horaAbre;
  DateTime? get horaAbre => _horaAbre;
  bool hasHoraAbre() => _horaAbre != null;

  // "HoraFecha" field.
  DateTime? _horaFecha;
  DateTime? get horaFecha => _horaFecha;
  bool hasHoraFecha() => _horaFecha != null;

  // "Dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  bool hasDia() => _dia != null;

  // "Periodo" field.
  String? _periodo;
  String get periodo => _periodo ?? '';
  bool hasPeriodo() => _periodo != null;

  // "UltraPassaMeiaNoite" field.
  bool? _ultraPassaMeiaNoite;
  bool get ultraPassaMeiaNoite => _ultraPassaMeiaNoite ?? false;
  bool hasUltraPassaMeiaNoite() => _ultraPassaMeiaNoite != null;

  // "is24hrs" field.
  bool? _is24hrs;
  bool get is24hrs => _is24hrs ?? false;
  bool hasIs24hrs() => _is24hrs != null;

  // "DiaSemana" field.
  int? _diaSemana;
  int get diaSemana => _diaSemana ?? 0;
  bool hasDiaSemana() => _diaSemana != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _horaAbre = snapshotData['HoraAbre'] as DateTime?;
    _horaFecha = snapshotData['HoraFecha'] as DateTime?;
    _dia = snapshotData['Dia'] as String?;
    _periodo = snapshotData['Periodo'] as String?;
    _ultraPassaMeiaNoite = snapshotData['UltraPassaMeiaNoite'] as bool?;
    _is24hrs = snapshotData['is24hrs'] as bool?;
    _diaSemana = castToType<int>(snapshotData['DiaSemana']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('horarioAtendimento')
          : FirebaseFirestore.instance.collectionGroup('horarioAtendimento');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('horarioAtendimento').doc(id);

  static Stream<HorarioAtendimentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HorarioAtendimentoRecord.fromSnapshot(s));

  static Future<HorarioAtendimentoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HorarioAtendimentoRecord.fromSnapshot(s));

  static HorarioAtendimentoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HorarioAtendimentoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HorarioAtendimentoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HorarioAtendimentoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HorarioAtendimentoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HorarioAtendimentoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHorarioAtendimentoRecordData({
  DateTime? horaAbre,
  DateTime? horaFecha,
  String? dia,
  String? periodo,
  bool? ultraPassaMeiaNoite,
  bool? is24hrs,
  int? diaSemana,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HoraAbre': horaAbre,
      'HoraFecha': horaFecha,
      'Dia': dia,
      'Periodo': periodo,
      'UltraPassaMeiaNoite': ultraPassaMeiaNoite,
      'is24hrs': is24hrs,
      'DiaSemana': diaSemana,
    }.withoutNulls,
  );

  return firestoreData;
}

class HorarioAtendimentoRecordDocumentEquality
    implements Equality<HorarioAtendimentoRecord> {
  const HorarioAtendimentoRecordDocumentEquality();

  @override
  bool equals(HorarioAtendimentoRecord? e1, HorarioAtendimentoRecord? e2) {
    return e1?.horaAbre == e2?.horaAbre &&
        e1?.horaFecha == e2?.horaFecha &&
        e1?.dia == e2?.dia &&
        e1?.periodo == e2?.periodo &&
        e1?.ultraPassaMeiaNoite == e2?.ultraPassaMeiaNoite &&
        e1?.is24hrs == e2?.is24hrs &&
        e1?.diaSemana == e2?.diaSemana;
  }

  @override
  int hash(HorarioAtendimentoRecord? e) => const ListEquality().hash([
        e?.horaAbre,
        e?.horaFecha,
        e?.dia,
        e?.periodo,
        e?.ultraPassaMeiaNoite,
        e?.is24hrs,
        e?.diaSemana
      ]);

  @override
  bool isValidKey(Object? o) => o is HorarioAtendimentoRecord;
}
