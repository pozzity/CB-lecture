import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../database.dart' as our_bd;

/// Implementation class for Sqlite database.
class SqfliteImplementation implements our_bd.Database {
  /// Reference to the database.
  static Database? _database;

  /// Getter of database.
  Future<Database> get database async => _database ??= await initDb();

  /// Function who initialize the database sqlite.
  Future<Database> initDb() async {
    final String path = join(await getDatabasesPath(), 'cb_lecture.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  ///Function who create the database sqlite.
  Future<void> _onCreate(Database db, int version) async => db.execute(
      // ignore: prefer_adjacent_string_concatenation
      'CREATE TABLE Employee(id INTEGER PRIMARY KEY, firstname TEXT,' +
          'lastname TEXT, mobileno TEXT,emailId TEXT )');

  /// Function who close instance of database sqlite.
  Future<void> close() async {
    await _database?.close();
  }

  @override
  Future<List<Map<String, dynamic>>?> getCollection(
      String collectionPath ) async {
    final Database db = await database;
    switch (collectionPath.split('/').length) {
      case 2:
        {
          return db.query(
            collectionPath.split('/')[0],
            columns: <String>['book'],
            where: 'traductionId = ?',
            whereArgs: <String>[
              collectionPath.split('/')[1],
              ],
          );
        }
      case 3:
        {
          return db.query(
            collectionPath.split('/')[0],
            columns: <String>['chapter'],
            where: 'traductionId = ? and book= ?',
            whereArgs: <String>[
              collectionPath.split('/')[1],
              collectionPath.split('/')[2]
              ],
          );
        }
      case 4:
        {
          return db.query(
            collectionPath.split('/')[0],
            where: 'traductionId = ? and book = ? and chapter= ?',
            whereArgs: <String>[
              collectionPath.split('/')[1],
              collectionPath.split('/')[2],
              collectionPath.split('/')[3],
            ],
          );
        }
      case 5:
        {
          return db.query(
            collectionPath.split('/')[0],
            where: 'id = ?',
            whereArgs: <String>[
              collectionPath.split('/')[4],
            ],
          );
        }
      default:
        {
          return null;
        }
    }
  }

  @override
  Future<int?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    final Database db = await database;
    if (collectionPath.isEmpty || collectionPath.split('/').length > 1) {
      return null;
    } else {
      return db.insert(
        collectionPath,
        recordMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<int?> removeRecordByPath(
      String collectionPath, int documentId) async {
    final Database db = await database;
    if (collectionPath.isEmpty || collectionPath.split('/').length > 1) {
      return null;
    } else {
      return db.delete(
        collectionPath,
        where: 'id = ?',
        whereArgs: <int>[documentId],
      );
    }
  }
}
