import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnuncianteRecord extends FirestoreRecord {
  AnuncianteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "NomeFantasia" field.
  String? _nomeFantasia;
  String get nomeFantasia => _nomeFantasia ?? '';
  bool hasNomeFantasia() => _nomeFantasia != null;

  // "GoogleMaps" field.
  LatLng? _googleMaps;
  LatLng? get googleMaps => _googleMaps;
  bool hasGoogleMaps() => _googleMaps != null;

  // "WhatsComercial" field.
  String? _whatsComercial;
  String get whatsComercial => _whatsComercial ?? '';
  bool hasWhatsComercial() => _whatsComercial != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "AnuncianteUser" field.
  DocumentReference? _anuncianteUser;
  DocumentReference? get anuncianteUser => _anuncianteUser;
  bool hasAnuncianteUser() => _anuncianteUser != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "TelefoneFixo" field.
  String? _telefoneFixo;
  String get telefoneFixo => _telefoneFixo ?? '';
  bool hasTelefoneFixo() => _telefoneFixo != null;

  // "EmailComercial" field.
  String? _emailComercial;
  String get emailComercial => _emailComercial ?? '';
  bool hasEmailComercial() => _emailComercial != null;

  // "NomeSubCategoria01" field.
  String? _nomeSubCategoria01;
  String get nomeSubCategoria01 => _nomeSubCategoria01 ?? '';
  bool hasNomeSubCategoria01() => _nomeSubCategoria01 != null;

  // "NomeSubCategoria02" field.
  String? _nomeSubCategoria02;
  String get nomeSubCategoria02 => _nomeSubCategoria02 ?? '';
  bool hasNomeSubCategoria02() => _nomeSubCategoria02 != null;

  // "NotaMedia" field.
  double? _notaMedia;
  double get notaMedia => _notaMedia ?? 0.0;
  bool hasNotaMedia() => _notaMedia != null;

  // "StatusCadastro" field.
  String? _statusCadastro;
  String get statusCadastro => _statusCadastro ?? '';
  bool hasStatusCadastro() => _statusCadastro != null;

  // "CNPJ_RG" field.
  String? _cnpjRg;
  String get cnpjRg => _cnpjRg ?? '';
  bool hasCnpjRg() => _cnpjRg != null;

  // "Site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "ContaCriada" field.
  DateTime? _contaCriada;
  DateTime? get contaCriada => _contaCriada;
  bool hasContaCriada() => _contaCriada != null;

  // "DataPagamento" field.
  DateTime? _dataPagamento;
  DateTime? get dataPagamento => _dataPagamento;
  bool hasDataPagamento() => _dataPagamento != null;

  // "PlanoExpira" field.
  DateTime? _planoExpira;
  DateTime? get planoExpira => _planoExpira;
  bool hasPlanoExpira() => _planoExpira != null;

  // "aid" field.
  String? _aid;
  String get aid => _aid ?? '';
  bool hasAid() => _aid != null;

  // "EnderecoCompleto" field.
  String? _enderecoCompleto;
  String get enderecoCompleto => _enderecoCompleto ?? '';
  bool hasEnderecoCompleto() => _enderecoCompleto != null;

  // "Cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "Resgatado" field.
  bool? _resgatado;
  bool get resgatado => _resgatado ?? false;
  bool hasResgatado() => _resgatado != null;

  // "PlanoAssinatura" field.
  String? _planoAssinatura;
  String get planoAssinatura => _planoAssinatura ?? '';
  bool hasPlanoAssinatura() => _planoAssinatura != null;

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

  // "Instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "Facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "Cor" field.
  Color? _cor;
  Color? get cor => _cor;
  bool hasCor() => _cor != null;

  // "NomeUsuarioAdm" field.
  String? _nomeUsuarioAdm;
  String get nomeUsuarioAdm => _nomeUsuarioAdm ?? '';
  bool hasNomeUsuarioAdm() => _nomeUsuarioAdm != null;

  // "EmailUsuarioAdm" field.
  String? _emailUsuarioAdm;
  String get emailUsuarioAdm => _emailUsuarioAdm ?? '';
  bool hasEmailUsuarioAdm() => _emailUsuarioAdm != null;

  // "EmailColaboradores" field.
  List<String>? _emailColaboradores;
  List<String> get emailColaboradores => _emailColaboradores ?? const [];
  bool hasEmailColaboradores() => _emailColaboradores != null;

  // "templeteLayout" field.
  String? _templeteLayout;
  String get templeteLayout => _templeteLayout ?? '';
  bool hasTempleteLayout() => _templeteLayout != null;

  // "Capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  bool hasCapa() => _capa != null;

  // "formatoAnuncio" field.
  String? _formatoAnuncio;
  String get formatoAnuncio => _formatoAnuncio ?? '';
  bool hasFormatoAnuncio() => _formatoAnuncio != null;

  // "temCarrinho" field.
  bool? _temCarrinho;
  bool get temCarrinho => _temCarrinho ?? false;
  bool hasTemCarrinho() => _temCarrinho != null;

  // "visualizacaoPagina" field.
  double? _visualizacaoPagina;
  double get visualizacaoPagina => _visualizacaoPagina ?? 0.0;
  bool hasVisualizacaoPagina() => _visualizacaoPagina != null;

  // "CadastradoPor" field.
  String? _cadastradoPor;
  String get cadastradoPor => _cadastradoPor ?? '';
  bool hasCadastradoPor() => _cadastradoPor != null;

  void _initializeFields() {
    _logo = snapshotData['Logo'] as String?;
    _nomeFantasia = snapshotData['NomeFantasia'] as String?;
    _googleMaps = snapshotData['GoogleMaps'] as LatLng?;
    _whatsComercial = snapshotData['WhatsComercial'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _anuncianteUser = snapshotData['AnuncianteUser'] as DocumentReference?;
    _categoria = snapshotData['Categoria'] as String?;
    _telefoneFixo = snapshotData['TelefoneFixo'] as String?;
    _emailComercial = snapshotData['EmailComercial'] as String?;
    _nomeSubCategoria01 = snapshotData['NomeSubCategoria01'] as String?;
    _nomeSubCategoria02 = snapshotData['NomeSubCategoria02'] as String?;
    _notaMedia = castToType<double>(snapshotData['NotaMedia']);
    _statusCadastro = snapshotData['StatusCadastro'] as String?;
    _cnpjRg = snapshotData['CNPJ_RG'] as String?;
    _site = snapshotData['Site'] as String?;
    _contaCriada = snapshotData['ContaCriada'] as DateTime?;
    _dataPagamento = snapshotData['DataPagamento'] as DateTime?;
    _planoExpira = snapshotData['PlanoExpira'] as DateTime?;
    _aid = snapshotData['aid'] as String?;
    _enderecoCompleto = snapshotData['EnderecoCompleto'] as String?;
    _cidade = snapshotData['Cidade'] as String?;
    _resgatado = snapshotData['Resgatado'] as bool?;
    _planoAssinatura = snapshotData['PlanoAssinatura'] as String?;
    _conversasWhatsapp = castToType<double>(snapshotData['ConversasWhatsapp']);
    _ligacaoes = castToType<double>(snapshotData['Ligacaoes']);
    _visualizacaoMapa = castToType<double>(snapshotData['visualizacaoMapa']);
    _instagram = snapshotData['Instagram'] as String?;
    _facebook = snapshotData['Facebook'] as String?;
    _youtube = snapshotData['youtube'] as String?;
    _cor = getSchemaColor(snapshotData['Cor']);
    _nomeUsuarioAdm = snapshotData['NomeUsuarioAdm'] as String?;
    _emailUsuarioAdm = snapshotData['EmailUsuarioAdm'] as String?;
    _emailColaboradores = getDataList(snapshotData['EmailColaboradores']);
    _templeteLayout = snapshotData['templeteLayout'] as String?;
    _capa = snapshotData['Capa'] as String?;
    _formatoAnuncio = snapshotData['formatoAnuncio'] as String?;
    _temCarrinho = snapshotData['temCarrinho'] as bool?;
    _visualizacaoPagina =
        castToType<double>(snapshotData['visualizacaoPagina']);
    _cadastradoPor = snapshotData['CadastradoPor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Anunciante');

  static Stream<AnuncianteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnuncianteRecord.fromSnapshot(s));

  static Future<AnuncianteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnuncianteRecord.fromSnapshot(s));

  static AnuncianteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnuncianteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnuncianteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnuncianteRecord._(reference, mapFromFirestore(data));

  static AnuncianteRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AnuncianteRecord.getDocumentFromData(
        {
          'Logo': snapshot.data['Logo'],
          'NomeFantasia': snapshot.data['NomeFantasia'],
          'GoogleMaps': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'WhatsComercial': snapshot.data['WhatsComercial'],
          'Descricao': snapshot.data['Descricao'],
          'AnuncianteUser': convertAlgoliaParam(
            snapshot.data['AnuncianteUser'],
            ParamType.DocumentReference,
            false,
          ),
          'Categoria': snapshot.data['Categoria'],
          'TelefoneFixo': snapshot.data['TelefoneFixo'],
          'EmailComercial': snapshot.data['EmailComercial'],
          'NomeSubCategoria01': snapshot.data['NomeSubCategoria01'],
          'NomeSubCategoria02': snapshot.data['NomeSubCategoria02'],
          'NotaMedia': convertAlgoliaParam(
            snapshot.data['NotaMedia'],
            ParamType.double,
            false,
          ),
          'StatusCadastro': snapshot.data['StatusCadastro'],
          'CNPJ_RG': snapshot.data['CNPJ_RG'],
          'Site': snapshot.data['Site'],
          'ContaCriada': convertAlgoliaParam(
            snapshot.data['ContaCriada'],
            ParamType.DateTime,
            false,
          ),
          'DataPagamento': convertAlgoliaParam(
            snapshot.data['DataPagamento'],
            ParamType.DateTime,
            false,
          ),
          'PlanoExpira': convertAlgoliaParam(
            snapshot.data['PlanoExpira'],
            ParamType.DateTime,
            false,
          ),
          'aid': snapshot.data['aid'],
          'EnderecoCompleto': snapshot.data['EnderecoCompleto'],
          'Cidade': snapshot.data['Cidade'],
          'Resgatado': snapshot.data['Resgatado'],
          'PlanoAssinatura': snapshot.data['PlanoAssinatura'],
          'ConversasWhatsapp': convertAlgoliaParam(
            snapshot.data['ConversasWhatsapp'],
            ParamType.double,
            false,
          ),
          'Ligacaoes': convertAlgoliaParam(
            snapshot.data['Ligacaoes'],
            ParamType.double,
            false,
          ),
          'visualizacaoMapa': convertAlgoliaParam(
            snapshot.data['visualizacaoMapa'],
            ParamType.double,
            false,
          ),
          'Instagram': snapshot.data['Instagram'],
          'Facebook': snapshot.data['Facebook'],
          'youtube': snapshot.data['youtube'],
          'Cor': convertAlgoliaParam(
            snapshot.data['Cor'],
            ParamType.Color,
            false,
          ),
          'NomeUsuarioAdm': snapshot.data['NomeUsuarioAdm'],
          'EmailUsuarioAdm': snapshot.data['EmailUsuarioAdm'],
          'EmailColaboradores': safeGet(
            () => snapshot.data['EmailColaboradores'].toList(),
          ),
          'templeteLayout': snapshot.data['templeteLayout'],
          'Capa': snapshot.data['Capa'],
          'formatoAnuncio': snapshot.data['formatoAnuncio'],
          'temCarrinho': snapshot.data['temCarrinho'],
          'visualizacaoPagina': convertAlgoliaParam(
            snapshot.data['visualizacaoPagina'],
            ParamType.double,
            false,
          ),
          'CadastradoPor': snapshot.data['CadastradoPor'],
        },
        AnuncianteRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AnuncianteRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Anunciante',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'AnuncianteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnuncianteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnuncianteRecordData({
  String? logo,
  String? nomeFantasia,
  LatLng? googleMaps,
  String? whatsComercial,
  String? descricao,
  DocumentReference? anuncianteUser,
  String? categoria,
  String? telefoneFixo,
  String? emailComercial,
  String? nomeSubCategoria01,
  String? nomeSubCategoria02,
  double? notaMedia,
  String? statusCadastro,
  String? cnpjRg,
  String? site,
  DateTime? contaCriada,
  DateTime? dataPagamento,
  DateTime? planoExpira,
  String? aid,
  String? enderecoCompleto,
  String? cidade,
  bool? resgatado,
  String? planoAssinatura,
  double? conversasWhatsapp,
  double? ligacaoes,
  double? visualizacaoMapa,
  String? instagram,
  String? facebook,
  String? youtube,
  Color? cor,
  String? nomeUsuarioAdm,
  String? emailUsuarioAdm,
  String? templeteLayout,
  String? capa,
  String? formatoAnuncio,
  bool? temCarrinho,
  double? visualizacaoPagina,
  String? cadastradoPor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Logo': logo,
      'NomeFantasia': nomeFantasia,
      'GoogleMaps': googleMaps,
      'WhatsComercial': whatsComercial,
      'Descricao': descricao,
      'AnuncianteUser': anuncianteUser,
      'Categoria': categoria,
      'TelefoneFixo': telefoneFixo,
      'EmailComercial': emailComercial,
      'NomeSubCategoria01': nomeSubCategoria01,
      'NomeSubCategoria02': nomeSubCategoria02,
      'NotaMedia': notaMedia,
      'StatusCadastro': statusCadastro,
      'CNPJ_RG': cnpjRg,
      'Site': site,
      'ContaCriada': contaCriada,
      'DataPagamento': dataPagamento,
      'PlanoExpira': planoExpira,
      'aid': aid,
      'EnderecoCompleto': enderecoCompleto,
      'Cidade': cidade,
      'Resgatado': resgatado,
      'PlanoAssinatura': planoAssinatura,
      'ConversasWhatsapp': conversasWhatsapp,
      'Ligacaoes': ligacaoes,
      'visualizacaoMapa': visualizacaoMapa,
      'Instagram': instagram,
      'Facebook': facebook,
      'youtube': youtube,
      'Cor': cor,
      'NomeUsuarioAdm': nomeUsuarioAdm,
      'EmailUsuarioAdm': emailUsuarioAdm,
      'templeteLayout': templeteLayout,
      'Capa': capa,
      'formatoAnuncio': formatoAnuncio,
      'temCarrinho': temCarrinho,
      'visualizacaoPagina': visualizacaoPagina,
      'CadastradoPor': cadastradoPor,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnuncianteRecordDocumentEquality implements Equality<AnuncianteRecord> {
  const AnuncianteRecordDocumentEquality();

  @override
  bool equals(AnuncianteRecord? e1, AnuncianteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.logo == e2?.logo &&
        e1?.nomeFantasia == e2?.nomeFantasia &&
        e1?.googleMaps == e2?.googleMaps &&
        e1?.whatsComercial == e2?.whatsComercial &&
        e1?.descricao == e2?.descricao &&
        e1?.anuncianteUser == e2?.anuncianteUser &&
        e1?.categoria == e2?.categoria &&
        e1?.telefoneFixo == e2?.telefoneFixo &&
        e1?.emailComercial == e2?.emailComercial &&
        e1?.nomeSubCategoria01 == e2?.nomeSubCategoria01 &&
        e1?.nomeSubCategoria02 == e2?.nomeSubCategoria02 &&
        e1?.notaMedia == e2?.notaMedia &&
        e1?.statusCadastro == e2?.statusCadastro &&
        e1?.cnpjRg == e2?.cnpjRg &&
        e1?.site == e2?.site &&
        e1?.contaCriada == e2?.contaCriada &&
        e1?.dataPagamento == e2?.dataPagamento &&
        e1?.planoExpira == e2?.planoExpira &&
        e1?.aid == e2?.aid &&
        e1?.enderecoCompleto == e2?.enderecoCompleto &&
        e1?.cidade == e2?.cidade &&
        e1?.resgatado == e2?.resgatado &&
        e1?.planoAssinatura == e2?.planoAssinatura &&
        e1?.conversasWhatsapp == e2?.conversasWhatsapp &&
        e1?.ligacaoes == e2?.ligacaoes &&
        e1?.visualizacaoMapa == e2?.visualizacaoMapa &&
        e1?.instagram == e2?.instagram &&
        e1?.facebook == e2?.facebook &&
        e1?.youtube == e2?.youtube &&
        e1?.cor == e2?.cor &&
        e1?.nomeUsuarioAdm == e2?.nomeUsuarioAdm &&
        e1?.emailUsuarioAdm == e2?.emailUsuarioAdm &&
        listEquality.equals(e1?.emailColaboradores, e2?.emailColaboradores) &&
        e1?.templeteLayout == e2?.templeteLayout &&
        e1?.capa == e2?.capa &&
        e1?.formatoAnuncio == e2?.formatoAnuncio &&
        e1?.temCarrinho == e2?.temCarrinho &&
        e1?.visualizacaoPagina == e2?.visualizacaoPagina &&
        e1?.cadastradoPor == e2?.cadastradoPor;
  }

  @override
  int hash(AnuncianteRecord? e) => const ListEquality().hash([
        e?.logo,
        e?.nomeFantasia,
        e?.googleMaps,
        e?.whatsComercial,
        e?.descricao,
        e?.anuncianteUser,
        e?.categoria,
        e?.telefoneFixo,
        e?.emailComercial,
        e?.nomeSubCategoria01,
        e?.nomeSubCategoria02,
        e?.notaMedia,
        e?.statusCadastro,
        e?.cnpjRg,
        e?.site,
        e?.contaCriada,
        e?.dataPagamento,
        e?.planoExpira,
        e?.aid,
        e?.enderecoCompleto,
        e?.cidade,
        e?.resgatado,
        e?.planoAssinatura,
        e?.conversasWhatsapp,
        e?.ligacaoes,
        e?.visualizacaoMapa,
        e?.instagram,
        e?.facebook,
        e?.youtube,
        e?.cor,
        e?.nomeUsuarioAdm,
        e?.emailUsuarioAdm,
        e?.emailColaboradores,
        e?.templeteLayout,
        e?.capa,
        e?.formatoAnuncio,
        e?.temCarrinho,
        e?.visualizacaoPagina,
        e?.cadastradoPor
      ]);

  @override
  bool isValidKey(Object? o) => o is AnuncianteRecord;
}
