part of database;

/// Implementation class for fake database
class _FakeSqliteImplementation implements Database {
  final List<Map<String, dynamic>> _dataBase = <Map<String, dynamic>>[
    <String, dynamic>{
      'path': 'verse',
      'list': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 1,
          'translation': 'tra1',
          'verseNum' : 1,
          'path' : 'verse',
          'book': 'jean',
          'chapter': '1',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 2,
          'translation': 'tra1',
          'verseNum' : 1,
          'book': 'jean',
          'chapter': '1',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 3,
          'translation': 'tra2',
          'verseNum' : 2,
          'path' : 'verse',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 4,
          'translation': 'tra2',
          'verseNum' : 3,
          'path' : 'verse',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 5,
          'translation': 'tra3',
          'verseNum' : 5,
          'path' : 'verse',
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
      ]
    },
    <String, dynamic>{
      'path': 'chant',
      'list': <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 1,
          'translation': 'tra1',
          'verseNum' : 1,
          'path' : 'chant',
          'book': 'jean',
          'chapter': '1',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 2,
          'translation': 'tra1',
          'verseNum' : 2,
          'path' : 'chant',
          'book': 'jean',
          'chapter': '1',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 3,
          'translation': 'tra2',
          'verseNum' : 3,
          'path' : 'chant',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 4,
          'translation': 'tra2',
          'verseNum' : 4,
          'path' : 'chant',
          'book': 'luc',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
        <String, dynamic>{
          'id': 5,
          'translation': 'tra3',
          'verseNum' : 5,
          'path' : 'chant',
          'book': 'timote',
          'chapter': '2',
          'text': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'favorite': false, 
        },
      ]
    }
  ];

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath,
      {List<DatabaseQuery>? filters = const <DatabaseQuery> []}) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['path'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return null;
    }
    return getElementByfilter(data['list'], filters: filters);
  }

  @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['path'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
    if (!recordMap.containsKey('translation') ||
        !recordMap.containsKey('book') ||
        !recordMap.containsKey('path') ||
        !recordMap.containsKey('favorite') ||
        !recordMap.containsKey('chapter') ||
        !recordMap.containsKey('text')) {
      return false;
    }
    recordMap['favorite'] = false;
    data['list'].add(recordMap);
    return true;
  }

  @override
  Future<bool> removeRecordByPath(String collectionPath, int documentId) async {
    final Map<String, dynamic> data = _dataBase.firstWhere(
        (Map<String, dynamic> element) => element['path'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
     bool controlId = false;
    for (int i = 0; i < data['list'].length; i++) {
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
        (Map<String, dynamic> element) => element['path'] == collectionPath,
        orElse: () => <String, dynamic>{});
    if (data == <String, dynamic>{}) {
      return false;
    }
    final List<Map<String, dynamic>> retrievers = 
      getElementByfilter(data['list'], filters: filters);
    if (!updateMap.containsKey('translation') ||
        !updateMap.containsKey('book') ||
        !updateMap.containsKey('verseNum') ||
        !updateMap.containsKey('path') ||
        !updateMap.containsKey('favorite') ||
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

  /// Function used for filter list by databaseQuery.
  List<Map<String, dynamic>> getElementByfilter(
    List<Map<String, dynamic>> startList, 
    {List<DatabaseQuery>? filters = const <DatabaseQuery> []}){
      List<Map<String, dynamic>> retrievers = startList;
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
}
