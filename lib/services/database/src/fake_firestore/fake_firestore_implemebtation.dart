part of database;

/// Implementation class for fake database firestore.
class _FakeFireStoreImplementation implements Database {
  final Map<dynamic, Map<dynamic, dynamic>> _dataBase =
      <dynamic, Map<dynamic, dynamic>>{
    'translation': <dynamic, dynamic>{
      'translation_id': <dynamic, dynamic>{
        'translation': 'Jean luc',
        'verses': <Map<dynamic, dynamic>>[
          <String, dynamic>{
            'id': 1,
            'verseNum': 1,
            'path': 'verse',
            'book': 'jean',
            'chapter': '1',
          'textFr': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'textEn': 'Jean said this is why the Lord sent me',
            'favorite': false,
          },
          <String, dynamic>{
            'id': 2,
            'verseNum': 1,
            'book': 'jean',
            'chapter': '1',
          'textFr': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'textEn': 'Jean said this is why the Lord sent me',
            'favorite': false,
          },
          <String, dynamic>{
            'id': 3,
            'verseNum': 2,
            'path': 'verse',
            'book': 'luc',
            'chapter': '2',
          'textFr': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'textEn': 'Jean said this is why the Lord sent me',
            'favorite': false,
          },
          <String, dynamic>{
            'id': 4,
            'verseNum': 3,
            'path': 'verse',
            'book': 'luc',
            'chapter': '2',
          'textFr': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'textEn': 'Jean said this is why the Lord sent me',
            'favorite': false,
          },
          <String, dynamic>{
            'id': 5,
            'verseNum': 5,
            'path': 'verse',
            'book': 'timote',
            'chapter': '2',
          'textFr': 'jean a dit voici ce pourquoi le Seigneur ma envoyer ',
          'textEn': 'Jean said this is why the Lord sent me',
            'favorite': false,
          },
        ]
      },
    },
  };

  @override
  Map<String, Map<dynamic, dynamic>> getCollection(String collectionPath,
      {List<DatabaseQuery>? filters = const <DatabaseQuery>[]}) async {
        final Map<String, Map<dynamic, dynamic>> list =
        <String, Map<dynamic, dynamic>>{};
    final Map<dynamic, dynamic>? col = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);

    col?.forEach((k, val) {
      final Map map = val;
      for (final docQuery in filters!) {
        final DatabaseFieldCondition condition = docQuery.condition;
        if ((condition == DatabaseFieldCondition.isEqualTo &&
                map[docQuery.key] != docQuery.value) ||
            (condition == DatabaseFieldCondition.isGreaterThan &&
                map[docQuery.key] <= docQuery.value) ||
            (condition == DatabaseFieldCondition.isGreaterThanOrEqualTo &&
                map[docQuery.key] < docQuery.value) ||
            (condition == DatabaseFieldCondition.isLessThan &&
                map[docQuery.key] >= docQuery.value) ||
            (condition == DatabaseFieldCondition.isLessThanOrEqualTo &&
                map[docQuery.key] > docQuery.value) ||
            (condition == DatabaseFieldCondition.isNotEqualTo &&
                map[docQuery.key] == docQuery.value)) {
          return;
        }
      }

      list[k] = val;
    });

    return list;
  }

  @override
  Future<bool> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    final Map<dynamic, dynamic>? collection = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (Map? previousValue, String element) =>
            previousValue is Map ? previousValue[element] : null);

    final recordId = (collection?.length ?? 0) + 1;
    final documentId = 'id_$recordId';
    collection?.putIfAbsent(documentId, () => recordMap);
    return true;
  }

  @override
  Future<bool> removeRecordByPath(String collectionPath, int documentId) async {
     final collection = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (Map? previousValue, String element) =>
            previousValue is Map ? previousValue[element] : null);
    if (collection == null) {
      log('>> Method removeRecordsById << '
          'Your collection <$collectionPath> is empty or do not exist');
      return false;
    }
      collection.remove(documentId.toString());
    
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
      {List<DatabaseQuery>? filters = const <DatabaseQuery>[]}) {
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

  @override
  Future<void> close() {
    throw UnimplementedError();
  }
}
