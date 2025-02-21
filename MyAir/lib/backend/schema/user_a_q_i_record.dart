import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserAQIRecord extends FirestoreRecord {
  UserAQIRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "AQI" field.
  String? _aqi;
  String get aqi => _aqi ?? '';
  bool hasAqi() => _aqi != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "PM10" field.
  String? _pm10;
  String get pm10 => _pm10 ?? '';
  bool hasPm10() => _pm10 != null;

  // "PM25" field.
  String? _pm25;
  String get pm25 => _pm25 ?? '';
  bool hasPm25() => _pm25 != null;

  // "NO2" field.
  String? _no2;
  String get no2 => _no2 ?? '';
  bool hasNo2() => _no2 != null;

  // "CO" field.
  String? _co;
  String get co => _co ?? '';
  bool hasCo() => _co != null;

  // "SO2" field.
  String? _so2;
  String get so2 => _so2 ?? '';
  bool hasSo2() => _so2 != null;

  // "O3" field.
  String? _o3;
  String get o3 => _o3 ?? '';
  bool hasO3() => _o3 != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _aqi = snapshotData['AQI'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _city = snapshotData['city'] as String?;
    _pm10 = snapshotData['PM10'] as String?;
    _pm25 = snapshotData['PM25'] as String?;
    _no2 = snapshotData['NO2'] as String?;
    _co = snapshotData['CO'] as String?;
    _so2 = snapshotData['SO2'] as String?;
    _o3 = snapshotData['O3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAQI');

  static Stream<UserAQIRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAQIRecord.fromSnapshot(s));

  static Future<UserAQIRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAQIRecord.fromSnapshot(s));

  static UserAQIRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAQIRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAQIRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAQIRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAQIRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAQIRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAQIRecordData({
  DocumentReference? uid,
  String? aqi,
  DateTime? date,
  String? city,
  String? pm10,
  String? pm25,
  String? no2,
  String? co,
  String? so2,
  String? o3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'AQI': aqi,
      'date': date,
      'city': city,
      'PM10': pm10,
      'PM25': pm25,
      'NO2': no2,
      'CO': co,
      'SO2': so2,
      'O3': o3,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAQIRecordDocumentEquality implements Equality<UserAQIRecord> {
  const UserAQIRecordDocumentEquality();

  @override
  bool equals(UserAQIRecord? e1, UserAQIRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.aqi == e2?.aqi &&
        e1?.date == e2?.date &&
        e1?.city == e2?.city &&
        e1?.pm10 == e2?.pm10 &&
        e1?.pm25 == e2?.pm25 &&
        e1?.no2 == e2?.no2 &&
        e1?.co == e2?.co &&
        e1?.so2 == e2?.so2 &&
        e1?.o3 == e2?.o3;
  }

  @override
  int hash(UserAQIRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.aqi,
        e?.date,
        e?.city,
        e?.pm10,
        e?.pm25,
        e?.no2,
        e?.co,
        e?.so2,
        e?.o3
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAQIRecord;
}
