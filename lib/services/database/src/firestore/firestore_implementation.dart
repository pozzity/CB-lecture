part of database_helper;

/// Database implementation using Firebase Firestore & Storage.
class _FirestoreImplementation implements Database {
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;

 @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    try {
    final Map<String, dynamic> record = 
      await _databaseReference.collection(collectionPath).add(recordMap)
      as Map<String, dynamic> ;
    return record.containsKey('id');
    } on FirebaseException catch (e) {
      log(e.toString());
      return false;
    }
  }

  

  @override
  Future<bool> removeRecordByPath(
      String collectionPath, int documentId) async {
    try {
      await _databaseReference.collection('$collectionPath/$documentId')
      .doc().delete();
      return true;
    } on FirebaseException catch (e) {
      log(e.toString());
      return false;
    }
  }


  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
     {List<DatabaseQuery>? filters = const <DatabaseQuery>[]}) async {
    try {
      CollectionReference<Map<String, dynamic>> query = 
        _databaseReference.collection(collectionPath);
      for (final DatabaseQuery docQuery in filters!) {
        switch (docQuery.condition) {
          case DatabaseFieldCondition.isEqualTo:
            query = query.where(docQuery.key, isEqualTo: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DatabaseFieldCondition.isGreaterThan:
            query = query.where(docQuery.key, isGreaterThan: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DatabaseFieldCondition.isGreaterThanOrEqualTo:
            query = query.where(docQuery.key,
                isGreaterThanOrEqualTo: docQuery.value)
                  as CollectionReference<Map<String, dynamic>>;
            break;
          case DatabaseFieldCondition.isLessThan:
            query = query.where(docQuery.key, isLessThan: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DatabaseFieldCondition.isLessThanOrEqualTo:
            query =
              query.where(docQuery.key, isLessThanOrEqualTo: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DatabaseFieldCondition.isNotEqualTo:
            query = query.where(docQuery.key, isNotEqualTo: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
        }
      }
      final QuerySnapshot<Map<String, dynamic>> result = await query.get();
      final Map<String, Map<dynamic, dynamic>> list =
          <String, Map<dynamic, dynamic>>{};

      for (int i = 0; i < result.docs.length; ++i) {
        list[result.docs[i].id] = result.docs[i].data();
      }
      return list as Future<List<Map<String, dynamic>>?>;
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

  


}
