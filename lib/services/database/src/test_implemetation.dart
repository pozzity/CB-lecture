import '../database.dart';

/// implementation class for fake database
class TestImplementation implements Database {
  final Map<String, Map<String, dynamic>> _dataBase =
      <String, Map<String, dynamic>>{
    'book': <String, dynamic>{
      'jean': <String, dynamic>{
        'chapter': <String, dynamic>{
          'verse': <String, dynamic>{
            'text' : 'text'
          }
        }
      },
      'xxx-2': <String, dynamic>{
        'nom': 'Salutation',
        'nom': 'Salutation',
        'nom': 'Salutation',
        'nom': 'Salutation'
      }
    }
  };

  @override
  Future<int?> createRecord(
      String collectionPath, Map<String, dynamic> recordMap) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>?> getCollection(String collectionPath) {
    throw UnimplementedError();
  }

  @override
  Future<int?> removeRecordByPath(String collectionPath, int documentsId) {
    throw UnimplementedError();
  }
}
