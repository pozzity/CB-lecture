part of database;

/// Database implementation using Firebase Firestore & Storage.
class _FirestoreImplementation implements DatabaseExternal {
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;
  final Logger _log = Logger('_FirestoreImplementation');

  @override
  Future<String?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    try {
      final DocumentReference<Map<String, dynamic>> documentRef =
          await _databaseReference.collection(collectionPath).add(recordMap);
      return documentRef.id;
    } on FirebaseException catch (e) {
      _log.severe(e.toString(), e, e.stackTrace);
    }
  }

  @override
  Future<void> removeRecordsByPath(
      String collectionPath, List<String> documentsIds) async {
    if (documentsIds.isEmpty) {
      return;
    }
    try {
      final WriteBatch batch = _databaseReference.batch();
      for (final String documentId in documentsIds) {
        final DocumentReference<Map<String, dynamic>> docReference =
            _databaseReference.doc('$collectionPath/$documentId');
        batch.delete(docReference);
      }
      await batch.commit();
      _log.fine('Records removed');
    } on FirebaseException catch (e) {
      _log.severe(e.toString(), e, e.stackTrace);
    }
  }

  @override
  Future<void> removeRecordByValue(
      String collectionPath, List<DatabaseQuery> documentQueries) async {
    if (documentQueries.isEmpty) {
      return;
    }
    final WriteBatch batch = _databaseReference.batch();

    try {
      Query<Map<String, dynamic>> query =
          _databaseReference.collection(collectionPath);

      for (final DatabaseQuery docQuery in documentQueries) {
        switch (docQuery.condition) {
          case DatabaseFieldCondition.isEqualTo:
            {
              query = query.where(docQuery.key, isEqualTo: docQuery.value);
            }
            break;
          case DatabaseFieldCondition.isGreaterThan:
            {
              query = query.where(docQuery.key, isGreaterThan: docQuery.value);
            }
            break;
          case DatabaseFieldCondition.isGreaterThanOrEqualTo:
            {
              query = query.where(docQuery.key,
                  isGreaterThanOrEqualTo: docQuery.value);
            }
            break;
          case DatabaseFieldCondition.isLessThan:
            {
              query = query.where(docQuery.key, isLessThan: docQuery.value);
            }
            break;
          case DatabaseFieldCondition.isLessThanOrEqualTo:
            {
              query = query.where(docQuery.key,
                  isLessThanOrEqualTo: docQuery.value);
            }
            break;
          case DatabaseFieldCondition.isNotEqualTo:
            {
              query = query.where(docQuery.key, isNotEqualTo: docQuery.value);
            }
            break;
        }
      }

      await query.get().then((QuerySnapshot<Object?> querySnapshot) {
        for (final QueryDocumentSnapshot<Object?> doc in querySnapshot.docs) {
          batch.delete(doc.reference);
        }
      });
      await batch.commit();
    } on FirebaseException catch (e) {
      _log.severe(e.toString(), e, e.stackTrace);
    }
  }

  @override
  Future<Map<String, Map<dynamic, dynamic>>?> getCollection(
      String collectionPath,
      {List<DatabaseQuery> filters = const <DatabaseQuery>[]}) async {
    try {
      Query<Map<String, dynamic>> query =
          _databaseReference.collection(collectionPath);
      for (final DatabaseQuery docQuery in filters) {
        switch (docQuery.condition) {
          case DatabaseFieldCondition.isEqualTo:
            query = query.where(docQuery.key, isEqualTo: docQuery.value);
            break;
          case DatabaseFieldCondition.isGreaterThan:
            query = query.where(docQuery.key, isGreaterThan: docQuery.value);
            break;
          case DatabaseFieldCondition.isGreaterThanOrEqualTo:
            query = query.where(docQuery.key,
                isGreaterThanOrEqualTo: docQuery.value);
            break;
          case DatabaseFieldCondition.isLessThan:
            query = query.where(docQuery.key, isLessThan: docQuery.value);
            break;
          case DatabaseFieldCondition.isLessThanOrEqualTo:
            query =
                query.where(docQuery.key, isLessThanOrEqualTo: docQuery.value);
            break;
          case DatabaseFieldCondition.isNotEqualTo:
            query = query.where(docQuery.key, isNotEqualTo: docQuery.value);
            break;
        }
      }
      final QuerySnapshot<Map<String, dynamic>> result = await query.get();
      final Map<String, Map<dynamic, dynamic>> list =
          <String, Map<dynamic, dynamic>>{};

      for (int i = 0; i < result.docs.length; ++i) {
        list[result.docs[i].id] = result.docs[i].data();
      }
      return list;
    } on FirebaseException catch (e) {
      _log.warning(e.toString());
      return null;
    }
  }

  @override
  Future<Map<dynamic, dynamic>?> getRecordByDocumentPath(String path) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> result =
          await _databaseReference.doc(path).get();
      return result.data();
    } on FirebaseException catch (e) {
      _log.warning(e.toString());
      return null;
    }
  }

  @override
  Future<bool> setRecord(
      String documentPath, Map<String, dynamic> recordMap) async {
    try {
      await _databaseReference.doc(documentPath).set(recordMap);
      return true;
    } on FirebaseException catch (e) {
      _log.warning(e.toString());
      return false;
    }
  }
}
