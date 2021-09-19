part of database;

/// Implementation class for Column of Table Sqlite database.
class Column {
  /// Construct a new [Column] instance.
  const Column
    ({required String key, required TypeColumn type, bool primaryKey = false}):
      _key = key,
      _type = type,
      _primaryKey = primaryKey;

  /// Reference name of [Column].
  final String _key;

  /// Reference type of [Column].
  final TypeColumn _type;

  /// Tell if [Column] is primary Key. 
  final bool _primaryKey;

  ///Function which converts us [Column] into character string
  ///for the creation of a table in our database.
  String onString() {
    final String type = (_type == TypeColumn.text) ? 'TEXT' : 'INTEGER';
    final String primaryKey = (_primaryKey == true) ? 'PRIMARY KEY' : '';

    return '$_key $type $primaryKey, ';
  }
}

/// List the different types that a column can take.
enum TypeColumn {
  /// Value to indicate that it is a column of type text in our database.
  text,

  /// Value to indicate that it is a column of type number in our database.
  integer
}
