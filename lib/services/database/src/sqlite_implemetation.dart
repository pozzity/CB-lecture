import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../database.dart' as our_bd;

/// Implementation class for Sqlite database.
class SqfliteImplementation implements our_bd.Database {

  /// Constructor who init database.
  @override
  Future<void> initBD(String nameDatabase) async {
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), '$nameDatabase.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (Database db, int version) {
        // Run the CREATE TABLE statement on the database.
        // return db.execute(
        //   'CREATE TABLE dogs(id INTEGER PRIMARY KEY,
        //     name TEXT, age INTEGER)',
        // );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  /// Get a reference to the database.
  Future<Database>? database;

  /// Function use for init our database.

  @override
  Map<String, dynamic> getCollection(String collectionPath) {
    throw UnimplementedError();
  }

  @override
  Future<String?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) {
    // TODO: implement createRecord
    throw UnimplementedError();
  }

  @override
  Future<void> removeRecordsByPath(
      String collectionPath, List<String> documentsIds) {
    // TODO: implement removeRecordsByPath
    throw UnimplementedError();
  }
}
