library database_internal;

import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqlite;

part 'src/firestore/firestore_implementation.dart';
part 'src/fake_firestore/fake_firestore_implemebtation.dart';

part 'src/fake_sqlite/fake_sqlite_implemetation.dart';
part 'src/helper/database_query.dart';
part 'src/sqlite/lib/sqlite_colum.dart';
part 'src/sqlite/lib/sqlite_table.dart';
part 'src/sqlite/sqlite_implemetation.dart';

/// Helpers class that help us to retrieve, edit or delete document or
/// Collection from our database.
abstract class DatabaseInternal {
  /// Constructs a new Database instance of [_SQLiteImplementation].
  factory DatabaseInternal.sqlite(
          {required List<Table> tables, required String nameDataBase}) =>
      _SQLiteImplementation(tables: tables, nameDataBase: nameDataBase);

  /// Constructs a new Database instance of [_FirestoreImplementation].
  factory Database.firestore() => _FirestoreImplementation();

  /// Constructs a new Database instance of [_FakeSqliteImplementation].
  factory DatabaseInternal.fakeSqlite() => _FakeSqliteImplementation();

  /// Retrieves the given collection from the database.
  /// * [collectionPath] The path to the collection to retrieve.
  /// * [filters] The value filters the collection.
  ///   eg:
  ///    # For no sql implementation.
  ///       - collectionName, filter?
  ///    # For sql implementation.
  ///       - collectionName, filter?
  ///    # For fake sqlite implementation.
  ///       - collectionName : value possible [verse, chant], filter
  /// * return
  ///     # Succes : Get record in our database as List<Map<String, dynamic>
  ///     # Error : Null
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<DatabaseQuery>? filters});

  /// Create collection from the database.
  /// * [collectionPath] the path to the collection to create.
  /// * [recordMap] Value to create.
  ///
  ///   eg:
  ///    # For no sql implementation.
  ///       - collection_name, recordMap
  ///    # For  sqlite implementation .
  ///       - table_name, recordMap
  /// * return boolean
  ///     # Succes : true
  ///     # Error : false
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap);

  /// Remove collection from the database.
  /// * [collectionPath] the path to the collection to remove
  /// * [documentId] Id of collection remove.
  ///   eg:
  ///    # For no sql implementation.
  ///       - collectionName , documentId
  ///    # For sql implementation.
  ///       - tableName , documentId
  /// * return boolean
  ///     # Succes : true
  ///     # Error : false
  Future<bool> removeRecordById(String collectionPath, int documentId);

  /// Update collection from the database.
  /// * [collectionPath] the path to the collection to update
  /// * [updateMap] Collection update.
  /// * [filters] Filter for find collection update.
  ///   eg:
  ///    # For no sql implementation.
  ///       - collectionName , documentId
  ///    # For sql implementation.
  ///       - tableName , documentId
  /// * return boolean
  ///     # Succes : true
  ///     # Error : false
  Future<bool> updateRecord(
      String collectionPath, Map<String, dynamic> updateMap,
      {List<DatabaseQuery>? filters = const <DatabaseQuery>[]});

  /// Close instance of the database.
  Future<void> close();
}
