import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui show Shadow, FontFeature;

import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _CustomLog {
  final String logId;

  noSuchMethod(Invocation invocation) {
    final args = invocation.positionalArguments;
    final mk = invocation.namedArguments;
    for (final k in mk.keys) {
      String str = k.toString();
      str = str.substring(8, str.length - 2);
      print("${str.toUpperCase()} ::> ${mk[k]}");
    }
    for (final arg in args)
      print("$logId => $arg");
  }

  _CustomLog({this.logId = "#_CustomLog"});
}

/// Util class witch containt commont function
mixin fn {
  static const KEY = _Keys();
  static String currentTranslateName;
  static String currentLang = "en";

  static const String GOOGLE_LINK = "https://play.google.com/store/apps/details?id=com.pozzity.app.calendrierbiblic";

  //
  static Future<SharedPreferences> get pref async {
    return await SharedPreferences.getInstance();
  }

  /// function that print the any given parameters. that must be positional or named
  /// print positional arguments before printing named arguments
  static dynamic get log => _CustomLog();

  static _Styles get style => _Styles(color: Colors.brown);

  /// generate the font that fit the rendered area
  static double gtFontSz(int length, double surface, {double min, double max}) {
    min ??= 5;
    max ??= 100;
    double res = math.sqrt(surface / (length));
//    print(["text len $length", "width $w", "height $h", "surface a peindre $surface", "valeur retourner $res"]);
    return res.clamp(min, max);
  }

  /// transform the text in title case
  /// namedParam [forceOtherToLower] default to false
  static String titleCase(String text, {bool forceOtherToLower = false}) {
    String string = forceOtherToLower ? text : text.toLowerCase();
    final tb = string.split(".");
    return tb.map((str) {
      int id = 0;
      while (id < str.length - 1 && str[id].trim() == "") {
        id++;
      }
      return str[id].toUpperCase() + str.substring(id);
    }).join(".");
  }

  /// check if user is connected
  static Future<bool> get userIsConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {}
    return false;
  }

  static String bookNameToFr(String book) {
    book = book.trim();
    return (book == "1 Timothée") ? "1 Timothy" : (book == "Psaumes") ? "Psalms" : (book == "Genèse") ? "Genesis"
        : (book == "Exode") ? "Exodus" : (book == "Lévitique") ? "Leviticus" : (book == "Nombres") ? "Numbers"
        : (book == "Deuteronome") ? "Deuteronomy" : (book == "Josué") ? "Joshua" : (book == "Juges") ? "Judges"
        : (book == "Ruth") ? "Ruth" : (book == "1 Samuel") ? "1 Samuel" : (book == "2 Samuel") ? "2 Samuel"
        : (book == "1 Rois") ? "1 Kings" : (book == "2 Rois") ? "2 Kings" : (book == "1 Chroniques") ? "1 Chronicles"
        : (book == "2 Chroniques") ? "2 Chronicles" : (book == "Esdras") ? "Ezra" : (book == "Néthémie") ? "Nehemiah"
        : (book == "Esther") ? "Esther" : (book == "Job") ? "Job" : (book == "Proverbes") ? "Proverbs"
        : (book == "Ecclésiaste") ? "Ecclesiastes" : (book == "Cantique des Cantiques") ? "Song of Songs"
        : (book == "Esaïe") ? "Isaiah" : (book == "Jérémie") ? "Jeremiah" : (book == "Lamentations") ? "Lamentations"
        : (book == "Ezéchiel") ? "Ezekiel" : (book == "Daniel") ? "Daniel" : (book == "Osée") ? "Hosea"
        : (book == "Joël") ? "Joel" : (book == "Amos") ? "Amos" : (book == "Abdias") ? "Obadiah"
        : (book == "Jonas") ? "Jonah" : (book == "Michée") ? "Micah" : (book == "Nahum") ? "Nahum"
        : (book == "Habacuc") ? "Habakkuk" : (book == "Sophonie") ? "Zephaniah" : (book == "Aggée") ? "Haggai"
        : (book == "Zacharie") ? "Zechariah" : (book == "Malachie") ? "Malachi" : (book == "Matthieu") ? "Matthew"
        : (book == "Marc") ? "Mark" : (book == "Luc") ? "Luke" : (book == "Jean") ? "John" : (book == "Actes") ? "Acts"
        : (book == "Romains") ? "Romans" : (book == "1 Corinthiens") ? "1 Corinthians"
        : (book == "2 Corinthiens") ? "2 Corinthians" : (book == "Galates") ? "Galatians"
        : (book == "Ephésiens") ? "Ephesians" : (book == "Philippiens") ? "Philippians"
        : (book == "Colossiens") ? "Colossians" : (book == "1 Thessaloniciens") ? "1 Thessalonians"
        : (book == "2 Thessaloniciens") ? "2 Thessalonians" : (book == "2 Timothée") ? "2 Timothy"
        : (book == "Tite") ? "Titus" : (book == "Philémon") ? "Philemon" : (book == "Hébreux") ? "Hebrews"
        : (book == "Jacques") ? "James" : (book == "1 Pierre") ? "1 Peter" : (book == "2 Pierre") ? "2 Peter"
        : (book == "1 Jean") ? "1 John" : (book == "2 Jean") ? "2 John" : (book == "3 Jean") ? "3 John"
        : (book == "Jude") ? "Jude" : (book == "Apocalypse") ? "Revelation" : null;
  }

  static String bookNameOnCurrentLang(BuildContext context, String englishName) {
    switch (englishName.trim().toLowerCase()) {
      case "1 timothy":
        return S
            .of(context)
            .one_timothy;
      case "psalms":
        return S
            .of(context)
            .psalms;
      case "genesis":
        return S
            .of(context)
            .genesis;
      case "exodus":
        return S
            .of(context)
            .exodus;
      case "leviticus":
        return S
            .of(context)
            .leviticus;
      case "numbers":
        return S
            .of(context)
            .numbers;
      case "deuteronomy":
        return S
            .of(context)
            .deuteronomy;
      case "joshua":
        return S
            .of(context)
            .joshua;
      case "judges":
        return S
            .of(context)
            .judges;
      case "ruth":
        return S
            .of(context)
            .ruth;
      case "1 samuel":
        return S
            .of(context)
            .one_samuel;
      case "2 samuel":
        return S
            .of(context)
            .two_samuel;
      case "1 kings":
        return S
            .of(context)
            .one_kings;
      case "2 kings":
        return S
            .of(context)
            .two_kings;
      case "1 chronicles":
        return S
            .of(context)
            .one_chronicles;
      case "2 chronicles":
        return S
            .of(context)
            .two_chronicles;
      case "ezra":
        return S
            .of(context)
            .ezra;
      case "nehemiah":
        return S
            .of(context)
            .nehemiah;
      case "esther":
        return S
            .of(context)
            .esther;
      case "job":
        return S
            .of(context)
            .job;
      case "proverbs":
        return S
            .of(context)
            .proverbs;
      case "ecclesiastes":
        return S
            .of(context)
            .ecclesiastes;
      case "song of songs":
        return S
            .of(context)
            .song_of_songs;
      case "isaiah":
        return S
            .of(context)
            .isaiah;
      case "jeremiah":
        return S
            .of(context)
            .jeremiah;
      case "lamentations":
        return S
            .of(context)
            .lamentations;
      case "ezekiel":
        return S
            .of(context)
            .ezekiel;
      case "daniel":
        return S
            .of(context)
            .daniel;
      case "hosea":
        return S
            .of(context)
            .hosea;
      case "joel":
        return S
            .of(context)
            .joel;
      case "amos":
        return S
            .of(context)
            .amos;
      case "obadiah":
        return S
            .of(context)
            .obadiah;
      case "jonah":
        return S
            .of(context)
            .jonah;
      case "micah":
        return S
            .of(context)
            .micah;
      case "nahum":
        return S
            .of(context)
            .nahum;
      case "habakkuk":
        return S
            .of(context)
            .habakkuk;
      case "zephaniah":
        return S
            .of(context)
            .zephaniah;
      case "haggai":
        return S
            .of(context)
            .haggai;
      case "zechariah":
        return S
            .of(context)
            .zechariah;
      case "malachi":
        return S
            .of(context)
            .malachi;
      case "matthew":
        return S
            .of(context)
            .matthew;
      case "mark":
        return S
            .of(context)
            .mark;
      case "luke":
        return S
            .of(context)
            .luke;
      case "john":
        return S
            .of(context)
            .john;
      case "acts":
        return S
            .of(context)
            .acts;
      case "romans":
        return S
            .of(context)
            .romans;
      case "1 corinthians":
        return S
            .of(context)
            .one_corinthians;
      case "2 corinthians":
        return S
            .of(context)
            .two_corinthians;
      case "galatians":
        return S
            .of(context)
            .galatians;
      case "ephesians":
        return S
            .of(context)
            .ephesians;
      case "philippians":
        return S
            .of(context)
            .philippians;
      case "colossians":
        return S
            .of(context)
            .colossians;
      case "1 thessalonians":
        return S
            .of(context)
            .one_thessalonians;
      case "2 thessalonians":
        return S
            .of(context)
            .two_thessalonians;
      case "2 timothy":
        return S
            .of(context)
            .two_timothy;
      case "titus":
        return S
            .of(context)
            .titus;
      case "philemon":
        return S
            .of(context)
            .philemon;
      case "hebrews":
        return S
            .of(context)
            .hebrews;
      case "james":
        return S
            .of(context)
            .james;
      case "1 peter":
        return S
            .of(context)
            .one_peter;
      case "2 peter":
        return S
            .of(context)
            .two_peter;
      case "1 john":
        return S
            .of(context)
            .one_john;
      case "2 john":
        return S
            .of(context)
            .two_john;
      case "3 john":
        return S
            .of(context)
            .tree_john;
      case "jude":
        return S
            .of(context)
            .jude;
      case "revelation":
        return S
            .of(context)
            .revelation;
    }
    return "";
  }

}

