// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'src/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************


///
class S {
  /// Constructor.
  S();
  
  ///
  static late S current;
  
  ///
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  /// Function to load the current locale country code for language.
  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) 
    ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  ///
  static S? of(BuildContext context) => Localizations.of<S>(context, S);

  /// All over this part, we see getter to facilitate
  /// translation of word or some Text.
  /// 
  /// 
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  String get translation {
    return Intl.message(
      'translation',
      name: 'translation',
      desc: '',
      args: [],
    );
  }

  String get evaluate {
    return Intl.message(
      'Rate app',
      name: 'evaluate',
      desc: '',
      args: [],
    );
  }

  String share(Object lapp) {
    return Intl.message(
      'Share $lapp',
      name: 'share',
      desc: '',
      args: [lapp],
    );
  }

  String shareMsg(Object url) {
    return Intl.message(
      'Hey! here is a very interesting '
      'evangelistic sharing application 👉 $url',
      name: 'shareMsg',
      desc: '',
      args: [url],
    );
  }

  String get appName {
    return Intl.message(
      'Biblical calendar',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get lapp {
    return Intl.message(
      'the application',
      name: 'lapp',
      desc: '',
      args: [],
    );
  }

  String get verse {
    return Intl.message(
      'Verse',
      name: 'verse',
      desc: '',
      args: [],
    );
  }

  String get no_translation {
    return Intl.message(
      'No translation',
      name: 'no_translation',
      desc: '',
      args: [],
    );
  }

  String get download_least_one_translate {
    return Intl.message(
      'Please download at least one translation '
      'to access the application features',
      name: 'download_least_one_translate',
      desc: '',
      args: [],
    );
  }

  String get ok {
    return Intl.message(
      'Okay',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  String get confirm_delete {
    return Intl.message(
      'Confirmation of deletion',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  String get really_want_it {
    return Intl.message(
      'Are you sure you want to delete the translation',
      name: 'really_want_it',
      desc: '',
      args: [],
    );
  }

  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  String you_have_x_translation(Object count, Object add_s) {
    return Intl.message(
      'You have $count translation$add_s',
      name: 'you_have_x_translation',
      desc: '',
      args: [count, add_s],
    );
  }

  String get add_translation {
    return Intl.message(
      'Add translation',
      name: 'add_translation',
      desc: '',
      args: [],
    );
  }

  String get def {
    return Intl.message(
      'Default',
      name: 'def',
      desc: '',
      args: [],
    );
  }

  String get mark_as_principal {
    return Intl.message(
      'set as main translation',
      name: 'mark_as_principal',
      desc: '',
      args: [],
    );
  }

  String get favorite_not_found {
    return Intl.message(
      'favorites not found',
      name: 'favorite_not_found',
      desc: '',
      args: [],
    );
  }

  String get text_of_d {
    return Intl.message(
      'Text of the Day',
      name: 'text_of_d',
      desc: '',
      args: [],
    );
  }

  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  String get not_found_in_current_translation {
    return Intl.message(
      'not found in the current translation. Please',
      name: 'not_found_in_current_translation',
      desc: '',
      args: [],
    );
  }

  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  String get appropriate_translation {
    return Intl.message(
      'The appropriate translation',
      name: 'appropriate_translation',
      desc: '',
      args: [],
    );
  }

  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  String get downloaded {
    return Intl.message(
      'Downloaded',
      name: 'downloaded',
      desc: '',
      args: [],
    );
  }

  String get downloading {
    return Intl.message(
      'Downloading',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  String get updating {
    return Intl.message(
      'Update in progress',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  String get updating_db {
    return Intl.message(
      'Database update in progress',
      name: 'updating_db',
      desc: '',
      args: [],
    );
  }

  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  String get error_download_data_msg {
    return Intl.message(
      'Error while retrieving data. Please check '
      'your internet access or try again later. If the problem persists,',
      name: 'error_download_data_msg',
      desc: '',
      args: [],
    );
  }

  String get send_report {
    return Intl.message(
      'Send a report',
      name: 'send_report',
      desc: '',
      args: [],
    );
  }

  String get report_subject {
    return Intl.message(
      'The application № 099 fails to install the translation',
      name: 'report_subject',
      desc: '',
      args: [],
    );
  }

  String get report_body {
    return Intl.message(
      'Enter a full description of your error',
      name: 'report_body',
      desc: '',
      args: [],
    );
  }

  String get report_can_Send {
    return Intl.message(
      'Can\'t send report',
      name: 'report_can_Send',
      desc: '',
      args: [],
    );
  }

  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  String get ignore {
    return Intl.message(
      'Ignore',
      name: 'ignore',
      desc: '',
      args: [],
    );
  }

  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  String get module_calendar_header {
    return Intl.message(
      'Daily reading',
      name: 'module_calendar_header',
      desc: '',
      args: [],
    );
  }

  String get module_calendar_content {
    return Intl.message(
      'The application offers daily verses from your '
      'community that you can read and share with your loved ones.',
      name: 'module_calendar_content',
      desc: '',
      args: [],
    );
  }

  String get module_bible_header {
    return Intl.message(
      'Free access to several translations!',
      name: 'module_bible_header',
      desc: '',
      args: [],
    );
  }

  String get module_bible_content {
    return Intl.message(
      'In the "translations" menu, you have the possibility '
      'of downloading a translation or several translations according '
      'to your preferences. You also have the possibility of '
      'making a filter: it is fast and efficient 😇',
      name: 'module_bible_content',
      desc: '',
      args: [],
    );
  }

  String get module_welcome_content {
    return Intl.message(
      'This application has been designed to allow \n 	- Any believing community to create and share publications with their followers \n 	- Any family to improve awareness of speech \n 	- Any person to better analyze and share the St scriptures',
      name: 'module_welcome_content',
      desc: '',
      args: [],
    );
  }

  String get module_welcome_header {
    return Intl.message(
      'Welcome!',
      name: 'module_welcome_header',
      desc: '',
      args: [],
    );
  }

  String get select_preferred_lang {
    return Intl.message(
      'Please select your preferred language',
      name: 'select_preferred_lang',
      desc: '',
      args: [],
    );
  }

  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  String get one_timothy {
    return Intl.message(
      '1 Timothy',
      name: 'one_timothy',
      desc: '',
      args: [],
    );
  }

  String get psalms {
    return Intl.message(
      'Psalms',
      name: 'psalms',
      desc: '',
      args: [],
    );
  }

  String get genesis {
    return Intl.message(
      'Genesis',
      name: 'genesis',
      desc: '',
      args: [],
    );
  }

  String get exodus {
    return Intl.message(
      'Exodus',
      name: 'exodus',
      desc: '',
      args: [],
    );
  }

  String get leviticus {
    return Intl.message(
      'Leviticus',
      name: 'leviticus',
      desc: '',
      args: [],
    );
  }

  String get numbers {
    return Intl.message(
      'Numbers',
      name: 'numbers',
      desc: '',
      args: [],
    );
  }

  String get deuteronomy {
    return Intl.message(
      'Deuteronomy',
      name: 'deuteronomy',
      desc: '',
      args: [],
    );
  }

  String get joshua {
    return Intl.message(
      'Joshua',
      name: 'joshua',
      desc: '',
      args: [],
    );
  }

  String get judges {
    return Intl.message(
      'Judges',
      name: 'judges',
      desc: '',
      args: [],
    );
  }

  String get ruth {
    return Intl.message(
      'Ruth',
      name: 'ruth',
      desc: '',
      args: [],
    );
  }

  String get one_samuel {
    return Intl.message(
      '1 Samuel',
      name: 'one_samuel',
      desc: '',
      args: [],
    );
  }

  String get two_samuel {
    return Intl.message(
      '2 Samuel',
      name: 'two_samuel',
      desc: '',
      args: [],
    );
  }

  String get one_kings {
    return Intl.message(
      '1 Kings',
      name: 'one_kings',
      desc: '',
      args: [],
    );
  }

  String get two_kings {
    return Intl.message(
      '2 Kings',
      name: 'two_kings',
      desc: '',
      args: [],
    );
  }

  String get one_chronicles {
    return Intl.message(
      '1 Chronicles',
      name: 'one_chronicles',
      desc: '',
      args: [],
    );
  }

  String get two_chronicles {
    return Intl.message(
      '2 Chronicles',
      name: 'two_chronicles',
      desc: '',
      args: [],
    );
  }

  String get ezra {
    return Intl.message(
      'Ezra',
      name: 'ezra',
      desc: '',
      args: [],
    );
  }

  String get nehemiah {
    return Intl.message(
      'Nehemiah',
      name: 'nehemiah',
      desc: '',
      args: [],
    );
  }

  String get esther {
    return Intl.message(
      'Esther',
      name: 'esther',
      desc: '',
      args: [],
    );
  }

  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  String get proverbs {
    return Intl.message(
      'Proverbs',
      name: 'proverbs',
      desc: '',
      args: [],
    );
  }

  String get ecclesiastes {
    return Intl.message(
      'Ecclesiastes',
      name: 'ecclesiastes',
      desc: '',
      args: [],
    );
  }

  String get song_of_songs {
    return Intl.message(
      'Song of Songs',
      name: 'song_of_songs',
      desc: '',
      args: [],
    );
  }

  String get isaiah {
    return Intl.message(
      'Isaiah',
      name: 'isaiah',
      desc: '',
      args: [],
    );
  }

  String get jeremiah {
    return Intl.message(
      'Jeremiah',
      name: 'jeremiah',
      desc: '',
      args: [],
    );
  }

  String get lamentations {
    return Intl.message(
      'Lamentations',
      name: 'lamentations',
      desc: '',
      args: [],
    );
  }

  String get ezekiel {
    return Intl.message(
      'Ezekiel',
      name: 'ezekiel',
      desc: '',
      args: [],
    );
  }

  String get daniel {
    return Intl.message(
      'Daniel',
      name: 'daniel',
      desc: '',
      args: [],
    );
  }

  String get hosea {
    return Intl.message(
      'HHosea',
      name: 'hosea',
      desc: '',
      args: [],
    );
  }

  String get joel {
    return Intl.message(
      'Joel',
      name: 'joel',
      desc: '',
      args: [],
    );
  }

  String get amos {
    return Intl.message(
      'Amos',
      name: 'amos',
      desc: '',
      args: [],
    );
  }

  String get obadiah {
    return Intl.message(
      'Obadiah',
      name: 'obadiah',
      desc: '',
      args: [],
    );
  }

  String get jonah {
    return Intl.message(
      'Jonah',
      name: 'jonah',
      desc: '',
      args: [],
    );
  }

  String get micah {
    return Intl.message(
      'Micah',
      name: 'micah',
      desc: '',
      args: [],
    );
  }

  String get nahum {
    return Intl.message(
      'Nahum',
      name: 'nahum',
      desc: '',
      args: [],
    );
  }

  String get habakkuk {
    return Intl.message(
      'Habakkuk',
      name: 'habakkuk',
      desc: '',
      args: [],
    );
  }

  String get zephaniah {
    return Intl.message(
      'Zephaniah',
      name: 'zephaniah',
      desc: '',
      args: [],
    );
  }

  String get haggai {
    return Intl.message(
      'Haggai',
      name: 'haggai',
      desc: '',
      args: [],
    );
  }

  String get zechariah {
    return Intl.message(
      'Zechariah',
      name: 'zechariah',
      desc: '',
      args: [],
    );
  }

  String get malachi {
    return Intl.message(
      'Malachi',
      name: 'malachi',
      desc: '',
      args: [],
    );
  }

  String get matthew {
    return Intl.message(
      'Matthew',
      name: 'matthew',
      desc: '',
      args: [],
    );
  }

  String get mark {
    return Intl.message(
      'Mark',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  String get luke {
    return Intl.message(
      'Luke',
      name: 'luke',
      desc: '',
      args: [],
    );
  }

  String get john {
    return Intl.message(
      'John',
      name: 'john',
      desc: '',
      args: [],
    );
  }

  String get acts {
    return Intl.message(
      'Acts',
      name: 'acts',
      desc: '',
      args: [],
    );
  }

  String get romans {
    return Intl.message(
      'Romans',
      name: 'romans',
      desc: '',
      args: [],
    );
  }

  String get one_corinthians {
    return Intl.message(
      '1 Corinthians',
      name: 'one_corinthians',
      desc: '',
      args: [],
    );
  }

  String get two_corinthians {
    return Intl.message(
      '2 Corinthians',
      name: 'two_corinthians',
      desc: '',
      args: [],
    );
  }

  String get galatians {
    return Intl.message(
      'Galatians',
      name: 'galatians',
      desc: '',
      args: [],
    );
  }

  String get ephesians {
    return Intl.message(
      'Ephesians',
      name: 'ephesians',
      desc: '',
      args: [],
    );
  }

  String get philippians {
    return Intl.message(
      'Philippians',
      name: 'philippians',
      desc: '',
      args: [],
    );
  }

  String get colossians {
    return Intl.message(
      'Colossians',
      name: 'colossians',
      desc: '',
      args: [],
    );
  }

  String get one_thessalonians {
    return Intl.message(
      '1 Thessalonians',
      name: 'one_thessalonians',
      desc: '',
      args: [],
    );
  }

  String get two_thessalonians {
    return Intl.message(
      '2 Thessalonians',
      name: 'two_thessalonians',
      desc: '',
      args: [],
    );
  }

  String get two_timothy {
    return Intl.message(
      '2 Timothy',
      name: 'two_timothy',
      desc: '',
      args: [],
    );
  }

  String get titus {
    return Intl.message(
      'Titus',
      name: 'titus',
      desc: '',
      args: [],
    );
  }

  String get philemon {
    return Intl.message(
      'Philemon',
      name: 'philemon',
      desc: '',
      args: [],
    );
  }

  String get hebrews {
    return Intl.message(
      'Hebrews',
      name: 'hebrews',
      desc: '',
      args: [],
    );
  }

  String get james {
    return Intl.message(
      'Jame',
      name: 'james',
      desc: '',
      args: [],
    );
  }

  String get one_peter {
    return Intl.message(
      '1 Peter',
      name: 'one_peter',
      desc: '',
      args: [],
    );
  }

  String get two_peter {
    return Intl.message(
      '2 Peter',
      name: 'two_peter',
      desc: '',
      args: [],
    );
  }

  String get one_john {
    return Intl.message(
      '1 John',
      name: 'one_john',
      desc: '',
      args: [],
    );
  }

  String get two_john {
    return Intl.message(
      '2 John',
      name: 'two_john',
      desc: '',
      args: [],
    );
  }

  String get tree_john {
    return Intl.message(
      '3 John',
      name: 'tree_john',
      desc: '',
      args: [],
    );
  }

  String get jude {
    return Intl.message(
      'Jude',
      name: 'jude',
      desc: '',
      args: [],
    );
  }

  String get revelation {
    return Intl.message(
      'Revelation',
      name: 'revelation',
      desc: '',
      args: [],
    );
  }

  String get you_can_choice_translate_start {
    return Intl.message(
      'You can download the',
      name: 'you_can_choice_translate_start',
      desc: '',
      args: [],
    );
  }

  String get you_can_choice_translate_middle {
    return Intl.message(
      'or',
      name: 'you_can_choice_translate_middle',
      desc: '',
      args: [],
    );
  }

  String get you_can_choice_translate_end {
    return Intl.message(
      'version',
      name: 'you_can_choice_translate_end',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  // Getter to change language
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}