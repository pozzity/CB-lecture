import 'package:calendrierbiblic/models/_model.dart';

class Events extends EventsTable {
  static const ID = "events";
  DateTime debut;
  DateTime fin;

  Events.fromMap(Map<String, dynamic> map) : super._fromMap(map) {
    debut = DateTime.fromMillisecondsSinceEpoch(beginSinceApproch * Duration(seconds: 1).inMilliseconds);
    debut = DateTime.fromMillisecondsSinceEpoch(endSinceApproch * Duration(seconds: 1).inMilliseconds);
  }

  Events.empty():super._empty();

  @override
  String get tableName => ID;

}

abstract class EventsTable extends Model {
  /// contient une description complete de l'evenement
  final String details;
  static const String COLUMNS_details = "details";

  /// contient une description complete de l'evenement
  final String description;
  static const String COLUMNS_description = "description";

  /// id du Events
  final int id;
  static const String COLUMNS_id = "id";

  /// represente la date de debut d'un evenement en secondes
  final int beginSinceApproch;
  static const String COLUMNS_dateDebut = "dateDebut";

  /// represente la date de fin d'un evenement en secondes
  final int endSinceApproch;
  static const String COLUMNS_dateFin = "dateFin";

  EventsTable._empty([this.details, this.description, this.id, this.beginSinceApproch, this.endSinceApproch]);

  EventsTable._fromMap(Map<String, dynamic> map)
      : id = map[COLUMNS_id],
        details = map[COLUMNS_details],
        beginSinceApproch = map[COLUMNS_dateDebut],
        endSinceApproch = map[COLUMNS_dateFin],
        description = map[COLUMNS_description] {
    assert(details != null || description != null || beginSinceApproch != null || endSinceApproch != null);
  }

  @override
  Map<String, dynamic> asMap() {
    assert(details != null || description != null || beginSinceApproch != null || endSinceApproch != null);
    final res = {
      COLUMNS_details: details,
      COLUMNS_description: description,
      COLUMNS_dateDebut: beginSinceApproch,
      COLUMNS_dateFin: endSinceApproch,
    };
    if (id != null) res[COLUMNS_id] = id;
    return res;
  }

  @override
  Map<String, ColumnExtra> mapType() {
    return {
      COLUMNS_id: ColumnExtra(type: int, isPrimary: true),
      COLUMNS_details: ColumnExtra(type: String, isNullable: false),
      COLUMNS_description: ColumnExtra(type: String, isNullable: false),
      COLUMNS_dateDebut: ColumnExtra(type: int, isNullable: false),
      COLUMNS_dateFin: ColumnExtra(type: int, isNullable: false),
    };
  }
}
