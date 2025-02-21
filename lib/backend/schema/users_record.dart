import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "AQIaverage" field.
  int? _aQIaverage;
  int get aQIaverage => _aQIaverage ?? 0;
  bool hasAQIaverage() => _aQIaverage != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "lang" field.
  String? _lang;
  String get lang => _lang ?? '';
  bool hasLang() => _lang != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  bool hasLng() => _lng != null;

  // "fav_city" field.
  String? _favCity;
  String get favCity => _favCity ?? '';
  bool hasFavCity() => _favCity != null;

  // "PM25average" field.
  int? _pM25average;
  int get pM25average => _pM25average ?? 0;
  bool hasPM25average() => _pM25average != null;

  // "PM10average" field.
  int? _pM10average;
  int get pM10average => _pM10average ?? 0;
  bool hasPM10average() => _pM10average != null;

  // "COaverage" field.
  int? _cOaverage;
  int get cOaverage => _cOaverage ?? 0;
  bool hasCOaverage() => _cOaverage != null;

  // "NO2average" field.
  int? _nO2average;
  int get nO2average => _nO2average ?? 0;
  bool hasNO2average() => _nO2average != null;

  // "SO2average" field.
  int? _sO2average;
  int get sO2average => _sO2average ?? 0;
  bool hasSO2average() => _sO2average != null;

  // "O3average" field.
  int? _o3average;
  int get o3average => _o3average ?? 0;
  bool hasO3average() => _o3average != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _aQIaverage = castToType<int>(snapshotData['AQIaverage']);
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _lang = snapshotData['lang'] as String?;
    _lat = snapshotData['lat'] as String?;
    _lng = snapshotData['lng'] as String?;
    _favCity = snapshotData['fav_city'] as String?;
    _pM25average = castToType<int>(snapshotData['PM25average']);
    _pM10average = castToType<int>(snapshotData['PM10average']);
    _cOaverage = castToType<int>(snapshotData['COaverage']);
    _nO2average = castToType<int>(snapshotData['NO2average']);
    _sO2average = castToType<int>(snapshotData['SO2average']);
    _o3average = castToType<int>(snapshotData['O3average']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? aQIaverage,
  DateTime? birthdate,
  String? lang,
  String? lat,
  String? lng,
  String? favCity,
  int? pM25average,
  int? pM10average,
  int? cOaverage,
  int? nO2average,
  int? sO2average,
  int? o3average,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'AQIaverage': aQIaverage,
      'birthdate': birthdate,
      'lang': lang,
      'lat': lat,
      'lng': lng,
      'fav_city': favCity,
      'PM25average': pM25average,
      'PM10average': pM10average,
      'COaverage': cOaverage,
      'NO2average': nO2average,
      'SO2average': sO2average,
      'O3average': o3average,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.aQIaverage == e2?.aQIaverage &&
        e1?.birthdate == e2?.birthdate &&
        e1?.lang == e2?.lang &&
        e1?.lat == e2?.lat &&
        e1?.lng == e2?.lng &&
        e1?.favCity == e2?.favCity &&
        e1?.pM25average == e2?.pM25average &&
        e1?.pM10average == e2?.pM10average &&
        e1?.cOaverage == e2?.cOaverage &&
        e1?.nO2average == e2?.nO2average &&
        e1?.sO2average == e2?.sO2average &&
        e1?.o3average == e2?.o3average;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.aQIaverage,
        e?.birthdate,
        e?.lang,
        e?.lat,
        e?.lng,
        e?.favCity,
        e?.pM25average,
        e?.pM10average,
        e?.cOaverage,
        e?.nO2average,
        e?.sO2average,
        e?.o3average
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
