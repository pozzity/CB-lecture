part of database_helper;

/// Helpers class that help us to retrieve, edit or delete document or
/// collection from our database.
abstract class DatabaseHelper {
  /// Constructs a new Database instance from the provided type in param.
  /// * [type] The database implementation to use.
  factory DatabaseHelper({required DatabaseType type}) {
    switch (type) {
      case DatabaseType.sQflite:
        return _SqLiteImplementation();
      case DatabaseType.fake:
        return _FakeImplementation();
    }
  }

  /// Retrieves the given collection from the database.
  /// * [collectionPath] the path to the collection to retrieve
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///    # For no sql implementation.
  ///       - table_name/book/chapter/verser
  ///       - table_name/book/chapter
  ///       - table_name/book
  /// * return 
  ///     # Succes : List<Map<String, dynamic>>
  ///     # Echec : Null
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath, 
    {List<Table>? tables, String? nameDataBase});

  /// Create collection from the database.
  /// * [collectionPath] the path to the collection to create
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///    # For  sql implementation [collectionPath].
  ///       - table_name/
  /// * return boolean
  ///     # Succes : true
  ///     # Echec : false, null
  Future<bool?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap);

  /// Remove collection from the database.
  /// * [collectionPath] the path to the collection to remove
  ///   eg: 
  ///    # For no sql implementation.
  ///       - collection_name/
  ///    # For no sql implementation.
  ///       - table_name/
  /// * return boolean
  ///     # Succes : true
  ///     # Echec : false, null
  Future<bool?> removeRecordByPath(
      String collectionPath, int documentId);
}

/// Contains the list of available type of database to use.
enum DatabaseType {
  /// Represents the use of sqflite implementation.
  sQflite,

  /// Represents the use of fake implementation for debugging.
  fake
}