import '_models.dart';

/// Class which represente verse Model.
class VersesTable extends Model {
  /// Function used for tranform Json to data.
  @override
  VersesTable.fromJson(String path, Map<String, dynamic> json)
      : id = json[keyMapId],
        text = json[keyMapText],
        translateName = json[keyMapTranslate],
        num = json[keyMapVerseNum],
        chapter = json[keyMapChapter],
        book = json[keyMapBook],
        favorite = json[keyMapFavorite],
        super.fromJson(path, json);

  /// Represents [path] for the json conversion.
  static const String keyMapPath = 'path';

  ///  Represents [translateName] for the json conversion.
  static const String keyMapTranslate = 'translation';

  /// Represent [text] for the json conversion.
  static const String keyMapText = 'text';

  /// Represent [id] for the json conversion.
  static const String keyMapId = 'id';

  /// Represent [num] for the json conversion.
  static const String keyMapVerseNum = 'verseNum';

  /// Represent [chapter] for the json conversion
  static const String keyMapChapter = 'chapter';

  /// Represent [book] for the json conversion
  static const String keyMapBook = 'book';

  /// Represent [favorite] for the json conversion
  static const String keyMapFavorite = 'favorite';

  /// Translate name.
  final String translateName;

  /// Text of verse.
  final String text;

  /// Collection id.
  final int id;

  /// Verse number.
  final int num;

  /// Chapter name.
  final int chapter;

  /// Book name.
  final String book;

  /// Status favorite of verse.
  bool favorite;

  /// Function used for tranform received data to Json.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        keyMapId: id,
        keyMapText: text,
        keyMapVerseNum: num,
        keyMapBook: book,
        keyMapChapter: chapter,
        keyMapTranslate: translateName,
        keyMapPath: path,
        keyMapFavorite: favorite
      };
}
