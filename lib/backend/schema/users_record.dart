import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "codigoAtivacao" field.
  String? _codigoAtivacao;
  String get codigoAtivacao => _codigoAtivacao ?? '';
  bool hasCodigoAtivacao() => _codigoAtivacao != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isAnunciante" field.
  bool? _isAnunciante;
  bool get isAnunciante => _isAnunciante ?? false;
  bool hasIsAnunciante() => _isAnunciante != null;

  // "cadastroAnunciante_Andamento" field.
  bool? _cadastroAnuncianteAndamento;
  bool get cadastroAnuncianteAndamento => _cadastroAnuncianteAndamento ?? false;
  bool hasCadastroAnuncianteAndamento() => _cadastroAnuncianteAndamento != null;

  // "StatusCadastroAnunciante" field.
  String? _statusCadastroAnunciante;
  String get statusCadastroAnunciante => _statusCadastroAnunciante ?? '';
  bool hasStatusCadastroAnunciante() => _statusCadastroAnunciante != null;

  // "IsImprensa" field.
  bool? _isImprensa;
  bool get isImprensa => _isImprensa ?? false;
  bool hasIsImprensa() => _isImprensa != null;

  // "liAceitoTermosPrivacidade" field.
  bool? _liAceitoTermosPrivacidade;
  bool get liAceitoTermosPrivacidade => _liAceitoTermosPrivacidade ?? false;
  bool hasLiAceitoTermosPrivacidade() => _liAceitoTermosPrivacidade != null;

  // "Genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "Localidade" field.
  String? _localidade;
  String get localidade => _localidade ?? '';
  bool hasLocalidade() => _localidade != null;

  // "Perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "ID_user" field.
  String? _iDUser;
  String get iDUser => _iDUser ?? '';
  bool hasIDUser() => _iDUser != null;

  // "is_tracked" field.
  bool? _isTracked;
  bool get isTracked => _isTracked ?? false;
  bool hasIsTracked() => _isTracked != null;

  // "uuid_tracking" field.
  String? _uuidTracking;
  String get uuidTracking => _uuidTracking ?? '';
  bool hasUuidTracking() => _uuidTracking != null;

  // "ultima_notificao_lida" field.
  DateTime? _ultimaNotificaoLida;
  DateTime? get ultimaNotificaoLida => _ultimaNotificaoLida;
  bool hasUltimaNotificaoLida() => _ultimaNotificaoLida != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _codigoAtivacao = snapshotData['codigoAtivacao'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isAnunciante = snapshotData['isAnunciante'] as bool?;
    _cadastroAnuncianteAndamento =
        snapshotData['cadastroAnunciante_Andamento'] as bool?;
    _statusCadastroAnunciante =
        snapshotData['StatusCadastroAnunciante'] as String?;
    _isImprensa = snapshotData['IsImprensa'] as bool?;
    _liAceitoTermosPrivacidade =
        snapshotData['liAceitoTermosPrivacidade'] as bool?;
    _genero = snapshotData['Genero'] as String?;
    _localidade = snapshotData['Localidade'] as String?;
    _perfil = snapshotData['Perfil'] as String?;
    _iDUser = snapshotData['ID_user'] as String?;
    _isTracked = snapshotData['is_tracked'] as bool?;
    _uuidTracking = snapshotData['uuid_tracking'] as String?;
    _ultimaNotificaoLida = snapshotData['ultima_notificao_lida'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? codigoAtivacao,
  String? whatsapp,
  String? displayName,
  String? phoneNumber,
  bool? isAnunciante,
  bool? cadastroAnuncianteAndamento,
  String? statusCadastroAnunciante,
  bool? isImprensa,
  bool? liAceitoTermosPrivacidade,
  String? genero,
  String? localidade,
  String? perfil,
  String? iDUser,
  bool? isTracked,
  String? uuidTracking,
  DateTime? ultimaNotificaoLida,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'codigoAtivacao': codigoAtivacao,
      'whatsapp': whatsapp,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'isAnunciante': isAnunciante,
      'cadastroAnunciante_Andamento': cadastroAnuncianteAndamento,
      'StatusCadastroAnunciante': statusCadastroAnunciante,
      'IsImprensa': isImprensa,
      'liAceitoTermosPrivacidade': liAceitoTermosPrivacidade,
      'Genero': genero,
      'Localidade': localidade,
      'Perfil': perfil,
      'ID_user': iDUser,
      'is_tracked': isTracked,
      'uuid_tracking': uuidTracking,
      'ultima_notificao_lida': ultimaNotificaoLida,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.codigoAtivacao == e2?.codigoAtivacao &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isAnunciante == e2?.isAnunciante &&
        e1?.cadastroAnuncianteAndamento == e2?.cadastroAnuncianteAndamento &&
        e1?.statusCadastroAnunciante == e2?.statusCadastroAnunciante &&
        e1?.isImprensa == e2?.isImprensa &&
        e1?.liAceitoTermosPrivacidade == e2?.liAceitoTermosPrivacidade &&
        e1?.genero == e2?.genero &&
        e1?.localidade == e2?.localidade &&
        e1?.perfil == e2?.perfil &&
        e1?.iDUser == e2?.iDUser &&
        e1?.isTracked == e2?.isTracked &&
        e1?.uuidTracking == e2?.uuidTracking &&
        e1?.ultimaNotificaoLida == e2?.ultimaNotificaoLida;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.codigoAtivacao,
        e?.whatsapp,
        e?.displayName,
        e?.phoneNumber,
        e?.isAnunciante,
        e?.cadastroAnuncianteAndamento,
        e?.statusCadastroAnunciante,
        e?.isImprensa,
        e?.liAceitoTermosPrivacidade,
        e?.genero,
        e?.localidade,
        e?.perfil,
        e?.iDUser,
        e?.isTracked,
        e?.uuidTracking,
        e?.ultimaNotificaoLida
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
