import 'package:flutter/cupertino.dart';

/// This is  a class which help us to create all models
/// which are a representation of data as 
/// in database that will we use in our app
abstract class Model {
  /// * [id] represent the id of a table
  int? id;

  /// * [tableName] represent the name of the table
  String get tableName;

  @mustCallSuper
  Map<String, dynamic> asMap();

  @mustCallSuper
  Map<String, ColumnExtra> mapType();

  ///This function allow us to create SQL request 
  /// without enter all the syntax
  String createStringQuery() {
    final Map<String, ColumnExtra> mt = mapType();
    final List result = [];
    mt.forEach((String columnName, ColumnExtra extra) {
      final String str =
          "$columnName${extra.type == int ? ' INTEGER' : extra.type == double ? 
          ' REAL' : ' TEXT'}${extra.isPrimary == true ? ' PRIMARY KEY' : 
          ''}${extra.isNullable == false ? ' NOT NULL' : 
          ''}${extra.defaultValue != null ? 
          ' DEFAULT ${extra.defaultValue}' : ''};";
      result.add(str);
    });
    return "CREATE TABLE $tableName(${result.join(", ")})";
  }
}

/// This class allows us to create a column in database
/// with his differents constraints.
class ColumnExtra {

  /// Contructor
  ColumnExtra(
    { required this.type, this.isNullable, this.isPrimary, this.defaultValue})
      : assert(type == int || type == String || type == double, 
      "seul les types `String`, `double` et `int` sont acceptes");

  /// * [isNullable] let us know if a Column can be null or not
  final bool? isNullable;

  /// * [isPrimary] let us know if a Column can be a primary key
  final bool? isPrimary;

  /// * [defaultValue] initiate the value of column if is necessary
  final String? defaultValue;
  
  /// * [type] give the specific type to Column 
  /// like String, int, double, bool, etc...
  final Type type;

}
