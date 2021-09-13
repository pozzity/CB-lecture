part of database_helper;

/// Implementation class for Table Sqlite database.
class Table {
  /// Construct a new [Table] instance.
  const Table({required String key, required List<Column> columns})
      : _key = key,
        _columns = columns;

  /// Reference name of [Table].
  final String _key;

  /// Reference type of [Table].
  final List<Column> _columns;

  ///Function which converts us [Table] into character string
  ///for the creation of a table in our database.
  String onString() {
    final StringBuffer column = StringBuffer();
    for (final Column element in _columns) {
      column.write(element.onString());
    }
    return 'CREATE TABLE $_key(${column.toString()}), ';
  }
}
