// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnuncianteStruct extends FFFirebaseStruct {
  AnuncianteStruct({
    DocumentReference? ref,
    String? uaid,
    String? logo,
    String? nome,
    LatLng? googleMaps,
    String? whatsComercial,
    String? descricao,
    DocumentReference? userReferencia,
    String? categoria,
    String? telefoneFixo,
    String? email,
    String? subcategoria01,
    String? subcategoria02,
    double? nota,
    String? status,
    String? cnpj,
    String? site,
    DateTime? contaCriada,
    DateTime? dataPagamento,
    DateTime? planoExpira,
    String? endereco,
    String? cidade,
    bool? resgatado,
    String? planoAssinatura,
    double? conversasWhatsapp,
    double? ligacoes,
    double? visualizacoesMapa,
    String? instagram,
    String? facebook,
    Color? cor,
    String? capa,
    double? visualizacaoPagina,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ref = ref,
        _uaid = uaid,
        _logo = logo,
        _nome = nome,
        _googleMaps = googleMaps,
        _whatsComercial = whatsComercial,
        _descricao = descricao,
        _userReferencia = userReferencia,
        _categoria = categoria,
        _telefoneFixo = telefoneFixo,
        _email = email,
        _subcategoria01 = subcategoria01,
        _subcategoria02 = subcategoria02,
        _nota = nota,
        _status = status,
        _cnpj = cnpj,
        _site = site,
        _contaCriada = contaCriada,
        _dataPagamento = dataPagamento,
        _planoExpira = planoExpira,
        _endereco = endereco,
        _cidade = cidade,
        _resgatado = resgatado,
        _planoAssinatura = planoAssinatura,
        _conversasWhatsapp = conversasWhatsapp,
        _ligacoes = ligacoes,
        _visualizacoesMapa = visualizacoesMapa,
        _instagram = instagram,
        _facebook = facebook,
        _cor = cor,
        _capa = capa,
        _visualizacaoPagina = visualizacaoPagina,
        super(firestoreUtilData);

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  // "uaid" field.
  String? _uaid;
  String get uaid => _uaid ?? '';
  set uaid(String? val) => _uaid = val;

  bool hasUaid() => _uaid != null;

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "google_maps" field.
  LatLng? _googleMaps;
  LatLng? get googleMaps => _googleMaps;
  set googleMaps(LatLng? val) => _googleMaps = val;

  bool hasGoogleMaps() => _googleMaps != null;

  // "whatsComercial" field.
  String? _whatsComercial;
  String get whatsComercial => _whatsComercial ?? '';
  set whatsComercial(String? val) => _whatsComercial = val;

  bool hasWhatsComercial() => _whatsComercial != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "userReferencia" field.
  DocumentReference? _userReferencia;
  DocumentReference? get userReferencia => _userReferencia;
  set userReferencia(DocumentReference? val) => _userReferencia = val;

  bool hasUserReferencia() => _userReferencia != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "TelefoneFixo" field.
  String? _telefoneFixo;
  String get telefoneFixo => _telefoneFixo ?? '';
  set telefoneFixo(String? val) => _telefoneFixo = val;

  bool hasTelefoneFixo() => _telefoneFixo != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "subcategoria01" field.
  String? _subcategoria01;
  String get subcategoria01 => _subcategoria01 ?? '';
  set subcategoria01(String? val) => _subcategoria01 = val;

  bool hasSubcategoria01() => _subcategoria01 != null;

  // "subcategoria02" field.
  String? _subcategoria02;
  String get subcategoria02 => _subcategoria02 ?? '';
  set subcategoria02(String? val) => _subcategoria02 = val;

  bool hasSubcategoria02() => _subcategoria02 != null;

  // "nota" field.
  double? _nota;
  double get nota => _nota ?? 0.0;
  set nota(double? val) => _nota = val;

  void incrementNota(double amount) => nota = nota + amount;

  bool hasNota() => _nota != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "CNPJ" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  set cnpj(String? val) => _cnpj = val;

  bool hasCnpj() => _cnpj != null;

  // "Site" field.
  String? _site;
  String get site => _site ?? '';
  set site(String? val) => _site = val;

  bool hasSite() => _site != null;

  // "contaCriada" field.
  DateTime? _contaCriada;
  DateTime? get contaCriada => _contaCriada;
  set contaCriada(DateTime? val) => _contaCriada = val;

  bool hasContaCriada() => _contaCriada != null;

  // "dataPagamento" field.
  DateTime? _dataPagamento;
  DateTime? get dataPagamento => _dataPagamento;
  set dataPagamento(DateTime? val) => _dataPagamento = val;

  bool hasDataPagamento() => _dataPagamento != null;

  // "plano_expira" field.
  DateTime? _planoExpira;
  DateTime? get planoExpira => _planoExpira;
  set planoExpira(DateTime? val) => _planoExpira = val;

  bool hasPlanoExpira() => _planoExpira != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "Resgatado" field.
  bool? _resgatado;
  bool get resgatado => _resgatado ?? false;
  set resgatado(bool? val) => _resgatado = val;

  bool hasResgatado() => _resgatado != null;

  // "planoAssinatura" field.
  String? _planoAssinatura;
  String get planoAssinatura => _planoAssinatura ?? '';
  set planoAssinatura(String? val) => _planoAssinatura = val;

  bool hasPlanoAssinatura() => _planoAssinatura != null;

  // "conversasWhatsapp" field.
  double? _conversasWhatsapp;
  double get conversasWhatsapp => _conversasWhatsapp ?? 0.0;
  set conversasWhatsapp(double? val) => _conversasWhatsapp = val;

  void incrementConversasWhatsapp(double amount) =>
      conversasWhatsapp = conversasWhatsapp + amount;

  bool hasConversasWhatsapp() => _conversasWhatsapp != null;

  // "ligacoes" field.
  double? _ligacoes;
  double get ligacoes => _ligacoes ?? 0.0;
  set ligacoes(double? val) => _ligacoes = val;

  void incrementLigacoes(double amount) => ligacoes = ligacoes + amount;

  bool hasLigacoes() => _ligacoes != null;

  // "visualizacoesMapa" field.
  double? _visualizacoesMapa;
  double get visualizacoesMapa => _visualizacoesMapa ?? 0.0;
  set visualizacoesMapa(double? val) => _visualizacoesMapa = val;

  void incrementVisualizacoesMapa(double amount) =>
      visualizacoesMapa = visualizacoesMapa + amount;

  bool hasVisualizacoesMapa() => _visualizacoesMapa != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  set facebook(String? val) => _facebook = val;

  bool hasFacebook() => _facebook != null;

  // "cor" field.
  Color? _cor;
  Color? get cor => _cor;
  set cor(Color? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  set capa(String? val) => _capa = val;

  bool hasCapa() => _capa != null;

  // "visualizacaoPagina" field.
  double? _visualizacaoPagina;
  double get visualizacaoPagina => _visualizacaoPagina ?? 0.0;
  set visualizacaoPagina(double? val) => _visualizacaoPagina = val;

  void incrementVisualizacaoPagina(double amount) =>
      visualizacaoPagina = visualizacaoPagina + amount;

  bool hasVisualizacaoPagina() => _visualizacaoPagina != null;

  static AnuncianteStruct fromMap(Map<String, dynamic> data) =>
      AnuncianteStruct(
        ref: data['ref'] as DocumentReference?,
        uaid: data['uaid'] as String?,
        logo: data['Logo'] as String?,
        nome: data['nome'] as String?,
        googleMaps: data['google_maps'] as LatLng?,
        whatsComercial: data['whatsComercial'] as String?,
        descricao: data['Descricao'] as String?,
        userReferencia: data['userReferencia'] as DocumentReference?,
        categoria: data['categoria'] as String?,
        telefoneFixo: data['TelefoneFixo'] as String?,
        email: data['Email'] as String?,
        subcategoria01: data['subcategoria01'] as String?,
        subcategoria02: data['subcategoria02'] as String?,
        nota: castToType<double>(data['nota']),
        status: data['status'] as String?,
        cnpj: data['CNPJ'] as String?,
        site: data['Site'] as String?,
        contaCriada: data['contaCriada'] as DateTime?,
        dataPagamento: data['dataPagamento'] as DateTime?,
        planoExpira: data['plano_expira'] as DateTime?,
        endereco: data['endereco'] as String?,
        cidade: data['cidade'] as String?,
        resgatado: data['Resgatado'] as bool?,
        planoAssinatura: data['planoAssinatura'] as String?,
        conversasWhatsapp: castToType<double>(data['conversasWhatsapp']),
        ligacoes: castToType<double>(data['ligacoes']),
        visualizacoesMapa: castToType<double>(data['visualizacoesMapa']),
        instagram: data['instagram'] as String?,
        facebook: data['facebook'] as String?,
        cor: getSchemaColor(data['cor']),
        capa: data['capa'] as String?,
        visualizacaoPagina: castToType<double>(data['visualizacaoPagina']),
      );

  static AnuncianteStruct? maybeFromMap(dynamic data) => data is Map
      ? AnuncianteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ref': _ref,
        'uaid': _uaid,
        'Logo': _logo,
        'nome': _nome,
        'google_maps': _googleMaps,
        'whatsComercial': _whatsComercial,
        'Descricao': _descricao,
        'userReferencia': _userReferencia,
        'categoria': _categoria,
        'TelefoneFixo': _telefoneFixo,
        'Email': _email,
        'subcategoria01': _subcategoria01,
        'subcategoria02': _subcategoria02,
        'nota': _nota,
        'status': _status,
        'CNPJ': _cnpj,
        'Site': _site,
        'contaCriada': _contaCriada,
        'dataPagamento': _dataPagamento,
        'plano_expira': _planoExpira,
        'endereco': _endereco,
        'cidade': _cidade,
        'Resgatado': _resgatado,
        'planoAssinatura': _planoAssinatura,
        'conversasWhatsapp': _conversasWhatsapp,
        'ligacoes': _ligacoes,
        'visualizacoesMapa': _visualizacoesMapa,
        'instagram': _instagram,
        'facebook': _facebook,
        'cor': _cor,
        'capa': _capa,
        'visualizacaoPagina': _visualizacaoPagina,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
        'uaid': serializeParam(
          _uaid,
          ParamType.String,
        ),
        'Logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'google_maps': serializeParam(
          _googleMaps,
          ParamType.LatLng,
        ),
        'whatsComercial': serializeParam(
          _whatsComercial,
          ParamType.String,
        ),
        'Descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'userReferencia': serializeParam(
          _userReferencia,
          ParamType.DocumentReference,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'TelefoneFixo': serializeParam(
          _telefoneFixo,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'subcategoria01': serializeParam(
          _subcategoria01,
          ParamType.String,
        ),
        'subcategoria02': serializeParam(
          _subcategoria02,
          ParamType.String,
        ),
        'nota': serializeParam(
          _nota,
          ParamType.double,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'CNPJ': serializeParam(
          _cnpj,
          ParamType.String,
        ),
        'Site': serializeParam(
          _site,
          ParamType.String,
        ),
        'contaCriada': serializeParam(
          _contaCriada,
          ParamType.DateTime,
        ),
        'dataPagamento': serializeParam(
          _dataPagamento,
          ParamType.DateTime,
        ),
        'plano_expira': serializeParam(
          _planoExpira,
          ParamType.DateTime,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'Resgatado': serializeParam(
          _resgatado,
          ParamType.bool,
        ),
        'planoAssinatura': serializeParam(
          _planoAssinatura,
          ParamType.String,
        ),
        'conversasWhatsapp': serializeParam(
          _conversasWhatsapp,
          ParamType.double,
        ),
        'ligacoes': serializeParam(
          _ligacoes,
          ParamType.double,
        ),
        'visualizacoesMapa': serializeParam(
          _visualizacoesMapa,
          ParamType.double,
        ),
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'facebook': serializeParam(
          _facebook,
          ParamType.String,
        ),
        'cor': serializeParam(
          _cor,
          ParamType.Color,
        ),
        'capa': serializeParam(
          _capa,
          ParamType.String,
        ),
        'visualizacaoPagina': serializeParam(
          _visualizacaoPagina,
          ParamType.double,
        ),
      }.withoutNulls;

  static AnuncianteStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnuncianteStruct(
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Anunciante'],
        ),
        uaid: deserializeParam(
          data['uaid'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['Logo'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        googleMaps: deserializeParam(
          data['google_maps'],
          ParamType.LatLng,
          false,
        ),
        whatsComercial: deserializeParam(
          data['whatsComercial'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['Descricao'],
          ParamType.String,
          false,
        ),
        userReferencia: deserializeParam(
          data['userReferencia'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        telefoneFixo: deserializeParam(
          data['TelefoneFixo'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        subcategoria01: deserializeParam(
          data['subcategoria01'],
          ParamType.String,
          false,
        ),
        subcategoria02: deserializeParam(
          data['subcategoria02'],
          ParamType.String,
          false,
        ),
        nota: deserializeParam(
          data['nota'],
          ParamType.double,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        cnpj: deserializeParam(
          data['CNPJ'],
          ParamType.String,
          false,
        ),
        site: deserializeParam(
          data['Site'],
          ParamType.String,
          false,
        ),
        contaCriada: deserializeParam(
          data['contaCriada'],
          ParamType.DateTime,
          false,
        ),
        dataPagamento: deserializeParam(
          data['dataPagamento'],
          ParamType.DateTime,
          false,
        ),
        planoExpira: deserializeParam(
          data['plano_expira'],
          ParamType.DateTime,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        resgatado: deserializeParam(
          data['Resgatado'],
          ParamType.bool,
          false,
        ),
        planoAssinatura: deserializeParam(
          data['planoAssinatura'],
          ParamType.String,
          false,
        ),
        conversasWhatsapp: deserializeParam(
          data['conversasWhatsapp'],
          ParamType.double,
          false,
        ),
        ligacoes: deserializeParam(
          data['ligacoes'],
          ParamType.double,
          false,
        ),
        visualizacoesMapa: deserializeParam(
          data['visualizacoesMapa'],
          ParamType.double,
          false,
        ),
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        facebook: deserializeParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        cor: deserializeParam(
          data['cor'],
          ParamType.Color,
          false,
        ),
        capa: deserializeParam(
          data['capa'],
          ParamType.String,
          false,
        ),
        visualizacaoPagina: deserializeParam(
          data['visualizacaoPagina'],
          ParamType.double,
          false,
        ),
      );

  static AnuncianteStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AnuncianteStruct(
        ref: convertAlgoliaParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
        ),
        uaid: convertAlgoliaParam(
          data['uaid'],
          ParamType.String,
          false,
        ),
        logo: convertAlgoliaParam(
          data['Logo'],
          ParamType.String,
          false,
        ),
        nome: convertAlgoliaParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        googleMaps: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        whatsComercial: convertAlgoliaParam(
          data['whatsComercial'],
          ParamType.String,
          false,
        ),
        descricao: convertAlgoliaParam(
          data['Descricao'],
          ParamType.String,
          false,
        ),
        userReferencia: convertAlgoliaParam(
          data['userReferencia'],
          ParamType.DocumentReference,
          false,
        ),
        categoria: convertAlgoliaParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        telefoneFixo: convertAlgoliaParam(
          data['TelefoneFixo'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        subcategoria01: convertAlgoliaParam(
          data['subcategoria01'],
          ParamType.String,
          false,
        ),
        subcategoria02: convertAlgoliaParam(
          data['subcategoria02'],
          ParamType.String,
          false,
        ),
        nota: convertAlgoliaParam(
          data['nota'],
          ParamType.double,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        cnpj: convertAlgoliaParam(
          data['CNPJ'],
          ParamType.String,
          false,
        ),
        site: convertAlgoliaParam(
          data['Site'],
          ParamType.String,
          false,
        ),
        contaCriada: convertAlgoliaParam(
          data['contaCriada'],
          ParamType.DateTime,
          false,
        ),
        dataPagamento: convertAlgoliaParam(
          data['dataPagamento'],
          ParamType.DateTime,
          false,
        ),
        planoExpira: convertAlgoliaParam(
          data['plano_expira'],
          ParamType.DateTime,
          false,
        ),
        endereco: convertAlgoliaParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        cidade: convertAlgoliaParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        resgatado: convertAlgoliaParam(
          data['Resgatado'],
          ParamType.bool,
          false,
        ),
        planoAssinatura: convertAlgoliaParam(
          data['planoAssinatura'],
          ParamType.String,
          false,
        ),
        conversasWhatsapp: convertAlgoliaParam(
          data['conversasWhatsapp'],
          ParamType.double,
          false,
        ),
        ligacoes: convertAlgoliaParam(
          data['ligacoes'],
          ParamType.double,
          false,
        ),
        visualizacoesMapa: convertAlgoliaParam(
          data['visualizacoesMapa'],
          ParamType.double,
          false,
        ),
        instagram: convertAlgoliaParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        facebook: convertAlgoliaParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        cor: convertAlgoliaParam(
          data['cor'],
          ParamType.Color,
          false,
        ),
        capa: convertAlgoliaParam(
          data['capa'],
          ParamType.String,
          false,
        ),
        visualizacaoPagina: convertAlgoliaParam(
          data['visualizacaoPagina'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AnuncianteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnuncianteStruct &&
        ref == other.ref &&
        uaid == other.uaid &&
        logo == other.logo &&
        nome == other.nome &&
        googleMaps == other.googleMaps &&
        whatsComercial == other.whatsComercial &&
        descricao == other.descricao &&
        userReferencia == other.userReferencia &&
        categoria == other.categoria &&
        telefoneFixo == other.telefoneFixo &&
        email == other.email &&
        subcategoria01 == other.subcategoria01 &&
        subcategoria02 == other.subcategoria02 &&
        nota == other.nota &&
        status == other.status &&
        cnpj == other.cnpj &&
        site == other.site &&
        contaCriada == other.contaCriada &&
        dataPagamento == other.dataPagamento &&
        planoExpira == other.planoExpira &&
        endereco == other.endereco &&
        cidade == other.cidade &&
        resgatado == other.resgatado &&
        planoAssinatura == other.planoAssinatura &&
        conversasWhatsapp == other.conversasWhatsapp &&
        ligacoes == other.ligacoes &&
        visualizacoesMapa == other.visualizacoesMapa &&
        instagram == other.instagram &&
        facebook == other.facebook &&
        cor == other.cor &&
        capa == other.capa &&
        visualizacaoPagina == other.visualizacaoPagina;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ref,
        uaid,
        logo,
        nome,
        googleMaps,
        whatsComercial,
        descricao,
        userReferencia,
        categoria,
        telefoneFixo,
        email,
        subcategoria01,
        subcategoria02,
        nota,
        status,
        cnpj,
        site,
        contaCriada,
        dataPagamento,
        planoExpira,
        endereco,
        cidade,
        resgatado,
        planoAssinatura,
        conversasWhatsapp,
        ligacoes,
        visualizacoesMapa,
        instagram,
        facebook,
        cor,
        capa,
        visualizacaoPagina
      ]);
}

AnuncianteStruct createAnuncianteStruct({
  DocumentReference? ref,
  String? uaid,
  String? logo,
  String? nome,
  LatLng? googleMaps,
  String? whatsComercial,
  String? descricao,
  DocumentReference? userReferencia,
  String? categoria,
  String? telefoneFixo,
  String? email,
  String? subcategoria01,
  String? subcategoria02,
  double? nota,
  String? status,
  String? cnpj,
  String? site,
  DateTime? contaCriada,
  DateTime? dataPagamento,
  DateTime? planoExpira,
  String? endereco,
  String? cidade,
  bool? resgatado,
  String? planoAssinatura,
  double? conversasWhatsapp,
  double? ligacoes,
  double? visualizacoesMapa,
  String? instagram,
  String? facebook,
  Color? cor,
  String? capa,
  double? visualizacaoPagina,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnuncianteStruct(
      ref: ref,
      uaid: uaid,
      logo: logo,
      nome: nome,
      googleMaps: googleMaps,
      whatsComercial: whatsComercial,
      descricao: descricao,
      userReferencia: userReferencia,
      categoria: categoria,
      telefoneFixo: telefoneFixo,
      email: email,
      subcategoria01: subcategoria01,
      subcategoria02: subcategoria02,
      nota: nota,
      status: status,
      cnpj: cnpj,
      site: site,
      contaCriada: contaCriada,
      dataPagamento: dataPagamento,
      planoExpira: planoExpira,
      endereco: endereco,
      cidade: cidade,
      resgatado: resgatado,
      planoAssinatura: planoAssinatura,
      conversasWhatsapp: conversasWhatsapp,
      ligacoes: ligacoes,
      visualizacoesMapa: visualizacoesMapa,
      instagram: instagram,
      facebook: facebook,
      cor: cor,
      capa: capa,
      visualizacaoPagina: visualizacaoPagina,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnuncianteStruct? updateAnuncianteStruct(
  AnuncianteStruct? anunciante, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    anunciante
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnuncianteStructData(
  Map<String, dynamic> firestoreData,
  AnuncianteStruct? anunciante,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (anunciante == null) {
    return;
  }
  if (anunciante.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && anunciante.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final anuncianteData = getAnuncianteFirestoreData(anunciante, forFieldValue);
  final nestedData = anuncianteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = anunciante.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnuncianteFirestoreData(
  AnuncianteStruct? anunciante, [
  bool forFieldValue = false,
]) {
  if (anunciante == null) {
    return {};
  }
  final firestoreData = mapToFirestore(anunciante.toMap());

  // Add any Firestore field values
  anunciante.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnuncianteListFirestoreData(
  List<AnuncianteStruct>? anunciantes,
) =>
    anunciantes?.map((e) => getAnuncianteFirestoreData(e, true)).toList() ?? [];
