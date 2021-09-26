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
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['table'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return null;
    }
    List<Map<String, dynamic>> retrievers = data['list'];
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
      String collectionPath, Map<String, dynamic> recordMap) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['table'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
    if (!recordMap.containsKey('traductionId') ||
        !recordMap.containsKey('book') ||
        !recordMap.containsKey('chapter') ||
        !recordMap.containsKey('text')) {
      return false;
    }
    data['list'].add(recordMap);
    return true;
  }

  @override
  Future<bool> removeRecordByPath(String collectionPath, int documentId) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['table'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
    bool controlId = false;
    for (int i = 1; i < data['list'].length; i++) {
      if (data['list'][i]['id'] == documentId) {
        controlId = true;
      }
    }
    if (!controlId) {
       return false;
    }
    data['list'].removeWhere(
        (Map<String, dynamic> element) => element['id'] == documentId);
    return true;
  }

  @override
  Future<bool> updateRecordByPath(
      String collectionPath, Map<String, dynamic> updateMap,
      {List<DatabaseQuery>? filters = const <DatabaseQuery>[]}) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['table'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
    List<Map<String, dynamic>> retrievers = data['list'];
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
    if (!updateMap.containsKey('traductionId') ||
        !updateMap.containsKey('book') ||
        !updateMap.containsKey('chapter') ||
        !updateMap.containsKey('id') ||
        !updateMap.containsKey('text')) {
      return false;
    }
    if (retrievers.isEmpty) {
      return false;
    } else {
      for (final Map<String, dynamic> element in retrievers) {
        element
          ..clear()
          ..addAll(updateMap);
      }
      return true;
    }
  }
}
