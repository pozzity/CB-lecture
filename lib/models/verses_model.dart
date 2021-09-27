
import '_models.dart';

/// Verses Model.
class VersesTable extends Model {
  
  /// Constructor that inherite property [path] of his parent.
  VersesTable(String path) : super(path);

  /// Represent [path] for the map conversion.
  static const String collectionPath = 'path'; 

  /// Translate name.
  String translateName = '';

  ///  Represent [translateName] for the map conversion.
  static const String translate = 'translation';

  /// Text of verses.
  String? text = '';

  /// Represent [text] for the map conversion.
  static const String textContain = 'text';

  /// Collection id.
  int? id = 0;

  /// Represent [id] for the map conversion.
  static const String idCollection = 'id';

  /// Verse number.
  int? num = 0;

  /// Represent [num] for the map conversion.
  static const String verseNum = 'verseNum';

  /// Chapter name.
  int? chapitre = 0;

  /// Represent [chapitre] for the map conversion
  static const String verseChapter = 'chapitre';

  /// Book name.
  String? livre = '';

  /// Represent [livre] for the map conversion
  static const String verseBook = 'livre';


  @override
  Map<String, dynamic> fromMap(Map<String, dynamic> map) {
    
        id = map[idCollection];
        text = map[textContain];
        translateName = map[translate];
        num = map[verseNum];
        chapitre = map[verseChapter];
        livre = map[verseBook];
    
    throw UnimplementedError();
  }
      

  @override
  Map<String, dynamic> toMap() {
    assert(text != null  || livre != null 
      || chapitre != null || num != null, 'parameters are not null');
    
    final Map<String, dynamic> res = <String, dynamic>{
      textContain: text,
      verseNum: num,
      verseBook: livre,
      verseChapter: chapitre,
      translate: translateName,
      collectionPath: path
    };
    
    if (id != null) {
      res[idCollection] = id;
    }
    return res;
  }

}