part of database_helper;

/// Implementation class for Sqlite database.
class _SQLiteImplementation implements Database {

  /// Initialize class for [_SQLiteImplementation] database.
  _SQLiteImplementation(
      {required String nameDataBase, required List<Table> tables})  {
    _database =  initDb(tables: tables, nameDataBase: nameDataBase);
  }

  /// Reference to the database.
  static Future<sqlite.Database>? _database;

  /// Getter of instance database
  Future<sqlite.Database>? get database =>  _database;

  /// Initializes SQLite database
  Future<sqlite.Database> initDb(
      {List<Table>? tables, String? nameDataBase}) async {
    final String localPath =
        path.join(await sqlite.getDatabasesPath(), '$nameDataBase.db');
    return sqlite.openDatabase(localPath, version: 1,
        onCreate: (sqlite.Database db, int version) {
      _onCreate(db, version, tables: tables);
    });
  }

  /// Creates a new SQLite database..
  Future<void> _onCreate(sqlite.Database db, int version,
      {List<Table>? tables}) async {
    final StringBuffer allTables = StringBuffer();
    if (tables != null) {
      for (final Table table in tables) {
        allTables.write(table.onString());
      }
    }
    return db.execute(allTables.toString());
  }

  /// Function who close instance of database sqlite.
  Future<void> close() async {
    final sqlite.Database? db = await database;
    await db?.close();
  }

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<DatabaseQuery>? filters = const <DatabaseQuery>[]}) async {
    final sqlite.Database? db = await database;
    final StringBuffer bufferWhere = StringBuffer();
    final List<dynamic> whereArgs = <String>[];
    for (final DatabaseQuery filter in filters!) {
      switch (filter.condition) {
        case DatabaseFieldCondition.isEqualTo:
          bufferWhere.write('and ${filter.key} = ? ');
          whereArgs.add(filter.value);
          break;
        case DatabaseFieldCondition.isGreaterThan:
          bufferWhere.write('and ${filter.key} > ? ');
          whereArgs.add(filter.value);
          break;
        case DatabaseFieldCondition.isGreaterThanOrEqualTo:
          bufferWhere.write('and ${filter.key} >= ? ');
          whereArgs.add(filter.value);
          break;
        case DatabaseFieldCondition.isLessThan:
          bufferWhere.write('and ${filter.key} < ? ');
          whereArgs.add(filter.value);
          break;
        case DatabaseFieldCondition.isLessThanOrEqualTo:
          bufferWhere.write('and ${filter.key} <= ? ');
          whereArgs.add(filter.value);
          break;
        case DatabaseFieldCondition.isNotEqualTo:
          bufferWhere.write('and ${filter.key} <> ? ');
          whereArgs.add(filter.value);
          break;
      }
    }
    final String where = 
      bufferWhere.toString().substring(4 , bufferWhere.toString().length);
    return db?.query(
      collectionPath,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    final sqlite.Database? db = await database;
    final int i = await db!.insert(
      collectionPath,
      recordMap,
      conflictAlgorithm: sqlite.ConflictAlgorithm.replace,
    );
    return i != 0;
  }

  @override
  Future<bool> removeRecordByPath(
      String collectionPath, int documentId) async {
    final sqlite.Database? db = await database;
    final int i = await db!.delete(
      collectionPath,
      where: 'id = ?',
      whereArgs: <int>[documentId],
    );
    return i != 0;
  }
}
