import 'package:cb_lecture/services/database/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Retrieve data on fake implementation.', () {
    test('Retrieve by id.', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('id', 1, DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      expect(verses?.first['id'], 1);
    });
    test('Retrieve by translation.', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('translation',
           'tra1', DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      expect(verses?.first['translation'], 'tra1');
      expect(verses?.length, 2);
    });
    test('Retrieve by book.', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('book',
           'luc', DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      expect(verses?.first['book'], 'luc');
      expect(verses?.length, 2);
    });
  });

  group('Update data on fake implementation.', () {
    test('Update succefully', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('id', 5, DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);
      final Map<String, dynamic> updateMap = <String, dynamic>{
          'id': 5,
          'translation': 'tra3',
          'path': 'verse',
          'verseNum': 5,
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': true,
        };

      final bool status = await database.
        updateRecordByPath('verse', updateMap, filters: filters);

      expect(status, true);
    });
    test('Update error', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('id', 6, DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);
      final Map<String, dynamic> updateMap = <String, dynamic>{
          'id': 5,
          'translation': 'tra3',
          'path': 'verse',
          'verseNum': 5,
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': true,
        };

      final bool status = await database.
        updateRecordByPath('verse', updateMap, filters: filters);

      expect(status, false);
    });
  });

  group('Create data on fake implementation.', () {
    test('Create succefully', () async {
      final Database database = Database.fakeSqlite();
      final Map<String, dynamic> recordMap = <String, dynamic>{
          'translation': 'tra3',
          'path': 'verse',
          'verseNum': 6,
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': true,
        };

      final bool status = await database.
        createRecord('verse', recordMap);

      expect(status, true);
    });
  });

   group('Delete data on fake implementation.', () {
    test('Delete succefully', () async {
      final Database database = Database.fakeSqlite();
      final bool status = await database.removeRecordByPath('verse', 1);
      expect(status, true);
    });
    test('Delete error', () async {
      final Database database = Database.fakeSqlite();
      final bool status = await database.removeRecordByPath('verse', 10);
      expect(status, false);
    });
  });
}