class _Styles {
  final _CustomTextStyle tsBody;
  final _CustomTextStyle tsBody1;
  final _CustomTextStyle tsBody2;
  final _CustomTextStyle tsHeader;
  final _CustomTextStyle tsHeader1;
  final _CustomTextStyle tsHeader2;
  final _CustomTextStyle tsHeader3;

  _Styles({MaterialColor color})
      : assert(color != null),
        this.tsBody = _CustomTextStyle(fontSize: 13, color: color.shade700),
        this.tsBody1 = _CustomTextStyle(fontSize: 15, color: color.shade800),
        this.tsBody2 = _CustomTextStyle(fontSize: 17, color: color.shade900),
        this.tsHeader = _CustomTextStyle(fontSize: 19, color: color.shade700),
        this.tsHeader1 = _CustomTextStyle(fontSize: 23, color: color.shade700),
        this.tsHeader2 = _CustomTextStyle(fontSize: 30, color: color.shade900),
        this.tsHeader3 = _CustomTextStyle(fontSize: 38, color: color.shade900);
}

class _CustomTextStyle extends TextStyle {
  const _CustomTextStyle({Color color,
    Color backgroundColor,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    Paint foreground,
    Paint background,
    String fontFamily,
    String debugLabel,
    List<String> fontFamilyFallback,
    double fontSize,
    TextBaseline textBaseline,
    double letterSpacing,
    double wordSpacing,
    double height,
    Locale locale,
    bool inherit = true,
    TextDecoration decoration,
    List<ui.Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
    FontStyle fontStyle,
    double decorationThickness,
    FontWeight fontWeight})
      : super(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
  );

  TextStyle withValues({Color color,
    Color backgroundColor,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
    Paint foreground,
    Paint background,
    String fontFamily,
    String debugLabel,
    List<String> fontFamilyFallback,
    double fontSize,
    TextBaseline textBaseline,
    double letterSpacing,
    double wordSpacing,
    double height,
    Locale locale,
    bool inherit,
    TextDecoration decoration,
    List<ui.Shadow> shadows,
    List<ui.FontFeature> fontFeatures,
    FontStyle fontStyle,
    double decorationThickness,
    FontWeight fontWeight}) {
    return TextStyle(
      inherit: inherit ?? this.inherit,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      debugLabel: debugLabel ?? this.debugLabel,
    );
  }
}

mixin AppColor {
  static const menuBackground = Colors.brown;
  static const menuText = Colors.white;
}

class _Keys {
  final firstLoad = "firstLoad";
  final lang = "defaultLang";
  final bibleId = "bibleId";

  const _Keys();
}
