library database;


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';
import 'database_internal.dart';

part 'src/firestore/firestore_implementation.dart';
part 'src/fake_firestore/fake_firestore_implemebtation.dart';

/// Helpers class that help us to retrieve, edit or delete document or
/// Collection from our database.
abstract class DatabaseExternal {

  /// Constructs a new Database instance of [_FirestoreImplementation].
  factory DatabaseExternal.firestore() => _FirestoreImplementation();
  
   /// Constructs a new Database instance of [_FakeFireStoreImplementation].
  factory DatabaseExternal.fakeFireStore() => _FakeFireStoreImplementation();

 /// Creates a record as map for database inputs and returns the generated
  /// document id.
  /// * [collectionPath] The path to the collection.
  ///   e.g - "translations"
  Future<String?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap);

  /// Set a data to the given [documentPath].
  /// If the document does not exit at the given [documentPath], data will be
  /// created. Otherwise, the document will be replaces by the given
  /// [recordMap].
  /// * [documentPath] The path to the document.
  ///   e.g - "translations/{translationId}"
  /// * [recordMap] The data that will set to the document.
  Future<bool> setRecord(String documentPath, Map<String, dynamic> recordMap);

  /// Removes all documents of [collectionPath] collection
  /// who have id in [documentsIds] list.
  /// * [collectionPath] The path to the collection.
  ///   e.g - "translations"
  Future<void> removeRecordsByPath(
      String collectionPath, List<String> documentsIds);

  /// Removes all documents that match the query, from the specified collection.
  /// * [collectionPath] The path to the collection.
  ///   e.g - "translations"
  Future<void> removeRecordByValue(
      String collectionPath, List<DatabaseQuery> documentQueries);

  /// Returns a map of documents records from the database.
  /// * [collectionPath] The path to the collection.
  ///   e.g - "translations"
  /// * [filters] The filter that will be applied on each record of the
  ///   collection.
  Future<Map<String, Map<dynamic, dynamic>>?> getCollection(
    String collectionPath, {
    List<DatabaseQuery> filters,
  });

  /// Returns a map representation of the documents.
  /// * [path] is the full path of the record.
  ///   e.g - "translations/{translationID}"
  Future<Map<dynamic, dynamic>?> getRecordByDocumentPath(String path);
}
