import 'dart:async';

import 'package:calendrierbiblic/models/evenement.dart';
import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

/// the manager of data base
class DbM {
  static const _dataBaseName = "calendrier_biblique_01.db";
  static DbM _instance;
  static const TABLE_NAME = [Verses.ID, Events.ID];

//  static bool _resourceBlocked = false;
  static Future<sql.Database> _database;

  Future<sql.Database> get database async {
    while (_database == null) {
      await Future.delayed(Duration(seconds: 1));
    }
    return _database;
  }

  factory DbM({Map<String, void Function()> mapDoWhenReady}) {
    final result = _instance ??
        () {
          final dbm = DbM._init();
          _instance ??= dbm;
          return dbm;
        }();
    if (mapDoWhenReady != null) {
      mapDoWhenReady.forEach((id, function) => function());
    }
    return result;
  }

  DbM._init() {
    sql.getDatabasesPath().then((gpath) {
      final databasePath = join(gpath, _dataBaseName);
      // build database object
      _database ??= sql.openDatabase(
        databasePath,
        onCreate: (db, version) async {
          final query = Events.empty().createStringQuery();
          final query2 = Verses.empty().createStringQuery();
          fn.log(eventQuery: query);
          fn.log(versesQuery: query2);
          await db.execute(query);
          await db.execute(query2);
//          generateData(db);
        },
        version: 1,
      );
    });
  }

  Future<String> migrateTable(String id, Map map,
      {listner(double average)}) async {
    if (!TABLE_NAME.contains(id)) return null;
    final db = await database;
    final abbreviation = map["abbreviation"].toString();
    final res = await db.query(id,
        distinct: true,
        where: "${VersesTable.COLUMNS_translate_id}=? ",
        whereArgs: [abbreviation],
        limit: 1);
    if (res != null && res.length > 0) return null;
    final List books = map["books"] as List;
    for (int i0 = 0; i0 < books.length; i0++) {
      final mapBook = books[i0];
      final List chapters = (mapBook["chapters"] as List);
      for (int i1 = 0; i1 < chapters.length; i1++) {
        final mapChapter = chapters[i1];
        final List verses = (mapChapter["verses"] as List);
        for (int i2 = 0; i2 < verses.length; i2++) {
          final mapVerse = verses[i2];
          final v = Verses(
              translateName: map["translation"],
              translateId: map["abbreviation"],
              livre: mapBook["name"],
              chapitre: mapChapter["chapter"],
              num: mapVerse["verse"],
              text: mapVerse["text"]);
          await db.insert(id, v.asMap(),
              conflictAlgorithm: sql.ConflictAlgorithm.ignore);
          if (listner != null) {
            final f1 = (i0) / books.length;
            final f2 = (i1) / (chapters.length * books.length);
            final f3 = (i2) / (verses.length * chapters.length * books.length);
            final convert = f1 + f2 + f3;
            final value = (convert * 100).round() / 100;
            listner(value.clamp(0, 1));
          }
        }
      }
    }
    if (listner != null) {
      listner(1.1);
    }
    return abbreviation;
  }

//  void generateData(sql.Database db) async {
//    final seed = Mock.genMock<Verses>(count: 100);
//    for (final model in seed) {
//      await db.insert(Verses.ID, model.asMap());
//    }
//
//    final seed2 = Mock.genMock<Events>(count: 30);
//    for (final model in seed2) {
//      await db.insert(Events.ID, model.asMap());
//    }
//  }
}

class TwoSet<A, B> {
  final A first;
  final B second;

  TwoSet(this.first, this.second);
}
