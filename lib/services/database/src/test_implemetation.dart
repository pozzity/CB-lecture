part of database_helper;

/// implementation class for fake database
class _FakeImplementation implements DatabaseHelper {
  final List<Map<String, dynamic>> _dataBase = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 1,
      'traductionId': 'tra1',
      'book': 'jean',
      'chapter': '1',
      'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
    },
    <String, dynamic>{
      'id': 2,
      'traductionId': 'tra1',
      'book': 'jean',
      'chapter': '1',
      'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
    },
    <String, dynamic>{
      'id': 3,
      'traductionId': 'tra1',
      'book': 'jean',
      'chapter': '2',
      'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
    },
    <String, dynamic>{
      'id': 4,
      'traductionId': 'tra1',
      'book': 'jean',
      'chapter': '2',
      'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
    },
    <String, dynamic>{
      'id': 5,
      'traductionId': 'tra1',
      'book': 'jean',
      'chapter': '2',
      'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
    },
  ];

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<Table>? tables,
      String? nameDataBase,
      List<SQLiteQuery>? filters}) async {
    final List<String> pathSegments = collectionPath.split('/');
    switch (pathSegments.length) {
      case 2:
        {
          return List<Map<String, dynamic>>.from(_dataBase.where(
                  (Map<String, dynamic> element) =>
                      element['traductionId'] == pathSegments[1]))
              as Future<List<Map<String, dynamic>>?>;
        }
      case 3:
        {
          return List<Map<String, dynamic>>.from(_dataBase.where(
                  (Map<String, dynamic> element) =>
                      element['traductionId'] == pathSegments[1] &&
                      element['book'] == pathSegments[2]))
              as Future<List<Map<String, dynamic>>?>;
        }
      case 4:
        {
          return List<Map<String, dynamic>>.from(_dataBase.where(
                  (Map<String, dynamic> element) =>
                      element['traductionId'] == pathSegments[1] &&
                      element['book'] == pathSegments[2] &&
                      element['chapter'] == pathSegments[3]))
              as Future<List<Map<String, dynamic>>?>;
        }
      case 5:
        {
          return List<Map<String, dynamic>>.from(_dataBase.where(
                  (Map<String, dynamic> element) =>
                      element['id'] == pathSegments[4]))
              as Future<List<Map<String, dynamic>>?>;
        }
      default:
        {
          return null;
        }
    }
  }

  @override
  Future<bool?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> removeRecordByPath(String collectionPath, int documentId) {
    throw UnimplementedError();
  }
}
