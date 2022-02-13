import '_models.dart';

/// Class which represente verse Model.
class VersesTable extends Model {
  /// Function used for tranform Json to data.
  @override
  VersesTable.fromJson(String path, Map<String, dynamic> json)
      : id = json[keyMapId],
        textFr = json[keyMapTextFr],
        translation = json[keyMapTranslation],
        textEn = json[keyMapTextEn],
        num = json[keyMapVerseNum],
        chapter = json[keyMapChapter],
        book = json[keyMapBook],
        favorite = json[keyMapFavorite],
        super.fromJson(path, json);

  /// Represents [path] for the json conversion.
  static const String keyMapPath = 'path';

  /// Represents [translation] for the json conversion.
  static const String keyMapTranslation = 'translation';

  /// Represents [textFr] for the json conversion.
  static const String keyMapTextFr = 'textFr';

  /// Represents [textEn] for the json conversion.
  static const String keyMapTextEn = 'textEn';

  /// Represents [id] for the json conversion.
  static const String keyMapId = 'id';

  /// Represents [num] for the json conversion.
  static const String keyMapVerseNum = 'verseNum';

  /// Represents [chapter] for the json conversion.
  static const String keyMapChapter = 'chapter';

  /// Represents [book] for the json conversion.
  static const String keyMapBook = 'book';

  /// Represents [favorite] for the json conversion.
  static const String keyMapFavorite = 'favorite';

  /// Text of the verse french version.
  final String textFr;

  /// Text of the verse english version.
  final String textEn;

  /// Collection id.
  final int id;

  /// Verse number.
  final int num;

  /// Chapter name.
  final int chapter;

  /// Book name.
  final String book;

  /// Translation name.
  final String translation;

  /// Status favorite of verse.
  bool favorite;

  /// Function used for tranform received data to Json.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        keyMapId: id,
        keyMapTextFr: textFr,
        keyMapTextEn: textEn,
        keyMapVerseNum: num,
        keyMapBook: book,
        keyMapChapter: chapter,
        keyMapPath: path,
        keyMapTranslation: translation,
        keyMapFavorite: favorite
      };
}
