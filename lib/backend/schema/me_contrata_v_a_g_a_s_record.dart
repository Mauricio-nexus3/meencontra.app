import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeContrataVAGASRecord extends FirestoreRecord {
  MeContrataVAGASRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LogoEmpresa" field.
  String? _logoEmpresa;
  String get logoEmpresa => _logoEmpresa ?? '';
  bool hasLogoEmpresa() => _logoEmpresa != null;

  // "NomeEmpresa" field.
  String? _nomeEmpresa;
  String get nomeEmpresa => _nomeEmpresa ?? '';
  bool hasNomeEmpresa() => _nomeEmpresa != null;

  // "FoneEmpresa" field.
  String? _foneEmpresa;
  String get foneEmpresa => _foneEmpresa ?? '';
  bool hasFoneEmpresa() => _foneEmpresa != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "NomeUsuarioRef" field.
  String? _nomeUsuarioRef;
  String get nomeUsuarioRef => _nomeUsuarioRef ?? '';
  bool hasNomeUsuarioRef() => _nomeUsuarioRef != null;

  // "IsAnunciante" field.
  bool? _isAnunciante;
  bool get isAnunciante => _isAnunciante ?? false;
  bool hasIsAnunciante() => _isAnunciante != null;

  // "NomeVaga" field.
  String? _nomeVaga;
  String get nomeVaga => _nomeVaga ?? '';
  bool hasNomeVaga() => _nomeVaga != null;

  // "ContratoTrabalho" field.
  String? _contratoTrabalho;
  String get contratoTrabalho => _contratoTrabalho ?? '';
  bool hasContratoTrabalho() => _contratoTrabalho != null;

  // "RegimeCLTorCNPJ" field.
  String? _regimeCLTorCNPJ;
  String get regimeCLTorCNPJ => _regimeCLTorCNPJ ?? '';
  bool hasRegimeCLTorCNPJ() => _regimeCLTorCNPJ != null;

  // "Localidade" field.
  String? _localidade;
  String get localidade => _localidade ?? '';
  bool hasLocalidade() => _localidade != null;

  // "localidadeMap" field.
  LatLng? _localidadeMap;
  LatLng? get localidadeMap => _localidadeMap;
  bool hasLocalidadeMap() => _localidadeMap != null;

  // "Salario" field.
  String? _salario;
  String get salario => _salario ?? '';
  bool hasSalario() => _salario != null;

  // "Experiencia" field.
  String? _experiencia;
  String get experiencia => _experiencia ?? '';
  bool hasExperiencia() => _experiencia != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "Qualificacao" field.
  String? _qualificacao;
  String get qualificacao => _qualificacao ?? '';
  bool hasQualificacao() => _qualificacao != null;

  // "Beneficios" field.
  List<String>? _beneficios;
  List<String> get beneficios => _beneficios ?? const [];
  bool hasBeneficios() => _beneficios != null;

  // "Publicado" field.
  DateTime? _publicado;
  DateTime? get publicado => _publicado;
  bool hasPublicado() => _publicado != null;

  // "Validade" field.
  DateTime? _validade;
  DateTime? get validade => _validade;
  bool hasValidade() => _validade != null;

  // "Candidaturas" field.
  List<int>? _candidaturas;
  List<int> get candidaturas => _candidaturas ?? const [];
  bool hasCandidaturas() => _candidaturas != null;

  // "CandidatosRef" field.
  DocumentReference? _candidatosRef;
  DocumentReference? get candidatosRef => _candidatosRef;
  bool hasCandidatosRef() => _candidatosRef != null;

  // "NomeCandidato" field.
  String? _nomeCandidato;
  String get nomeCandidato => _nomeCandidato ?? '';
  bool hasNomeCandidato() => _nomeCandidato != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "URLexterno" field.
  String? _uRLexterno;
  String get uRLexterno => _uRLexterno ?? '';
  bool hasURLexterno() => _uRLexterno != null;

  // "numeroVisualizacoes" field.
  double? _numeroVisualizacoes;
  double get numeroVisualizacoes => _numeroVisualizacoes ?? 0.0;
  bool hasNumeroVisualizacoes() => _numeroVisualizacoes != null;

  // "notificacaoEnviada" field.
  bool? _notificacaoEnviada;
  bool get notificacaoEnviada => _notificacaoEnviada ?? false;
  bool hasNotificacaoEnviada() => _notificacaoEnviada != null;

  void _initializeFields() {
    _logoEmpresa = snapshotData['LogoEmpresa'] as String?;
    _nomeEmpresa = snapshotData['NomeEmpresa'] as String?;
    _foneEmpresa = snapshotData['FoneEmpresa'] as String?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _nomeUsuarioRef = snapshotData['NomeUsuarioRef'] as String?;
    _isAnunciante = snapshotData['IsAnunciante'] as bool?;
    _nomeVaga = snapshotData['NomeVaga'] as String?;
    _contratoTrabalho = snapshotData['ContratoTrabalho'] as String?;
    _regimeCLTorCNPJ = snapshotData['RegimeCLTorCNPJ'] as String?;
    _localidade = snapshotData['Localidade'] as String?;
    _localidadeMap = snapshotData['localidadeMap'] as LatLng?;
    _salario = snapshotData['Salario'] as String?;
    _experiencia = snapshotData['Experiencia'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _qualificacao = snapshotData['Qualificacao'] as String?;
    _beneficios = getDataList(snapshotData['Beneficios']);
    _publicado = snapshotData['Publicado'] as DateTime?;
    _validade = snapshotData['Validade'] as DateTime?;
    _candidaturas = getDataList(snapshotData['Candidaturas']);
    _candidatosRef = snapshotData['CandidatosRef'] as DocumentReference?;
    _nomeCandidato = snapshotData['NomeCandidato'] as String?;
    _status = snapshotData['Status'] as String?;
    _uRLexterno = snapshotData['URLexterno'] as String?;
    _numeroVisualizacoes =
        castToType<double>(snapshotData['numeroVisualizacoes']);
    _notificacaoEnviada = snapshotData['notificacaoEnviada'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meContrataVAGAS');

  static Stream<MeContrataVAGASRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeContrataVAGASRecord.fromSnapshot(s));

  static Future<MeContrataVAGASRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeContrataVAGASRecord.fromSnapshot(s));

  static MeContrataVAGASRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeContrataVAGASRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeContrataVAGASRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeContrataVAGASRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeContrataVAGASRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeContrataVAGASRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeContrataVAGASRecordData({
  String? logoEmpresa,
  String? nomeEmpresa,
  String? foneEmpresa,
  DocumentReference? userRef,
  String? nomeUsuarioRef,
  bool? isAnunciante,
  String? nomeVaga,
  String? contratoTrabalho,
  String? regimeCLTorCNPJ,
  String? localidade,
  LatLng? localidadeMap,
  String? salario,
  String? experiencia,
  String? descricao,
  String? qualificacao,
  DateTime? publicado,
  DateTime? validade,
  DocumentReference? candidatosRef,
  String? nomeCandidato,
  String? status,
  String? uRLexterno,
  double? numeroVisualizacoes,
  bool? notificacaoEnviada,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LogoEmpresa': logoEmpresa,
      'NomeEmpresa': nomeEmpresa,
      'FoneEmpresa': foneEmpresa,
      'UserRef': userRef,
      'NomeUsuarioRef': nomeUsuarioRef,
      'IsAnunciante': isAnunciante,
      'NomeVaga': nomeVaga,
      'ContratoTrabalho': contratoTrabalho,
      'RegimeCLTorCNPJ': regimeCLTorCNPJ,
      'Localidade': localidade,
      'localidadeMap': localidadeMap,
      'Salario': salario,
      'Experiencia': experiencia,
      'Descricao': descricao,
      'Qualificacao': qualificacao,
      'Publicado': publicado,
      'Validade': validade,
      'CandidatosRef': candidatosRef,
      'NomeCandidato': nomeCandidato,
      'Status': status,
      'URLexterno': uRLexterno,
      'numeroVisualizacoes': numeroVisualizacoes,
      'notificacaoEnviada': notificacaoEnviada,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeContrataVAGASRecordDocumentEquality
    implements Equality<MeContrataVAGASRecord> {
  const MeContrataVAGASRecordDocumentEquality();

  @override
  bool equals(MeContrataVAGASRecord? e1, MeContrataVAGASRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logoEmpresa == e2?.logoEmpresa &&
        e1?.nomeEmpresa == e2?.nomeEmpresa &&
        e1?.foneEmpresa == e2?.foneEmpresa &&
        e1?.userRef == e2?.userRef &&
        e1?.nomeUsuarioRef == e2?.nomeUsuarioRef &&
        e1?.isAnunciante == e2?.isAnunciante &&
        e1?.nomeVaga == e2?.nomeVaga &&
        e1?.contratoTrabalho == e2?.contratoTrabalho &&
        e1?.regimeCLTorCNPJ == e2?.regimeCLTorCNPJ &&
        e1?.localidade == e2?.localidade &&
        e1?.localidadeMap == e2?.localidadeMap &&
        e1?.salario == e2?.salario &&
        e1?.experiencia == e2?.experiencia &&
        e1?.descricao == e2?.descricao &&
        e1?.qualificacao == e2?.qualificacao &&
        listEquality.equals(e1?.beneficios, e2?.beneficios) &&
        e1?.publicado == e2?.publicado &&
        e1?.validade == e2?.validade &&
        listEquality.equals(e1?.candidaturas, e2?.candidaturas) &&
        e1?.candidatosRef == e2?.candidatosRef &&
        e1?.nomeCandidato == e2?.nomeCandidato &&
        e1?.status == e2?.status &&
        e1?.uRLexterno == e2?.uRLexterno &&
        e1?.numeroVisualizacoes == e2?.numeroVisualizacoes &&
        e1?.notificacaoEnviada == e2?.notificacaoEnviada;
  }

  @override
  int hash(MeContrataVAGASRecord? e) => const ListEquality().hash([
        e?.logoEmpresa,
        e?.nomeEmpresa,
        e?.foneEmpresa,
        e?.userRef,
        e?.nomeUsuarioRef,
        e?.isAnunciante,
        e?.nomeVaga,
        e?.contratoTrabalho,
        e?.regimeCLTorCNPJ,
        e?.localidade,
        e?.localidadeMap,
        e?.salario,
        e?.experiencia,
        e?.descricao,
        e?.qualificacao,
        e?.beneficios,
        e?.publicado,
        e?.validade,
        e?.candidaturas,
        e?.candidatosRef,
        e?.nomeCandidato,
        e?.status,
        e?.uRLexterno,
        e?.numeroVisualizacoes,
        e?.notificacaoEnviada
      ]);

  @override
  bool isValidKey(Object? o) => o is MeContrataVAGASRecord;
}
