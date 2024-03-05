import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CitiesSuggestionRecord extends FirestoreRecord {
  CitiesSuggestionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citiesSuggestion');

  static Stream<CitiesSuggestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesSuggestionRecord.fromSnapshot(s));

  static Future<CitiesSuggestionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CitiesSuggestionRecord.fromSnapshot(s));

  static CitiesSuggestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CitiesSuggestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesSuggestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesSuggestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesSuggestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesSuggestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesSuggestionRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesSuggestionRecordDocumentEquality
    implements Equality<CitiesSuggestionRecord> {
  const CitiesSuggestionRecordDocumentEquality();

  @override
  bool equals(CitiesSuggestionRecord? e1, CitiesSuggestionRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(CitiesSuggestionRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is CitiesSuggestionRecord;
}
