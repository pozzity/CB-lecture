part of database;

/// Implementation class for fake database
class _FakeSqliteImplementation implements Database {
  final List<Map<String, dynamic>> _dataBase = <Map<String, dynamic>>[
    <String, dynamic>{
      'table': 'verse',
      'list': <Map<String, dynamic>>[
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
          'traductionId': 'tra2',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
        <String, dynamic>{
          'id': 4,
          'traductionId': 'tra2',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
        <String, dynamic>{
          'id': 5,
          'traductionId': 'tra3',
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
      ]
    },
    <String, dynamic>{
      'table': 'chant',
      'list': <Map<String, dynamic>>[
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
          'traductionId': 'tra2',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
        <String, dynamic>{
          'id': 4,
          'traductionId': 'tra2',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
        <String, dynamic>{
          'id': 5,
          'traductionId': 'tra3',
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
        },
      ]
    }
  ];

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<DatabaseQuery>? filters}) async {
    List<Map<String, dynamic>> retrievers = _dataBase.firstWhere(
        (Map<String, dynamic> element) =>
            element['table'] == collectionPath)['list'];
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
                  element[filter.key] == !filter.value));
          break;
      }
    }
    return retrievers;
  }

  @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async{
    _dataBase
        .firstWhere((Map<String, dynamic> element) =>
            element['table'] == collectionPath)['list']
        .add(recordMap);
    return true;
  }

  @override
  Future<bool> removeRecordByPath(String collectionPath, int documentId) async {
    _dataBase
        .firstWhere((Map<String, dynamic> element) =>
            element['table'] == collectionPath)['list']
        .removeWhere(
            (Map<String, dynamic> element) => element['id'] == documentId);
      return true;
  }


}
