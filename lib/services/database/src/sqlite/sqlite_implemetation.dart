part of database_helper;

/// Implementation class for Sqlite database.
class _SqLiteImplementation implements DatabaseHelper {
  /// Reference to the database.
  static Database? _database;

  /// Getter of database.
  Future<Database> database({List<Table>? tables, String? nameDataBase})
   async =>_database ??= await initDb(tables:tables);

  /// Initializes SQLite database.
  Future<Database> initDb({List<Table>? tables, String? nameDataBase}) async {
    final String path = join(await getDatabasesPath(), '$nameDataBase.db');
    return openDatabase(path, version: 1, onCreate: (Database db, int version){
      _onCreate(db, version , tables : tables);
    });
  }

  ///Creates a new SQLite database..
  Future<void> _onCreate(Database db, int version, {List<Table>? tables})
   async {
    final StringBuffer allTables = StringBuffer();
    if(tables != null){
    for (final Table table in tables) {
      allTables.write(table.onString());
    }}
    return db.execute(allTables.toString());
  }

  /// Function who close instance of database sqlite.
  Future<void> close() async {
    await _database?.close();
  }

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<Table>? tables, String? nameDataBase = 'text',
       List<SQLiteQuery>? filters = const <SQLiteQuery>[]})async {
    final Database db = await database(tables:tables);

    final StringBuffer where = StringBuffer();
    final List<String> whereArgs = <String>[];
    for (final SQLiteQuery filter in filters!) {
      switch (filter.condition) {
        case SQLiteFieldCondition.isEqualTo :
          where.write('and ${filter.key} = ? ');
          whereArgs.add(filter.value);
        break;
        case SQLiteFieldCondition.isGreaterThan :
          where.write('and ${filter.key} > ? ');
          whereArgs.add(filter.value);
        break;
        case SQLiteFieldCondition.isGreaterThanOrEqualTo :
          where.write('and ${filter.key} >= ? ');
          whereArgs.add(filter.value);
        break;
        case SQLiteFieldCondition.isLessThan :
          where.write('and ${filter.key} < ? ');
          whereArgs.add(filter.value);
        break;
        case SQLiteFieldCondition.isLessThanOrEqualTo :
          where.write('and ${filter.key} <= ? ');
          whereArgs.add(filter.value);
        break;
        case SQLiteFieldCondition.isNotEqualTo :
          where.write('and ${filter.key} <> ? ');
          whereArgs.add(filter.value);
        break;
      }
    }
    return db.query(
            collectionPath,
            where: where.toString(),
            whereArgs: whereArgs,
          );
    
  }

  @override
  Future<bool?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    final Database db = await database();
    if (collectionPath.isEmpty || collectionPath.split('/').length > 1) {
      return null;
    } else {
      final int i = await db.insert(
        collectionPath,
        recordMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return i != 0;
    }
  }

  @override
  Future<bool?> removeRecordByPath(
      String collectionPath, int documentId) async {
    final Database db = await database();
    if (collectionPath.isEmpty || collectionPath.split('/').length > 1) {
      return null;
    } else {
      final int i = await db.delete(
        collectionPath,
        where: 'id = ?',
        whereArgs: <int>[documentId],
      );
      return i != 0;
    }
  }
}
