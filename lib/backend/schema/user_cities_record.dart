import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserCitiesRecord extends FirestoreRecord {
  UserCitiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "savedCity" field.
  String? _savedCity;
  String get savedCity => _savedCity ?? '';
  bool hasSavedCity() => _savedCity != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _savedCity = snapshotData['savedCity'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userCities');

  static Stream<UserCitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserCitiesRecord.fromSnapshot(s));

  static Future<UserCitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserCitiesRecord.fromSnapshot(s));

  static UserCitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCitiesRecordData({
  DocumentReference? uid,
  String? savedCity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'savedCity': savedCity,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCitiesRecordDocumentEquality implements Equality<UserCitiesRecord> {
  const UserCitiesRecordDocumentEquality();

  @override
  bool equals(UserCitiesRecord? e1, UserCitiesRecord? e2) {
    return e1?.uid == e2?.uid && e1?.savedCity == e2?.savedCity;
  }

  @override
  int hash(UserCitiesRecord? e) =>
      const ListEquality().hash([e?.uid, e?.savedCity]);

  @override
  bool isValidKey(Object? o) => o is UserCitiesRecord;
}
