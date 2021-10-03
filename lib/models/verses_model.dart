import '_models.dart';

/// Verses Model.
class VersesTable extends Model {
  /// Tranform map to data.
  @override
  VersesTable.fromMap(String path, Map<String, dynamic> map)
      : id = map[idCollection],
        text = map[textContain],
        translateName = map[translate],
        num = map[verseNum],
        chapitre = map[verseChapter],
        livre = map[verseBook],
        super.fromMap(path, map);

  /// Represent [path] for the map conversion.
  static const String collectionPath = 'path';

  ///  Represent [translateName] for the map conversion.
  static const String translate = 'translation';

  /// Represent [text] for the map conversion.
  static const String textContain = 'text';

  /// Represent [id] for the map conversion.
  static const String idCollection = 'id';

  /// Represent [num] for the map conversion.
  static const String verseNum = 'verseNum';

  /// Represent [chapitre] for the map conversion
  static const String verseChapter = 'chapitre';

  /// Represent [livre] for the map conversion
  static const String verseBook = 'livre';

  /// Translate name.
  final String translateName;

  /// Text of verse.
  final String text;

  /// Collection id.
  final int id;

  /// Verse number.
  final int num;

  /// Chapter name.
  final int chapitre;

  /// Book name.
  final String livre;

  /// Transform received data to Map.
  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        idCollection: id,
        textContain: text,
        verseNum: num,
        verseBook: livre,
        verseChapter: chapitre,
        translate: translateName,
        collectionPath: path
      };
}
