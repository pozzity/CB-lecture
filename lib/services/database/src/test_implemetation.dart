import '../database.dart';

/// implementation class for fake database 
class TestImplementation implements Database {
  final Map<String, Map<String, dynamic>> _dataBase = 
  <String, Map<String, dynamic>>{
    "evenements": {
      "xxx-1": {
        "nom": "Salutation",
        "nom": "Salutation",
        "nom": "Salutation",
        "nom": "Salutation"
      },
      "xxx-2": {
        "nom": "Salutation",
        "nom": "Salutation",
        "nom": "Salutation",
        "nom": "Salutation"
      }
    }
  };

  @override
  Map<String, dynamic> getCollection(String collectionPath) {
    throw UnimplementedError();
  }

  @override
  Future<String?> createRecord(String collectionPath, Map<String, dynamic> recordMap) {
    // TODO: implement createRecord
    throw UnimplementedError();
  }

  @override
  Future<void> initBD(String nameDatabase) {
    // TODO: implement initBD
    throw UnimplementedError();
  }

  @override
  Future<void> removeRecordsByPath(String collectionPath, List<String> documentsIds) {
    // TODO: implement removeRecordsByPath
    throw UnimplementedError();
  }
}
