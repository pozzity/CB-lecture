import 'package:flutter/cupertino.dart';

abstract class Model {
  int id;
  String get tableName;

  @mustCallSuper
  Map<String, dynamic> asMap();

  @mustCallSuper
  Map<String, ColumnExtra> mapType();

  String createStringQuery() {
    final mt = mapType();
    final result = [];
    mt.forEach((columnName, extra) {
      final str =
          "$columnName${extra.type == int ? ' INTEGER' : extra.type == double ? ' REAL' : ' TEXT'}${extra.isPrimary == true ? ' PRIMARY KEY' : ''}${extra.isNullable == false ? ' NOT NULL' : ''}${extra.defaultValue != null ? ' DEFAULT ${extra.defaultValue}' : ''}";
      result.add(str);
    });
    return "CREATE TABLE $tableName(${result.join(", ")})";
  }
}

class ColumnExtra {
  final bool isNullable;
  final bool isPrimary;
  final String defaultValue;
  final Type type;

  ColumnExtra({this.isNullable, this.isPrimary, this.defaultValue,@required this.type})
      : assert(type == int || type == String || type == double, "seul les types `String`, `double` et `int` sont acceptes");
}
