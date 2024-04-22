import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacaoRecord extends FirestoreRecord {
  NotificacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "assunto" field.
  String? _assunto;
  String get assunto => _assunto ?? '';
  bool hasAssunto() => _assunto != null;

  // "destino" field.
  String? _destino;
  String get destino => _destino ?? '';
  bool hasDestino() => _destino != null;

  // "versao" field.
  String? _versao;
  String get versao => _versao ?? '';
  bool hasVersao() => _versao != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _assunto = snapshotData['assunto'] as String?;
    _destino = snapshotData['destino'] as String?;
    _versao = snapshotData['versao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacao');

  static Stream<NotificacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacaoRecord.fromSnapshot(s));

  static Future<NotificacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacaoRecord.fromSnapshot(s));

  static NotificacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacaoRecordData({
  String? titulo,
  String? descricao,
  DateTime? dataCriacao,
  String? assunto,
  String? destino,
  String? versao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descricao': descricao,
      'data_criacao': dataCriacao,
      'assunto': assunto,
      'destino': destino,
      'versao': versao,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacaoRecordDocumentEquality implements Equality<NotificacaoRecord> {
  const NotificacaoRecordDocumentEquality();

  @override
  bool equals(NotificacaoRecord? e1, NotificacaoRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.assunto == e2?.assunto &&
        e1?.destino == e2?.destino &&
        e1?.versao == e2?.versao;
  }

  @override
  int hash(NotificacaoRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.descricao,
        e?.dataCriacao,
        e?.assunto,
        e?.destino,
        e?.versao
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacaoRecord;
}
