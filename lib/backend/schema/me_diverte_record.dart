import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeDiverteRecord extends FirestoreRecord {
  MeDiverteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagemCapa" field.
  String? _imagemCapa;
  String get imagemCapa => _imagemCapa ?? '';
  bool hasImagemCapa() => _imagemCapa != null;

  // "NomeEvento" field.
  String? _nomeEvento;
  String get nomeEvento => _nomeEvento ?? '';
  bool hasNomeEvento() => _nomeEvento != null;

  // "sobre" field.
  String? _sobre;
  String get sobre => _sobre ?? '';
  bool hasSobre() => _sobre != null;

  // "tipoEvento" field.
  String? _tipoEvento;
  String get tipoEvento => _tipoEvento ?? '';
  bool hasTipoEvento() => _tipoEvento != null;

  // "Local" field.
  String? _local;
  String get local => _local ?? '';
  bool hasLocal() => _local != null;

  // "LocalizacaoGoogleMaps" field.
  LatLng? _localizacaoGoogleMaps;
  LatLng? get localizacaoGoogleMaps => _localizacaoGoogleMaps;
  bool hasLocalizacaoGoogleMaps() => _localizacaoGoogleMaps != null;

  // "Data_Hora" field.
  DateTime? _dataHora;
  DateTime? get dataHora => _dataHora;
  bool hasDataHora() => _dataHora != null;

  // "IngressoURL" field.
  String? _ingressoURL;
  String get ingressoURL => _ingressoURL ?? '';
  bool hasIngressoURL() => _ingressoURL != null;

  // "PlataformaTicket" field.
  String? _plataformaTicket;
  String get plataformaTicket => _plataformaTicket ?? '';
  bool hasPlataformaTicket() => _plataformaTicket != null;

  // "numeroVisualizacoes" field.
  double? _numeroVisualizacoes;
  double get numeroVisualizacoes => _numeroVisualizacoes ?? 0.0;
  bool hasNumeroVisualizacoes() => _numeroVisualizacoes != null;

  // "notificacaoEnviada" field.
  bool? _notificacaoEnviada;
  bool get notificacaoEnviada => _notificacaoEnviada ?? false;
  bool hasNotificacaoEnviada() => _notificacaoEnviada != null;

  void _initializeFields() {
    _imagemCapa = snapshotData['imagemCapa'] as String?;
    _nomeEvento = snapshotData['NomeEvento'] as String?;
    _sobre = snapshotData['sobre'] as String?;
    _tipoEvento = snapshotData['tipoEvento'] as String?;
    _local = snapshotData['Local'] as String?;
    _localizacaoGoogleMaps = snapshotData['LocalizacaoGoogleMaps'] as LatLng?;
    _dataHora = snapshotData['Data_Hora'] as DateTime?;
    _ingressoURL = snapshotData['IngressoURL'] as String?;
    _plataformaTicket = snapshotData['PlataformaTicket'] as String?;
    _numeroVisualizacoes =
        castToType<double>(snapshotData['numeroVisualizacoes']);
    _notificacaoEnviada = snapshotData['notificacaoEnviada'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meDiverte');

  static Stream<MeDiverteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeDiverteRecord.fromSnapshot(s));

  static Future<MeDiverteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeDiverteRecord.fromSnapshot(s));

  static MeDiverteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeDiverteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeDiverteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeDiverteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeDiverteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeDiverteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeDiverteRecordData({
  String? imagemCapa,
  String? nomeEvento,
  String? sobre,
  String? tipoEvento,
  String? local,
  LatLng? localizacaoGoogleMaps,
  DateTime? dataHora,
  String? ingressoURL,
  String? plataformaTicket,
  double? numeroVisualizacoes,
  bool? notificacaoEnviada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagemCapa': imagemCapa,
      'NomeEvento': nomeEvento,
      'sobre': sobre,
      'tipoEvento': tipoEvento,
      'Local': local,
      'LocalizacaoGoogleMaps': localizacaoGoogleMaps,
      'Data_Hora': dataHora,
      'IngressoURL': ingressoURL,
      'PlataformaTicket': plataformaTicket,
      'numeroVisualizacoes': numeroVisualizacoes,
      'notificacaoEnviada': notificacaoEnviada,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeDiverteRecordDocumentEquality implements Equality<MeDiverteRecord> {
  const MeDiverteRecordDocumentEquality();

  @override
  bool equals(MeDiverteRecord? e1, MeDiverteRecord? e2) {
    return e1?.imagemCapa == e2?.imagemCapa &&
        e1?.nomeEvento == e2?.nomeEvento &&
        e1?.sobre == e2?.sobre &&
        e1?.tipoEvento == e2?.tipoEvento &&
        e1?.local == e2?.local &&
        e1?.localizacaoGoogleMaps == e2?.localizacaoGoogleMaps &&
        e1?.dataHora == e2?.dataHora &&
        e1?.ingressoURL == e2?.ingressoURL &&
        e1?.plataformaTicket == e2?.plataformaTicket &&
        e1?.numeroVisualizacoes == e2?.numeroVisualizacoes &&
        e1?.notificacaoEnviada == e2?.notificacaoEnviada;
  }

  @override
  int hash(MeDiverteRecord? e) => const ListEquality().hash([
        e?.imagemCapa,
        e?.nomeEvento,
        e?.sobre,
        e?.tipoEvento,
        e?.local,
        e?.localizacaoGoogleMaps,
        e?.dataHora,
        e?.ingressoURL,
        e?.plataformaTicket,
        e?.numeroVisualizacoes,
        e?.notificacaoEnviada
      ]);

  @override
  bool isValidKey(Object? o) => o is MeDiverteRecord;
}
