import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../database.dart';

/// Database implementation using Firebase Firestore & Storage.
class FirestoreImplementation implements Database {
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;

 

  @override
  Future<int?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    try {
      await _databaseReference.collection(collectionPath).add(recordMap);
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<int?> removeRecordByPath(
      String collectionPath, int documentId) async {
    try {
          await _databaseReference.collection('$collectionPath/$documentId')
          .doc().delete();
      log('Records removed');
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }


  @override
  Future<List<Map<String, dynamic>>?> getCollection(
      String collectionPath,
      {List<DocumentQuery> filters = const <DocumentQuery>[]}) async {
    try {
      CollectionReference<Map<String, dynamic>> query = 
          _databaseReference.collection(collectionPath);
      for (final DocumentQuery docQuery in filters) {
        switch (docQuery.condition) {
          case DocumentFieldCondition.isEqualTo:
            query = query.where(docQuery.key, isEqualTo: docQuery.value) 
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DocumentFieldCondition.isGreaterThan:
            query = query.where(docQuery.key, isGreaterThan: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;;
            break;
          case DocumentFieldCondition.isGreaterThanOrEqualTo:
            query = query.where(docQuery.key,
            isGreaterThanOrEqualTo: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DocumentFieldCondition.isLessThan:
            query = query.where(docQuery.key, isLessThan: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;
            break;
          case DocumentFieldCondition.isLessThanOrEqualTo:
            query =
                query.where(docQuery.key, isLessThanOrEqualTo: docQuery.value)
                  as CollectionReference<Map<String, dynamic>>;
            break;
          case DocumentFieldCondition.isNotEqualTo:
            query = query.where(docQuery.key, isNotEqualTo: docQuery.value)
              as CollectionReference<Map<String, dynamic>>;;
            break;
        }
      }
      final QuerySnapshot<Map<String, dynamic>> result = await query.get();
      final Map<String, Map<dynamic, dynamic>> list =
          <String, Map<dynamic, dynamic>>{};

      for (int i = 0; i < result.docs.length; ++i) {
        list[result.docs[i].id] = result.docs[i].data();
      }
      return list as List<Map<String, dynamic>>?;
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

}

/// A document query class for record info related data.
class DocumentQuery {
  /// Constructs the document query field class.
  DocumentQuery(this.key, this.value, this.condition);
  /// The value of the field name.
  String key;

  /// The value of the field parameter.
  dynamic value;

  /// Database querying condition to be applied on the
  /// value of the field parameter.
  DocumentFieldCondition condition;


}

/// A document field specification for querying.
enum DocumentFieldCondition {
  /// Condition that will be used to check if
  /// field value matches the database value.
  isEqualTo,

  /// Condition that will be used to check if
  /// field value is greater than the database value.
  isGreaterThan,

  /// Condition that will be used to check if
  /// field value is greater than or equals to the database value.
  isGreaterThanOrEqualTo,

  /// Condition that will be used to check if
  /// field value is less than the database value.
  isLessThan,

  /// Condition that will be used to check if
  /// field value is less than or equals to the database value.
  isLessThanOrEqualTo,

  /// Condition that will be used to check if
  /// field value is not equals to the database value.
  isNotEqualTo
}
