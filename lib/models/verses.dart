import 'dart:convert' as cv;

import 'package:calendrierbiblic/models/_model.dart';
import 'package:flutter/cupertino.dart';

// todo: add le numero du verse
class Verses extends VersesTable {
  static const ID = "verses";

  bool isFavorite;

  /// json representation de nouvell donne non cite
  Map otherData;

  Verses.fromMap(Map<String, dynamic> map) : super._fromMap(map) {
    _nexInit();
  }

  Verses(
      {@required String translateName,
      @required String translateId,
      @required String livre,
      @required int chapitre,
      @required int num,
      @required String text,
      int id,
      int favorite,
      int vueCount,
      String other})
      : super._(
            translateName: translateName,
            translateId: translateId,
            livre: livre,
            chapitre: chapitre,
            num: num,
            text: text,
            id: id,
            favorite: favorite ?? 0,
            vueCount: vueCount ?? 0,
            other: other) {
    _nexInit();
  }

  Verses.empty() : super._empty();

  void _nexInit() {
    isFavorite = favorite == 0 ? false : true;
    otherData = cv.json.decode(other ?? '{}') as Map;
  }

  @override
  String get tableName => VersesTable.name;

  static Type get table => VersesTable;

  @override
  Map<String, dynamic> asMap() {
    final map = super.asMap();
    map[VersesTable.COLUMNS_favorite] = isFavorite ? 1 : 0;
    map[VersesTable.COLUMNS_other] = cv.json.encode(otherData);
    return map;
  }
}

abstract class VersesTable extends Model {
  /// represent the name of the table
  static const name = "verses";

  /// nom de la transcription
  final String translateName;
  static const String COLUMNS_translate_name = "traduction";

  /// identifiant de la transcription
  final String translateId;
  static const String COLUMNS_translate_id = "idTraduction";

  /// text representant le verse
  final String text;
  static const String COLUMNS_text = "text";

  /// id de l'enregistrement
  final int id;
  static const String COLUMNS_id = "id";

  /// numero du verses
  final int num;
  static const String COLUMNS_num = "verseNum";

  /// verifie si le verse est dans les favoris 1 si non 0
  final int favorite;
  static const String COLUMNS_favorite = "favorite";

  /// nombre de fois que le verse a ete vue
  final int vueCount;
  static const String COLUMNS_vueCount = "nbVue";

  /// represente un json de donnee encoder en chaine de caracteres qui contiendra
  /// tout type de donnee ajoutee plus tard
  final String other;
  static const String COLUMNS_other = "other";

  /// represente le numero du
  final int chapitre;
  static const String COLUMNS_chapitre = "chapitre";

  /// represente un json de donnee encoder en chaine de caracteres qui contiendra
  /// tout type de donnee ajoutee plus tard
  final String livre;
  static const String COLUMNS_livre = "livre";

  VersesTable._fromMap(Map<String, dynamic> map)
      : id = map[COLUMNS_id],
        text = map[COLUMNS_text],
        translateId = map[COLUMNS_translate_id],
        translateName = map[COLUMNS_translate_name],
        favorite = map[COLUMNS_favorite] ?? 0,
        vueCount = map[COLUMNS_vueCount] ?? 0,
        num = map[COLUMNS_num],
        chapitre = map[COLUMNS_chapitre],
        livre = map[COLUMNS_livre],
        other = map[COLUMNS_other] {
    assert(text != null || livre != null || chapitre != null);
  }

  VersesTable._(
      {this.translateName,
      this.translateId,
      this.text,
      this.id,
      this.num,
      this.favorite,
      this.vueCount,
      this.other,
      this.chapitre,
      this.livre});

  VersesTable._empty(
      [this.translateName,
      this.translateId,
      this.text,
      this.id,
      this.favorite,
      this.vueCount,
      this.num,
      this.other,
      this.chapitre,
      this.livre]);

  @override
  Map<String, dynamic> asMap() {
    assert(text != null || livre != null || chapitre != null || num != null);
    final res = {
      COLUMNS_text: text,
      COLUMNS_favorite: favorite,
      COLUMNS_vueCount: vueCount,
      COLUMNS_num: num,
      COLUMNS_other: other,
      COLUMNS_livre: livre,
      COLUMNS_chapitre: chapitre,
      COLUMNS_translate_name: translateName,
      COLUMNS_translate_id: translateId
    };
    if (id != null) res[COLUMNS_id] = id;
    return res;
  }

  @override
  Map<String, ColumnExtra> mapType() {
    return {
      COLUMNS_id: ColumnExtra(type: int, isPrimary: true),
      COLUMNS_text: ColumnExtra(type: String, isNullable: false),
      COLUMNS_translate_id: ColumnExtra(type: String, isNullable: false),
      COLUMNS_translate_name: ColumnExtra(type: String, isNullable: false),
      COLUMNS_livre: ColumnExtra(type: String, isNullable: false),
      COLUMNS_chapitre: ColumnExtra(type: int, isNullable: false),
      COLUMNS_favorite: ColumnExtra(type: int, isNullable: false, defaultValue: "0"),
      COLUMNS_vueCount: ColumnExtra(type: int, isNullable: false, defaultValue: "0"),
      COLUMNS_num: ColumnExtra(type: int, isNullable: false),
      COLUMNS_other: ColumnExtra(type: String)
    };
  }
}
