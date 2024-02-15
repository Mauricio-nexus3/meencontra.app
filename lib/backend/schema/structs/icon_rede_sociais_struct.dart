// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IconRedeSociaisStruct extends FFFirebaseStruct {
  IconRedeSociaisStruct({
    String? instagram,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _instagram = instagram,
        super(firestoreUtilData);

  // "Instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;
  bool hasInstagram() => _instagram != null;

  static IconRedeSociaisStruct fromMap(Map<String, dynamic> data) =>
      IconRedeSociaisStruct(
        instagram: data['Instagram'] as String?,
      );

  static IconRedeSociaisStruct? maybeFromMap(dynamic data) => data is Map
      ? IconRedeSociaisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Instagram': _instagram,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
      }.withoutNulls;

  static IconRedeSociaisStruct fromSerializableMap(Map<String, dynamic> data) =>
      IconRedeSociaisStruct(
        instagram: deserializeParam(
          data['Instagram'],
          ParamType.String,
          false,
        ),
      );

  static IconRedeSociaisStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IconRedeSociaisStruct(
        instagram: convertAlgoliaParam(
          data['Instagram'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IconRedeSociaisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IconRedeSociaisStruct && instagram == other.instagram;
  }

  @override
  int get hashCode => const ListEquality().hash([instagram]);
}

IconRedeSociaisStruct createIconRedeSociaisStruct({
  String? instagram,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IconRedeSociaisStruct(
      instagram: instagram,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IconRedeSociaisStruct? updateIconRedeSociaisStruct(
  IconRedeSociaisStruct? iconRedeSociais, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    iconRedeSociais
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIconRedeSociaisStructData(
  Map<String, dynamic> firestoreData,
  IconRedeSociaisStruct? iconRedeSociais,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (iconRedeSociais == null) {
    return;
  }
  if (iconRedeSociais.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && iconRedeSociais.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final iconRedeSociaisData =
      getIconRedeSociaisFirestoreData(iconRedeSociais, forFieldValue);
  final nestedData =
      iconRedeSociaisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = iconRedeSociais.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIconRedeSociaisFirestoreData(
  IconRedeSociaisStruct? iconRedeSociais, [
  bool forFieldValue = false,
]) {
  if (iconRedeSociais == null) {
    return {};
  }
  final firestoreData = mapToFirestore(iconRedeSociais.toMap());

  // Add any Firestore field values
  iconRedeSociais.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIconRedeSociaisListFirestoreData(
  List<IconRedeSociaisStruct>? iconRedeSociaiss,
) =>
    iconRedeSociaiss
        ?.map((e) => getIconRedeSociaisFirestoreData(e, true))
        .toList() ??
    [];
