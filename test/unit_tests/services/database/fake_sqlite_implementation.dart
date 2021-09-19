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

      expect(verses!.first['id'], 1);
    });
    test('Retrieve by Traductionid.', () async {
      final Database database = Database.fakeSqlite();
      final List<DatabaseQuery> filters = <DatabaseQuery>[];
      final DatabaseQuery databaseQuery1 =
          DatabaseQuery('traductionId',
           'tra1', DatabaseFieldCondition.isEqualTo);
      filters.add(databaseQuery1);

      final List<Map<String, dynamic>>? verses =
          await database.getCollection('verse', filters: filters);

      expect(verses!.first['traductionId'], 'tra1');
      expect(verses.length, 2);
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

      expect(verses!.first['book'], 'luc');
      expect(verses.length, 2);
    });
  });
}
