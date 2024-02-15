import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnunciosRecord extends FirestoreRecord {
  AnunciosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FotoAnuncio" field.
  String? _fotoAnuncio;
  String get fotoAnuncio => _fotoAnuncio ?? '';
  bool hasFotoAnuncio() => _fotoAnuncio != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "Anunciado" field.
  bool? _anunciado;
  bool get anunciado => _anunciado ?? false;
  bool hasAnunciado() => _anunciado != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Plano_do_Anuncio" field.
  String? _planoDoAnuncio;
  String get planoDoAnuncio => _planoDoAnuncio ?? '';
  bool hasPlanoDoAnuncio() => _planoDoAnuncio != null;

  // "Valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "Uaid" field.
  String? _uaid;
  String get uaid => _uaid ?? '';
  bool hasUaid() => _uaid != null;

  // "imagensProdutoList" field.
  List<String>? _imagensProdutoList;
  List<String> get imagensProdutoList => _imagensProdutoList ?? const [];
  bool hasImagensProdutoList() => _imagensProdutoList != null;

  // "ImagensProdutoRef" field.
  DocumentReference? _imagensProdutoRef;
  DocumentReference? get imagensProdutoRef => _imagensProdutoRef;
  bool hasImagensProdutoRef() => _imagensProdutoRef != null;

  // "AnuncianteRef" field.
  DocumentReference? _anuncianteRef;
  DocumentReference? get anuncianteRef => _anuncianteRef;
  bool hasAnuncianteRef() => _anuncianteRef != null;

  // "valorProduto" field.
  double? _valorProduto;
  double get valorProduto => _valorProduto ?? 0.0;
  bool hasValorProduto() => _valorProduto != null;

  // "opcaoDeAnuncio" field.
  String? _opcaoDeAnuncio;
  String get opcaoDeAnuncio => _opcaoDeAnuncio ?? '';
  bool hasOpcaoDeAnuncio() => _opcaoDeAnuncio != null;

  // "isCapaCategoria" field.
  bool? _isCapaCategoria;
  bool get isCapaCategoria => _isCapaCategoria ?? false;
  bool hasIsCapaCategoria() => _isCapaCategoria != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fotoAnuncio = snapshotData['FotoAnuncio'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _anunciado = snapshotData['Anunciado'] as bool?;
    _categoria = snapshotData['Categoria'] as String?;
    _planoDoAnuncio = snapshotData['Plano_do_Anuncio'] as String?;
    _valor = snapshotData['Valor'] as String?;
    _uaid = snapshotData['Uaid'] as String?;
    _imagensProdutoList = getDataList(snapshotData['imagensProdutoList']);
    _imagensProdutoRef =
        snapshotData['ImagensProdutoRef'] as DocumentReference?;
    _anuncianteRef = snapshotData['AnuncianteRef'] as DocumentReference?;
    _valorProduto = castToType<double>(snapshotData['valorProduto']);
    _opcaoDeAnuncio = snapshotData['opcaoDeAnuncio'] as String?;
    _isCapaCategoria = snapshotData['isCapaCategoria'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Anuncios')
          : FirebaseFirestore.instance.collectionGroup('Anuncios');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Anuncios').doc(id);

  static Stream<AnunciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnunciosRecord.fromSnapshot(s));

  static Future<AnunciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnunciosRecord.fromSnapshot(s));

  static AnunciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnunciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnunciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnunciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnunciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnunciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnunciosRecordData({
  String? fotoAnuncio,
  String? descricao,
  bool? anunciado,
  String? categoria,
  String? planoDoAnuncio,
  String? valor,
  String? uaid,
  DocumentReference? imagensProdutoRef,
  DocumentReference? anuncianteRef,
  double? valorProduto,
  String? opcaoDeAnuncio,
  bool? isCapaCategoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FotoAnuncio': fotoAnuncio,
      'Descricao': descricao,
      'Anunciado': anunciado,
      'Categoria': categoria,
      'Plano_do_Anuncio': planoDoAnuncio,
      'Valor': valor,
      'Uaid': uaid,
      'ImagensProdutoRef': imagensProdutoRef,
      'AnuncianteRef': anuncianteRef,
      'valorProduto': valorProduto,
      'opcaoDeAnuncio': opcaoDeAnuncio,
      'isCapaCategoria': isCapaCategoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnunciosRecordDocumentEquality implements Equality<AnunciosRecord> {
  const AnunciosRecordDocumentEquality();

  @override
  bool equals(AnunciosRecord? e1, AnunciosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fotoAnuncio == e2?.fotoAnuncio &&
        e1?.descricao == e2?.descricao &&
        e1?.anunciado == e2?.anunciado &&
        e1?.categoria == e2?.categoria &&
        e1?.planoDoAnuncio == e2?.planoDoAnuncio &&
        e1?.valor == e2?.valor &&
        e1?.uaid == e2?.uaid &&
        listEquality.equals(e1?.imagensProdutoList, e2?.imagensProdutoList) &&
        e1?.imagensProdutoRef == e2?.imagensProdutoRef &&
        e1?.anuncianteRef == e2?.anuncianteRef &&
        e1?.valorProduto == e2?.valorProduto &&
        e1?.opcaoDeAnuncio == e2?.opcaoDeAnuncio &&
        e1?.isCapaCategoria == e2?.isCapaCategoria;
  }

  @override
  int hash(AnunciosRecord? e) => const ListEquality().hash([
        e?.fotoAnuncio,
        e?.descricao,
        e?.anunciado,
        e?.categoria,
        e?.planoDoAnuncio,
        e?.valor,
        e?.uaid,
        e?.imagensProdutoList,
        e?.imagensProdutoRef,
        e?.anuncianteRef,
        e?.valorProduto,
        e?.opcaoDeAnuncio,
        e?.isCapaCategoria
      ]);

  @override
  bool isValidKey(Object? o) => o is AnunciosRecord;
}
