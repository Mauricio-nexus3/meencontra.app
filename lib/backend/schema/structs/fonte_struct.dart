// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FonteStruct extends FFFirebaseStruct {
  FonteStruct({
    String? nome,
    String? img,
    String? arroba,
    String? site,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _img = img,
        _arroba = arroba,
        _site = site,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "arroba" field.
  String? _arroba;
  String get arroba => _arroba ?? '';
  set arroba(String? val) => _arroba = val;

  bool hasArroba() => _arroba != null;

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  set site(String? val) => _site = val;

  bool hasSite() => _site != null;

  static FonteStruct fromMap(Map<String, dynamic> data) => FonteStruct(
        nome: data['nome'] as String?,
        img: data['img'] as String?,
        arroba: data['arroba'] as String?,
        site: data['site'] as String?,
      );

  static FonteStruct? maybeFromMap(dynamic data) =>
      data is Map ? FonteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'img': _img,
        'arroba': _arroba,
        'site': _site,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'arroba': serializeParam(
          _arroba,
          ParamType.String,
        ),
        'site': serializeParam(
          _site,
          ParamType.String,
        ),
      }.withoutNulls;

  static FonteStruct fromSerializableMap(Map<String, dynamic> data) =>
      FonteStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        arroba: deserializeParam(
          data['arroba'],
          ParamType.String,
          false,
        ),
        site: deserializeParam(
          data['site'],
          ParamType.String,
          false,
        ),
      );

  static FonteStruct fromAlgoliaData(Map<String, dynamic> data) => FonteStruct(
        nome: convertAlgoliaParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        img: convertAlgoliaParam(
          data['img'],
          ParamType.String,
          false,
        ),
        arroba: convertAlgoliaParam(
          data['arroba'],
          ParamType.String,
          false,
        ),
        site: convertAlgoliaParam(
          data['site'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FonteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FonteStruct &&
        nome == other.nome &&
        img == other.img &&
        arroba == other.arroba &&
        site == other.site;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, img, arroba, site]);
}

FonteStruct createFonteStruct({
  String? nome,
  String? img,
  String? arroba,
  String? site,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FonteStruct(
      nome: nome,
      img: img,
      arroba: arroba,
      site: site,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FonteStruct? updateFonteStruct(
  FonteStruct? fonte, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fonte
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFonteStructData(
  Map<String, dynamic> firestoreData,
  FonteStruct? fonte,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fonte == null) {
    return;
  }
  if (fonte.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fonte.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fonteData = getFonteFirestoreData(fonte, forFieldValue);
  final nestedData = fonteData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fonte.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFonteFirestoreData(
  FonteStruct? fonte, [
  bool forFieldValue = false,
]) {
  if (fonte == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fonte.toMap());

  // Add any Firestore field values
  fonte.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFonteListFirestoreData(
  List<FonteStruct>? fontes,
) =>
    fontes?.map((e) => getFonteFirestoreData(e, true)).toList() ?? [];
