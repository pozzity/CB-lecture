import 'src/sqlite_implemetation.dart';

/// Helpers class that help us to retrieve, edit or delete document or
/// collection from our database.
abstract class Database {
  /// Constructs a new Database instance from the provided type in param.
  /// * [type] The database implementation to use.
  factory Database({required DatabaseType type}) {
    switch (type) {
      case DatabaseType.sQflite:
        return SqfliteImplementation();
      case DatabaseType.fireStore:
        return SqfliteImplementation();
      case DatabaseType.hive:
        return SqfliteImplementation();
      case DatabaseType.fake:
        return SqfliteImplementation();
    }
  }

  /// Retrieves the given collection from the database.
  /// * [collectionPath] the path to the collection to retrieve
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///       - collection_name/document-xxx/sub_collection_name
  ///    # For no sql implementation.
  ///       - table_name/book/chapter/verser
  ///       - table_name/book/chapter
  ///       - table_name/book
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath);

  /// Create collection from the database.
  /// * [collectionPath] the path to the collection to create
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///       - collection_name/document-xxx/sub_collection_name
  ///    # For no sql implementation [collectionPath].
  ///       - table_name
  Future<int?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap);

  /// Remove collection from the database.
  /// * [collectionPath] the path to the collection to remove
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///       - collection_name/document-xxx/sub_collection_name
  ///    # For no sql implementation.
  ///       - table_name/book/chapter/verser
  ///       - table_name/book/chapter
  ///       - table_name/book
  Future<int?> removeRecordByPath(
      String collectionPath, int documentsId);

}

/// Contains the list of available type of database to use.
enum DatabaseType {
  /// Represents the use of sqflite implementation.
  sQflite,

  /// Represents the use of sqflite implementation.
  fireStore,

  /// Represents the use of sqflite implementation.
  hive,

  /// Represents the use of fake implementation for debugging.
  fake
}

main(){
  Database database =  Database(type:DatabaseType.sQflite);
}