// ignore_for_file: always_specify_types, prefer_foreach

part of database;

/// Implementation class for fake database firestore.
class _FakeFireStoreImplementation implements DatabaseExternal {
  final Logger _log = Logger('_FakeFireStoreImplementation');
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
  Future<String?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) async {
    
    final Map? collection = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);

    final int recordId = (collection?.length ?? 0) + 1;
    final String documentId = 'id_$recordId';
    collection?.putIfAbsent(documentId, () => recordMap);
    return documentId;
  }

  @override
  Future<void> removeRecordsByPath(
      String collectionPath, List<String> documentsIds) async {
    final collection = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);
    if (collection == null) {
      _log.warning('>> Method removeRecordsById << '
          'Your collection <$collectionPath> is empty or do not exist');
      return;
    }
    for (final documentId in documentsIds) {
      collection.remove(documentId);
    }
  }

  @override
  Future<void> removeRecordByValue(
      String collectionPath, List<DatabaseQuery> docQueries) async {
    final Set<String> keysToRemove = {};
    int counter = 0;
    final Map? collection = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);
    if (collection == null) {
      _log.warning('>> Method removeRecordByValue << '
          'Your collection <$collectionPath> is empty or do not exist');
      return;
    }
    collection.forEach((key, map) {
      map as Map;
      for (final DatabaseQuery docQuery in docQueries) {
        switch (docQuery.condition) {
          case DatabaseFieldCondition.isEqualTo:
            if (map[docQuery.key] == docQuery.value) {
              counter++;
            }
            break;
          case DatabaseFieldCondition.isGreaterThan:
            {
              if (map[docQuery.key] > docQuery.value) {
                counter++;
              }
            }
            break;
          case DatabaseFieldCondition.isGreaterThanOrEqualTo:
            {
              if (map[docQuery.key] >= docQuery.value) {
                counter++;
              }
            }
            break;
          case DatabaseFieldCondition.isLessThan:
            {
              if (map[docQuery.key] < docQuery.value) {
                counter++;
              }
            }
            break;
          case DatabaseFieldCondition.isLessThanOrEqualTo:
            {
              if (map[docQuery.key] <= docQuery.value) {
                counter++;
              }
            }
            break;
          case DatabaseFieldCondition.isNotEqualTo:
            {
              if (map[docQuery.key] != docQuery.value) {
                counter++;
              }
            }
            break;
        }
      }
      // If counter count matches the length of docQueries then
      // there is a match.
      if (counter == docQueries.length) {
        keysToRemove.add(key);
      }
      // Reset counter for next key match.
      counter = 0;
    });

    for (final String keys in keysToRemove) {
      collection.remove(keys);
    }
  }

  @override
  Future<Map<String, Map<dynamic, dynamic>>?> getCollection(
      String collectionPath,
      {List<DatabaseQuery> filters = const []}) async {
    final Map<String, Map<dynamic, dynamic>> list =
        <String, Map<dynamic, dynamic>>{};
    final Map<dynamic, dynamic>? col = collectionPath.split('/').fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);

    col?.forEach((k, val) {
      final Map map = val;
      for (final DatabaseQuery docQuery in filters) {
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
  Future<Map<dynamic, dynamic>?> getRecordByDocumentPath(String path) async {
    final List<String> keys = path.split('/')
      ..removeWhere((element) => element.isEmpty);

    if (keys.length < 2 || keys.length % 2 != 0) {
      _log.warning(' Invalid path `$path`');
      return null;
    }
    final Map<dynamic, dynamic>? document = keys.fold<Map?>(
        _dataBase,
        (previousValue, element) =>
            previousValue is Map ? previousValue[element] : null);
    return document;
  }

  @override
  Future<bool> setRecord(
      String documentPath, Map<String, dynamic> recordMap) async {
    final pathSegments = documentPath.split('/')
      ..removeWhere((element) => element.isEmpty);

    if (pathSegments.length % 2 != 0) {
      _log.severe('Invalid path to record `$documentPath`');
      return false;
    }
    pathSegments.fold<Map>(
        _dataBase, (previousValue, element) => previousValue[element] ??= {})
      ..clear()
      ..addAll(recordMap);
    return true;
  }
}
