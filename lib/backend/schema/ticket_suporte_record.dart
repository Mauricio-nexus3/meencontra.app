import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketSuporteRecord extends FirestoreRecord {
  TicketSuporteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Topico" field.
  String? _topico;
  String get topico => _topico ?? '';
  bool hasTopico() => _topico != null;

  // "Assunto" field.
  String? _assunto;
  String get assunto => _assunto ?? '';
  bool hasAssunto() => _assunto != null;

  // "Conteudo" field.
  String? _conteudo;
  String get conteudo => _conteudo ?? '';
  bool hasConteudo() => _conteudo != null;

  // "PrintTela" field.
  String? _printTela;
  String get printTela => _printTela ?? '';
  bool hasPrintTela() => _printTela != null;

  // "Ticket" field.
  String? _ticket;
  String get ticket => _ticket ?? '';
  bool hasTicket() => _ticket != null;

  // "Usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  bool hasUsuario() => _usuario != null;

  // "UsuarioRef" field.
  DocumentReference? _usuarioRef;
  DocumentReference? get usuarioRef => _usuarioRef;
  bool hasUsuarioRef() => _usuarioRef != null;

  // "Whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Resolvido" field.
  bool? _resolvido;
  bool get resolvido => _resolvido ?? false;
  bool hasResolvido() => _resolvido != null;

  // "dataTicket" field.
  DateTime? _dataTicket;
  DateTime? get dataTicket => _dataTicket;
  bool hasDataTicket() => _dataTicket != null;

  // "ConclusaoTicket" field.
  DateTime? _conclusaoTicket;
  DateTime? get conclusaoTicket => _conclusaoTicket;
  bool hasConclusaoTicket() => _conclusaoTicket != null;

  void _initializeFields() {
    _topico = snapshotData['Topico'] as String?;
    _assunto = snapshotData['Assunto'] as String?;
    _conteudo = snapshotData['Conteudo'] as String?;
    _printTela = snapshotData['PrintTela'] as String?;
    _ticket = snapshotData['Ticket'] as String?;
    _usuario = snapshotData['Usuario'] as String?;
    _usuarioRef = snapshotData['UsuarioRef'] as DocumentReference?;
    _whatsapp = snapshotData['Whatsapp'] as String?;
    _email = snapshotData['Email'] as String?;
    _resolvido = snapshotData['Resolvido'] as bool?;
    _dataTicket = snapshotData['dataTicket'] as DateTime?;
    _conclusaoTicket = snapshotData['ConclusaoTicket'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TicketSuporte');

  static Stream<TicketSuporteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketSuporteRecord.fromSnapshot(s));

  static Future<TicketSuporteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketSuporteRecord.fromSnapshot(s));

  static TicketSuporteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketSuporteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketSuporteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketSuporteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketSuporteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketSuporteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketSuporteRecordData({
  String? topico,
  String? assunto,
  String? conteudo,
  String? printTela,
  String? ticket,
  String? usuario,
  DocumentReference? usuarioRef,
  String? whatsapp,
  String? email,
  bool? resolvido,
  DateTime? dataTicket,
  DateTime? conclusaoTicket,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Topico': topico,
      'Assunto': assunto,
      'Conteudo': conteudo,
      'PrintTela': printTela,
      'Ticket': ticket,
      'Usuario': usuario,
      'UsuarioRef': usuarioRef,
      'Whatsapp': whatsapp,
      'Email': email,
      'Resolvido': resolvido,
      'dataTicket': dataTicket,
      'ConclusaoTicket': conclusaoTicket,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketSuporteRecordDocumentEquality
    implements Equality<TicketSuporteRecord> {
  const TicketSuporteRecordDocumentEquality();

  @override
  bool equals(TicketSuporteRecord? e1, TicketSuporteRecord? e2) {
    return e1?.topico == e2?.topico &&
        e1?.assunto == e2?.assunto &&
        e1?.conteudo == e2?.conteudo &&
        e1?.printTela == e2?.printTela &&
        e1?.ticket == e2?.ticket &&
        e1?.usuario == e2?.usuario &&
        e1?.usuarioRef == e2?.usuarioRef &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.email == e2?.email &&
        e1?.resolvido == e2?.resolvido &&
        e1?.dataTicket == e2?.dataTicket &&
        e1?.conclusaoTicket == e2?.conclusaoTicket;
  }

  @override
  int hash(TicketSuporteRecord? e) => const ListEquality().hash([
        e?.topico,
        e?.assunto,
        e?.conteudo,
        e?.printTela,
        e?.ticket,
        e?.usuario,
        e?.usuarioRef,
        e?.whatsapp,
        e?.email,
        e?.resolvido,
        e?.dataTicket,
        e?.conclusaoTicket
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketSuporteRecord;
}
