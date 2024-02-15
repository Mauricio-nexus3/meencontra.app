import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedesSociaisRecord extends FirestoreRecord {
  RedesSociaisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "Facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "Site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "Youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "Whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _instagram = snapshotData['Instagram'] as String?;
    _facebook = snapshotData['Facebook'] as String?;
    _site = snapshotData['Site'] as String?;
    _youtube = snapshotData['Youtube'] as String?;
    _whatsapp = snapshotData['Whatsapp'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('RedesSociais')
          : FirebaseFirestore.instance.collectionGroup('RedesSociais');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('RedesSociais').doc(id);

  static Stream<RedesSociaisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedesSociaisRecord.fromSnapshot(s));

  static Future<RedesSociaisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedesSociaisRecord.fromSnapshot(s));

  static RedesSociaisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedesSociaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedesSociaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedesSociaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedesSociaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedesSociaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedesSociaisRecordData({
  String? instagram,
  String? facebook,
  String? site,
  String? youtube,
  String? whatsapp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Instagram': instagram,
      'Facebook': facebook,
      'Site': site,
      'Youtube': youtube,
      'Whatsapp': whatsapp,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedesSociaisRecordDocumentEquality
    implements Equality<RedesSociaisRecord> {
  const RedesSociaisRecordDocumentEquality();

  @override
  bool equals(RedesSociaisRecord? e1, RedesSociaisRecord? e2) {
    return e1?.instagram == e2?.instagram &&
        e1?.facebook == e2?.facebook &&
        e1?.site == e2?.site &&
        e1?.youtube == e2?.youtube &&
        e1?.whatsapp == e2?.whatsapp;
  }

  @override
  int hash(RedesSociaisRecord? e) => const ListEquality()
      .hash([e?.instagram, e?.facebook, e?.site, e?.youtube, e?.whatsapp]);

  @override
  bool isValidKey(Object? o) => o is RedesSociaisRecord;
}
