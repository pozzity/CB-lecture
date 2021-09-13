library database_helper;

import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;

part 'src/sqlite/sqlite_implemetation.dart';
part 'src/sqlite/sqlite_table.dart';
part 'src/sqlite/sqlite_colum.dart';
part 'src/helper/database_query.dart';
part 'src/fake_implemetation.dart';

/// Helpers class that help us to retrieve, edit or delete document or
/// Collection from our database.
abstract class Database {

  /// Constructs a new Database instance of [_SQLiteImplementation].
  factory Database.sqlite({
    required List<Table> tables, required String nameDataBase})=>
      _SQLiteImplementation(tables: tables, nameDataBase: nameDataBase);
  
  /// Constructs a new Database instance of [_FakeImplementation].
  factory Database.fake() => _FakeImplementation();


  /// Retrieves the given collection from the database.
  /// * [collectionPath] The path to the collection to retrieve.
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collectionName, filter?
  ///    # For sql implementation.
  ///       - tableName, filter?
  ///    # For no sql implementation.
  ///       - table_name/book/chapter/verser
  ///       - table_name/book/chapter
  ///       - table_name/book
  /// * return 
  ///     # Succes : Get record in our database as List<Map<String, dynamic>
  ///     # Echec : Null
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath, 
    {List<DatabaseQuery>? filters});

  /// Create collection from the database.
  /// * [collectionPath] the path to the collection to create
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name, recordMap
  ///    # For  sql implementation [collectionPath].
  ///       - table_name, recordMap
  /// * return boolean
  ///     # Succes : true
  ///     # Echec : false
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap);

  /// Remove collection from the database.
  /// * [collectionPath] the path to the collection to remove
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collectionName , documentId
  ///    # For sql implementation.
  ///       - tableName , documentId
  /// * return boolean
  ///     # Succes : true
  ///     # Echec : false
  Future<bool> removeRecordByPath(
      String collectionPath, int documentId);
}
