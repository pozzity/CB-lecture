import 'package:flutter/cupertino.dart';

/// This Model is used as a template
/// to create all models.
abstract class Model {
  /// Constructor that take in parameter [path].
  Model(this.path);

  /// * [path] represent the collection path.
  final String path;

  /// Transform map to data we will use.
  @mustCallSuper
  Map<String, dynamic> fromMap(Map<String, dynamic> map);

  /// Transform received data to map.
  @mustCallSuper
  Map<String, dynamic> toMap();


}
