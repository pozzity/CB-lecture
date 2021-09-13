part of database_helper;


/// A class query for record info related data.
class SQLiteQuery {
  /// Constructs the query field class.
  SQLiteQuery(this.key, this.value, this.condition);

  /// The value of the field name.
  final String key;

  /// The value of the field parameter.
  final dynamic value;

  /// Database querying condition to be applied on the
  /// value of the field parameter.
  final SQLiteFieldCondition condition;

}


/// A document field specification for querying.
enum SQLiteFieldCondition {
  /// Condition that will be used to check if
  /// field value matches the database value.
  isEqualTo,

  /// Condition that will be used to check if
  /// field value is greater than the database value.
  isGreaterThan,

  /// Condition that will be used to check if
  /// field value is greater than or equals to the database value.
  isGreaterThanOrEqualTo,

  /// Condition that will be used to check if
  /// field value is less than the database value.
  isLessThan,

  /// Condition that will be used to check if
  /// field value is less than or equals to the database value.
  isLessThanOrEqualTo,

  /// Condition that will be used to check if
  /// field value is not equals to the database value.
  isNotEqualTo
}