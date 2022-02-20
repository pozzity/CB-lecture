import 'package:flutter_test/flutter_test.dart';

import '../../database_internal.dart';

void main() {
  group('Retrieves data on fake implementation.', () {
    test('Retrieves data by id.', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('id', 1, DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      expect(verses?.length, 1);
      expect(verses?.first['id'], 1);
    });
    test('Retrieves data by translation.', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 = DatabaseQuery(
          'translation', 'translation_1', DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      final bool? expectValue = verses?.any((Map<String, dynamic> element) =>
          element['translation'] == 'translation_1');

      expect(expectValue, true);
    });
    test('Retrieves data by book.', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('book', 'luc', DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      final bool? expectValue = verses
          ?.any((Map<String, dynamic> element) => element['book'] == 'luc');

      expect(expectValue, true);
    });
  });

  group('Updates data on fake implementation.', () {
    test('Updates data succefully', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
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

      final bool status = await database.updateRecord('verse', updateMap,
          filters: filters);

      expect(status, true);
    });
    test('Updates data error', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
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

      final bool status = await database.updateRecord('verse', updateMap,
          filters: filters);

      expect(status, false);
    });
  });

  group('Create data on fake implementation.', () {
    test('Create succefully', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final Map<String, dynamic> recordMap = <String, dynamic>{
        'translation': 'tra3',
        'path': 'verse',
        'verseNum': 6,
        'book': 'timote',
        'chapter': '2',
        'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        'favorite': true,
      };
      final bool status = await database.createRecord('verse', recordMap);
      expect(status, true);
    });
  });

  group('Delete data on fake implementation.', () {
    test('Delete succefully', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final bool status = await database.removeRecordById('verse', 1);
      expect(status, true);
    });
    test('Delete error', () async {
      final DatabaseInternal database = DatabaseInternal.fakeSqlite();
      final bool status = await database.removeRecordById('verse', 10);
      expect(status, false);
    });
  });
}
