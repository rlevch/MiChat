import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "posted" field.
  DateTime? _posted;
  DateTime? get posted => _posted;
  bool hasPosted() => _posted != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _posted = snapshotData['posted'] as DateTime?;
    _post = snapshotData['post'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? user,
  String? comment,
  DateTime? posted,
  DocumentReference? post,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'comment': comment,
      'posted': posted,
      'post': post,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.comment == e2?.comment &&
        e1?.posted == e2?.posted &&
        e1?.post == e2?.post;
  }

  @override
  int hash(CommentsRecord? e) =>
      const ListEquality().hash([e?.user, e?.comment, e?.posted, e?.post]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
