
import '_models.dart';

class VersesTable extends Model {
  
  VersesTable(String path) : super(path);
  
  // ignore: public_member_api_docs
  // VersesTable(String path) : super(path);

  /// represent the name of the table
  static const String collectionPath = 'path'; 

  /// nom de la transcription
  String translateName = '';
  static const String translate = "translation";

  /// text representant le verse
  String text = '';
  static const String textContain = "text";

  /// id de l'enregistrement
  int id = 0;
  static const String idCollection = "id";

  /// numero du verses
  int num = 0;
  static const String verseNum = "verseNum";

  /// represente le numero du
  int chapitre = 0;
  static const String verseChapter = "chapitre";

  /// represente un json de donnee encoder en chaine 
  /// de caracteres qui contiendra
  /// tout type de donnee ajoutee plus tard
  String livre = '';
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
    // ignore: unnecessary_null_comparison
    assert(text != null || livre != null || chapitre != null || num != null);
    // ignore: always_specify_types
    final Map<String, dynamic> res = {
      textContain: text,
      verseNum: num,
      verseBook: livre,
      verseChapter: chapitre,
      translate: translateName,
      collectionPath: path
    };
    // ignore: unnecessary_null_comparison
    if (id != null) {
      res[idCollection] = id;
    }
    return res;
  }

}