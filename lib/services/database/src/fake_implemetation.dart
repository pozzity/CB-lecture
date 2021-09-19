part of database;

/// Implementation class for fake database
class _FakeImplementation implements Database {
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
      {List<DatabaseQuery>? filters}) async {
    final List<String> pathSegments = collectionPath.split('/');
    List<Map<String, dynamic>> retrievers = _dataBase;
    for (final DatabaseQuery filter in filters!) {
      switch (filter.condition) {
        case DatabaseFieldCondition.isEqualTo:
          retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] == filter.value));
          break;
        case DatabaseFieldCondition.isGreaterThan:
        retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] > filter.value));
          break;
        case DatabaseFieldCondition.isGreaterThanOrEqualTo:
          retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] >= filter.value));
          break;
        case DatabaseFieldCondition.isLessThan:
          retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] < filter.value));
          break;
        case DatabaseFieldCondition.isLessThanOrEqualTo:
          retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] <= filter.value));
          break;
        case DatabaseFieldCondition.isNotEqualTo:
          retrievers = List<Map<String, dynamic>>.from(retrievers.where(
                  (Map<String, dynamic> element) =>
                      element[filter.key] ==! filter.value));
          break;
      }
    }
    return retrievers as Future<List<Map<String, dynamic>>?>;
  }

  @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeRecordByPath(String collectionPath, int documentId) {
    throw UnimplementedError();
  }
}
