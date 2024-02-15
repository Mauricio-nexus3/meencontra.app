import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarrinhoRecord extends FirestoreRecord {
  CarrinhoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userComprador" field.
  DocumentReference? _userComprador;
  DocumentReference? get userComprador => _userComprador;
  bool hasUserComprador() => _userComprador != null;

  // "anuncianteRef" field.
  DocumentReference? _anuncianteRef;
  DocumentReference? get anuncianteRef => _anuncianteRef;
  bool hasAnuncianteRef() => _anuncianteRef != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  void _initializeFields() {
    _userComprador = snapshotData['userComprador'] as DocumentReference?;
    _anuncianteRef = snapshotData['anuncianteRef'] as DocumentReference?;
    _total = castToType<double>(snapshotData['total']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carrinho');

  static Stream<CarrinhoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarrinhoRecord.fromSnapshot(s));

  static Future<CarrinhoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarrinhoRecord.fromSnapshot(s));

  static CarrinhoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarrinhoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarrinhoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarrinhoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarrinhoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarrinhoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarrinhoRecordData({
  DocumentReference? userComprador,
  DocumentReference? anuncianteRef,
  double? total,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userComprador': userComprador,
      'anuncianteRef': anuncianteRef,
      'total': total,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarrinhoRecordDocumentEquality implements Equality<CarrinhoRecord> {
  const CarrinhoRecordDocumentEquality();

  @override
  bool equals(CarrinhoRecord? e1, CarrinhoRecord? e2) {
    return e1?.userComprador == e2?.userComprador &&
        e1?.anuncianteRef == e2?.anuncianteRef &&
        e1?.total == e2?.total;
  }

  @override
  int hash(CarrinhoRecord? e) =>
      const ListEquality().hash([e?.userComprador, e?.anuncianteRef, e?.total]);

  @override
  bool isValidKey(Object? o) => o is CarrinhoRecord;
}
