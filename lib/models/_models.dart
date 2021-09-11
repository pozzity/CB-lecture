import 'package:flutter/cupertino.dart';

/// This Model is used as a template
/// to create all models.
abstract class Model {

  /// * [path] represent the collection path.
  late final String path;

  /// Transform map to data we will use.
  @mustCallSuper
  Map<String, dynamic> fromMap();

  /// Transform received data to map.
  @mustCallSuper
  Map<String, dynamic> toMap();


}
