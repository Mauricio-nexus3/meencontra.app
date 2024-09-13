import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MateriasRecord extends FirestoreRecord {
  MateriasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CreditosImagem" field.
  String? _creditosImagem;
  String get creditosImagem => _creditosImagem ?? '';
  bool hasCreditosImagem() => _creditosImagem != null;

  // "EscritoPor" field.
  String? _escritoPor;
  String get escritoPor => _escritoPor ?? '';
  bool hasEscritoPor() => _escritoPor != null;

  // "TituloMateria" field.
  String? _tituloMateria;
  String get tituloMateria => _tituloMateria ?? '';
  bool hasTituloMateria() => _tituloMateria != null;

  // "ConteudoMateria" field.
  String? _conteudoMateria;
  String get conteudoMateria => _conteudoMateria ?? '';
  bool hasConteudoMateria() => _conteudoMateria != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "N_Categorias_publicadas" field.
  List<int>? _nCategoriasPublicadas;
  List<int> get nCategoriasPublicadas => _nCategoriasPublicadas ?? const [];
  bool hasNCategoriasPublicadas() => _nCategoriasPublicadas != null;

  // "MateriaDestaque" field.
  bool? _materiaDestaque;
  bool get materiaDestaque => _materiaDestaque ?? false;
  bool hasMateriaDestaque() => _materiaDestaque != null;

  // "DataPublicacaoMateria" field.
  DateTime? _dataPublicacaoMateria;
  DateTime? get dataPublicacaoMateria => _dataPublicacaoMateria;
  bool hasDataPublicacaoMateria() => _dataPublicacaoMateria != null;

  // "ImagemCapa" field.
  String? _imagemCapa;
  String get imagemCapa => _imagemCapa ?? '';
  bool hasImagemCapa() => _imagemCapa != null;

  // "descricaoImg" field.
  String? _descricaoImg;
  String get descricaoImg => _descricaoImg ?? '';
  bool hasDescricaoImg() => _descricaoImg != null;

  // "Imagens" field.
  List<String>? _imagens;
  List<String> get imagens => _imagens ?? const [];
  bool hasImagens() => _imagens != null;

  // "numTotalLeitoresMateria" field.
  double? _numTotalLeitoresMateria;
  double get numTotalLeitoresMateria => _numTotalLeitoresMateria ?? 0.0;
  bool hasNumTotalLeitoresMateria() => _numTotalLeitoresMateria != null;

  // "html" field.
  String? _html;
  String get html => _html ?? '';
  bool hasHtml() => _html != null;

  // "notificacaoEnviada" field.
  bool? _notificacaoEnviada;
  bool get notificacaoEnviada => _notificacaoEnviada ?? false;
  bool hasNotificacaoEnviada() => _notificacaoEnviada != null;

  // "nomeLeitor" field.
  String? _nomeLeitor;
  String get nomeLeitor => _nomeLeitor ?? '';
  bool hasNomeLeitor() => _nomeLeitor != null;

  // "emailLeitor" field.
  String? _emailLeitor;
  String get emailLeitor => _emailLeitor ?? '';
  bool hasEmailLeitor() => _emailLeitor != null;

  // "videoMateria" field.
  String? _videoMateria;
  String get videoMateria => _videoMateria ?? '';
  bool hasVideoMateria() => _videoMateria != null;

  // "fonteImprensa" field.
  String? _fonteImprensa;
  String get fonteImprensa => _fonteImprensa ?? '';
  bool hasFonteImprensa() => _fonteImprensa != null;

  // "logoUrl" field.
  String? _logoUrl;
  String get logoUrl => _logoUrl ?? '';
  bool hasLogoUrl() => _logoUrl != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creditosImagem = snapshotData['CreditosImagem'] as String?;
    _escritoPor = snapshotData['EscritoPor'] as String?;
    _tituloMateria = snapshotData['TituloMateria'] as String?;
    _conteudoMateria = snapshotData['ConteudoMateria'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _nCategoriasPublicadas =
        getDataList(snapshotData['N_Categorias_publicadas']);
    _materiaDestaque = snapshotData['MateriaDestaque'] as bool?;
    _dataPublicacaoMateria = snapshotData['DataPublicacaoMateria'] as DateTime?;
    _imagemCapa = snapshotData['ImagemCapa'] as String?;
    _descricaoImg = snapshotData['descricaoImg'] as String?;
    _imagens = getDataList(snapshotData['Imagens']);
    _numTotalLeitoresMateria =
        castToType<double>(snapshotData['numTotalLeitoresMateria']);
    _html = snapshotData['html'] as String?;
    _notificacaoEnviada = snapshotData['notificacaoEnviada'] as bool?;
    _nomeLeitor = snapshotData['nomeLeitor'] as String?;
    _emailLeitor = snapshotData['emailLeitor'] as String?;
    _videoMateria = snapshotData['videoMateria'] as String?;
    _fonteImprensa = snapshotData['fonteImprensa'] as String?;
    _logoUrl = snapshotData['logoUrl'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _site = snapshotData['site'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Materias')
          : FirebaseFirestore.instance.collectionGroup('Materias');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Materias').doc(id);

  static Stream<MateriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MateriasRecord.fromSnapshot(s));

  static Future<MateriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MateriasRecord.fromSnapshot(s));

  static MateriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MateriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MateriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MateriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MateriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MateriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMateriasRecordData({
  String? creditosImagem,
  String? escritoPor,
  String? tituloMateria,
  String? conteudoMateria,
  String? categoria,
  bool? materiaDestaque,
  DateTime? dataPublicacaoMateria,
  String? imagemCapa,
  String? descricaoImg,
  double? numTotalLeitoresMateria,
  String? html,
  bool? notificacaoEnviada,
  String? nomeLeitor,
  String? emailLeitor,
  String? videoMateria,
  String? fonteImprensa,
  String? logoUrl,
  String? instagram,
  String? site,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CreditosImagem': creditosImagem,
      'EscritoPor': escritoPor,
      'TituloMateria': tituloMateria,
      'ConteudoMateria': conteudoMateria,
      'Categoria': categoria,
      'MateriaDestaque': materiaDestaque,
      'DataPublicacaoMateria': dataPublicacaoMateria,
      'ImagemCapa': imagemCapa,
      'descricaoImg': descricaoImg,
      'numTotalLeitoresMateria': numTotalLeitoresMateria,
      'html': html,
      'notificacaoEnviada': notificacaoEnviada,
      'nomeLeitor': nomeLeitor,
      'emailLeitor': emailLeitor,
      'videoMateria': videoMateria,
      'fonteImprensa': fonteImprensa,
      'logoUrl': logoUrl,
      'instagram': instagram,
      'site': site,
    }.withoutNulls,
  );

  return firestoreData;
}

class MateriasRecordDocumentEquality implements Equality<MateriasRecord> {
  const MateriasRecordDocumentEquality();

  @override
  bool equals(MateriasRecord? e1, MateriasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creditosImagem == e2?.creditosImagem &&
        e1?.escritoPor == e2?.escritoPor &&
        e1?.tituloMateria == e2?.tituloMateria &&
        e1?.conteudoMateria == e2?.conteudoMateria &&
        e1?.categoria == e2?.categoria &&
        listEquality.equals(
            e1?.nCategoriasPublicadas, e2?.nCategoriasPublicadas) &&
        e1?.materiaDestaque == e2?.materiaDestaque &&
        e1?.dataPublicacaoMateria == e2?.dataPublicacaoMateria &&
        e1?.imagemCapa == e2?.imagemCapa &&
        e1?.descricaoImg == e2?.descricaoImg &&
        listEquality.equals(e1?.imagens, e2?.imagens) &&
        e1?.numTotalLeitoresMateria == e2?.numTotalLeitoresMateria &&
        e1?.html == e2?.html &&
        e1?.notificacaoEnviada == e2?.notificacaoEnviada &&
        e1?.nomeLeitor == e2?.nomeLeitor &&
        e1?.emailLeitor == e2?.emailLeitor &&
        e1?.videoMateria == e2?.videoMateria &&
        e1?.fonteImprensa == e2?.fonteImprensa &&
        e1?.logoUrl == e2?.logoUrl &&
        e1?.instagram == e2?.instagram &&
        e1?.site == e2?.site;
  }

  @override
  int hash(MateriasRecord? e) => const ListEquality().hash([
        e?.creditosImagem,
        e?.escritoPor,
        e?.tituloMateria,
        e?.conteudoMateria,
        e?.categoria,
        e?.nCategoriasPublicadas,
        e?.materiaDestaque,
        e?.dataPublicacaoMateria,
        e?.imagemCapa,
        e?.descricaoImg,
        e?.imagens,
        e?.numTotalLeitoresMateria,
        e?.html,
        e?.notificacaoEnviada,
        e?.nomeLeitor,
        e?.emailLeitor,
        e?.videoMateria,
        e?.fonteImprensa,
        e?.logoUrl,
        e?.instagram,
        e?.site
      ]);

  @override
  bool isValidKey(Object? o) => o is MateriasRecord;
}
