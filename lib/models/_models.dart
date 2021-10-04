
/// This Model is used as a template
/// to create all models.
abstract class Model {

  /// Transform Json to data we will use.
  Model.fromJson(this.path, Map<String, dynamic> _);

  /// * [path] represent the collection path.
  final String path;

  /// Transform received data to Json.
  Map<String, dynamic> toJson();


}
