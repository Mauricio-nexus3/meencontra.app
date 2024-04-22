import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnderecoRecord extends FirestoreRecord {
  EnderecoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "GoogleMaps" field.
  LatLng? _googleMaps;
  LatLng? get googleMaps => _googleMaps;
  bool hasGoogleMaps() => _googleMaps != null;

  // "Rua" field.
  String? _rua;
  String get rua => _rua ?? '';
  bool hasRua() => _rua != null;

  // "Numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  bool hasNumero() => _numero != null;

  // "Complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  bool hasComplemento() => _complemento != null;

  // "Bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  bool hasBairro() => _bairro != null;

  // "Cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "Uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  bool hasUf() => _uf != null;

  // "Cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "EnderecoCompleto" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _googleMaps = snapshotData['GoogleMaps'] as LatLng?;
    _rua = snapshotData['Rua'] as String?;
    _numero = snapshotData['Numero'] as String?;
    _complemento = snapshotData['Complemento'] as String?;
    _bairro = snapshotData['Bairro'] as String?;
    _cidade = snapshotData['Cidade'] as String?;
    _uf = snapshotData['Uf'] as String?;
    _cep = snapshotData['Cep'] as String?;
    _enderecoCompleto = snapshotData['EnderecoCompleto'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Endereco')
          : FirebaseFirestore.instance.collectionGroup('Endereco');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Endereco').doc(id);

  static Stream<EnderecoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnderecoRecord.fromSnapshot(s));

  static Future<EnderecoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnderecoRecord.fromSnapshot(s));

  static EnderecoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnderecoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnderecoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnderecoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnderecoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnderecoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnderecoRecordData({
  LatLng? googleMaps,
  String? rua,
  String? numero,
  String? complemento,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? enderecoCompleto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GoogleMaps': googleMaps,
      'Rua': rua,
      'Numero': numero,
      'Complemento': complemento,
      'Bairro': bairro,
      'Cidade': cidade,
      'Uf': uf,
      'Cep': cep,
      'EnderecoCompleto': enderecoCompleto,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnderecoRecordDocumentEquality implements Equality<EnderecoRecord> {
  const EnderecoRecordDocumentEquality();

  @override
  bool equals(EnderecoRecord? e1, EnderecoRecord? e2) {
    return e1?.googleMaps == e2?.googleMaps &&
        e1?.rua == e2?.rua &&
        e1?.numero == e2?.numero &&
        e1?.complemento == e2?.complemento &&
        e1?.bairro == e2?.bairro &&
        e1?.cidade == e2?.cidade &&
        e1?.uf == e2?.uf &&
        e1?.cep == e2?.cep &&
        e1?.enderecoCompleto == e2?.enderecoCompleto;
  }

  @override
  int hash(EnderecoRecord? e) => const ListEquality().hash([
        e?.googleMaps,
        e?.rua,
        e?.numero,
        e?.complemento,
        e?.bairro,
        e?.cidade,
        e?.uf,
        e?.cep,
        e?.enderecoCompleto
      ]);

  @override
  bool isValidKey(Object? o) => o is EnderecoRecord;
}
