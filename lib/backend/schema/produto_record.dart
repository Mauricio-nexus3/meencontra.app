import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoRecord extends FirestoreRecord {
  ProdutoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "FotoProduto" field.
  String? _fotoProduto;
  String get fotoProduto => _fotoProduto ?? '';
  bool hasFotoProduto() => _fotoProduto != null;

  // "NomeProduto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  bool hasNomeProduto() => _nomeProduto != null;

  // "RefCatalogo" field.
  DocumentReference? _refCatalogo;
  DocumentReference? get refCatalogo => _refCatalogo;
  bool hasRefCatalogo() => _refCatalogo != null;

  // "NomeDaCategoria" field.
  String? _nomeDaCategoria;
  String get nomeDaCategoria => _nomeDaCategoria ?? '';
  bool hasNomeDaCategoria() => _nomeDaCategoria != null;

  // "ValorProduto" field.
  String? _valorProduto;
  String get valorProduto => _valorProduto ?? '';
  bool hasValorProduto() => _valorProduto != null;

  // "DescricaoProduto" field.
  String? _descricaoProduto;
  String get descricaoProduto => _descricaoProduto ?? '';
  bool hasDescricaoProduto() => _descricaoProduto != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "ValorVenda" field.
  double? _valorVenda;
  double get valorVenda => _valorVenda ?? 0.0;
  bool hasValorVenda() => _valorVenda != null;

  // "ValorPromocional" field.
  double? _valorPromocional;
  double get valorPromocional => _valorPromocional ?? 0.0;
  bool hasValorPromocional() => _valorPromocional != null;

  // "ValorCusto" field.
  double? _valorCusto;
  double get valorCusto => _valorCusto ?? 0.0;
  bool hasValorCusto() => _valorCusto != null;

  // "codigoProduto" field.
  String? _codigoProduto;
  String get codigoProduto => _codigoProduto ?? '';
  bool hasCodigoProduto() => _codigoProduto != null;

  // "ImagensProduto" field.
  List<String>? _imagensProduto;
  List<String> get imagensProduto => _imagensProduto ?? const [];
  bool hasImagensProduto() => _imagensProduto != null;

  // "ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "numeroVisualizacoes" field.
  double? _numeroVisualizacoes;
  double get numeroVisualizacoes => _numeroVisualizacoes ?? 0.0;
  bool hasNumeroVisualizacoes() => _numeroVisualizacoes != null;

  // "ProdutoAnunciado" field.
  bool? _produtoAnunciado;
  bool get produtoAnunciado => _produtoAnunciado ?? false;
  bool hasProdutoAnunciado() => _produtoAnunciado != null;

  // "ProdutosEmDestaque" field.
  bool? _produtosEmDestaque;
  bool get produtosEmDestaque => _produtosEmDestaque ?? false;
  bool hasProdutosEmDestaque() => _produtosEmDestaque != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fotoProduto = snapshotData['FotoProduto'] as String?;
    _nomeProduto = snapshotData['NomeProduto'] as String?;
    _refCatalogo = snapshotData['RefCatalogo'] as DocumentReference?;
    _nomeDaCategoria = snapshotData['NomeDaCategoria'] as String?;
    _valorProduto = snapshotData['ValorProduto'] as String?;
    _descricaoProduto = snapshotData['DescricaoProduto'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _valorVenda = castToType<double>(snapshotData['ValorVenda']);
    _valorPromocional = castToType<double>(snapshotData['ValorPromocional']);
    _valorCusto = castToType<double>(snapshotData['ValorCusto']);
    _codigoProduto = snapshotData['codigoProduto'] as String?;
    _imagensProduto = getDataList(snapshotData['ImagensProduto']);
    _ativo = snapshotData['ativo'] as bool?;
    _numeroVisualizacoes =
        castToType<double>(snapshotData['numeroVisualizacoes']);
    _produtoAnunciado = snapshotData['ProdutoAnunciado'] as bool?;
    _produtosEmDestaque = snapshotData['ProdutosEmDestaque'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Produto')
          : FirebaseFirestore.instance.collectionGroup('Produto');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Produto').doc(id);

  static Stream<ProdutoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutoRecord.fromSnapshot(s));

  static Future<ProdutoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutoRecord.fromSnapshot(s));

  static ProdutoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutoRecordData({
  String? fotoProduto,
  String? nomeProduto,
  DocumentReference? refCatalogo,
  String? nomeDaCategoria,
  String? valorProduto,
  String? descricaoProduto,
  DateTime? createdAt,
  double? valorVenda,
  double? valorPromocional,
  double? valorCusto,
  String? codigoProduto,
  bool? ativo,
  double? numeroVisualizacoes,
  bool? produtoAnunciado,
  bool? produtosEmDestaque,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'FotoProduto': fotoProduto,
      'NomeProduto': nomeProduto,
      'RefCatalogo': refCatalogo,
      'NomeDaCategoria': nomeDaCategoria,
      'ValorProduto': valorProduto,
      'DescricaoProduto': descricaoProduto,
      'created_at': createdAt,
      'ValorVenda': valorVenda,
      'ValorPromocional': valorPromocional,
      'ValorCusto': valorCusto,
      'codigoProduto': codigoProduto,
      'ativo': ativo,
      'numeroVisualizacoes': numeroVisualizacoes,
      'ProdutoAnunciado': produtoAnunciado,
      'ProdutosEmDestaque': produtosEmDestaque,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutoRecordDocumentEquality implements Equality<ProdutoRecord> {
  const ProdutoRecordDocumentEquality();

  @override
  bool equals(ProdutoRecord? e1, ProdutoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fotoProduto == e2?.fotoProduto &&
        e1?.nomeProduto == e2?.nomeProduto &&
        e1?.refCatalogo == e2?.refCatalogo &&
        e1?.nomeDaCategoria == e2?.nomeDaCategoria &&
        e1?.valorProduto == e2?.valorProduto &&
        e1?.descricaoProduto == e2?.descricaoProduto &&
        e1?.createdAt == e2?.createdAt &&
        e1?.valorVenda == e2?.valorVenda &&
        e1?.valorPromocional == e2?.valorPromocional &&
        e1?.valorCusto == e2?.valorCusto &&
        e1?.codigoProduto == e2?.codigoProduto &&
        listEquality.equals(e1?.imagensProduto, e2?.imagensProduto) &&
        e1?.ativo == e2?.ativo &&
        e1?.numeroVisualizacoes == e2?.numeroVisualizacoes &&
        e1?.produtoAnunciado == e2?.produtoAnunciado &&
        e1?.produtosEmDestaque == e2?.produtosEmDestaque;
  }

  @override
  int hash(ProdutoRecord? e) => const ListEquality().hash([
        e?.fotoProduto,
        e?.nomeProduto,
        e?.refCatalogo,
        e?.nomeDaCategoria,
        e?.valorProduto,
        e?.descricaoProduto,
        e?.createdAt,
        e?.valorVenda,
        e?.valorPromocional,
        e?.valorCusto,
        e?.codigoProduto,
        e?.imagensProduto,
        e?.ativo,
        e?.numeroVisualizacoes,
        e?.produtoAnunciado,
        e?.produtosEmDestaque
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutoRecord;
}
