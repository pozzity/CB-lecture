import 'package:flutter/material.dart';

/// This Model is used as a template
/// to create all models.
abstract class Model {
  /// Transform map to data we will use.
  @mustCallSuper
  Model.fromMap(this.path, Map<String, dynamic> _);

  /// * [path] represent the collection path.
  final String path;

  /// Transform received data to map.
  @mustCallSuper
  Map<String, dynamic> toMap();


}
