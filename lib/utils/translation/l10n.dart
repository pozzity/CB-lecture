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
  ////
  String get home => Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );

  
  ////
  String get calendar => Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );

  
  ////
  String get favorites => Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );

  ////
  String get translation => Intl.message(
      'translation',
      name: 'translation',
      desc: '',
      args: [],
    );

  ////
  String get evaluate => Intl.message(
      'Rate app',
      name: 'evaluate',
      desc: '',
      args: [],
    );
    
  ///
  String share(Object lapp) => Intl.message(
      'Share $lapp',
      name: 'share',
      desc: '',
      args: [lapp],
    );
  /// 
  String shareMsg(Object url) => Intl.message(
      'Hey! here is a very interesting '
      'evangelistic sharing application 👉 $url',
      name: 'shareMsg',
      desc: '',
      args: [url],
    );

  ////
  String get appName => Intl.message(
      'Biblical calendar',
      name: 'appName',
      desc: '',
      args: [],
    );

  ////
  String get lapp => Intl.message(
      'the application',
      name: 'lapp',
      desc: '',
      args: [],
    );

  ////
  String get verse => Intl.message(
      'Verse',
      name: 'verse',
      desc: '',
      args: [],
    );

  ////
  String get noTranslation => Intl.message(
      'No translation',
      name: 'noTranslation',
      desc: '',
      args: [],
    );

  ////
  String get downloadLeastOneTranslate => Intl.message(
      'Please download at least one translation '
      'to access the application features',
      name: 'downloadLeastOneTranslate',
      desc: '',
      args: [],
    );

  ////
  String get ok => Intl.message(
      'Okay',
      name: 'ok',
      desc: '',
      args: [],
    );

  ////
  String get confirmDelete => Intl.message(
      'Confirmation of deletion',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );

  ////
  String get reallyWantIt => Intl.message(
      'Are you sure you want to delete the translation',
      name: 'reallyWantIt',
      desc: '',
      args: [],
    );

  ////
  String get delete => Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );

  ////
  String get cancel => Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  ///
  String youHaveXtranslation(Object count, Object add_s) => Intl.message(
      'You have $count translation$add_s',
      name: 'youHaveXtranslation',
      desc: '',
      args: [count, add_s],
    );

  ////
  String get addTranslation => Intl.message(
      'Add translation',
      name: 'addTranslation',
      desc: '',
      args: [],
    );

  ////
  String get def => Intl.message(
      'Default',
      name: 'def',
      desc: '',
      args: [],
    );

  ////
  String get markAsPrincipal => Intl.message(
      'set as main translation',
      name: 'markAsPrincipal',
      desc: '',
      args: [],
    );

  ////
  String get favoriteNotFound => Intl.message(
      'favorites not found',
      name: 'favoriteNotFound',
      desc: '',
      args: [],
    );

  ////
  String get text_of_d => Intl.message(
      'Text of the Day',
      name: 'text_of_d',
      desc: '',
      args: [],
    );

  ////
  String get monday => Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );

  ////
  String get tuesday => Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );

  ////
  String get wednesday => Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );

  ////
  String get thursday => Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );

  ////
  String get friday => Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );

  ////
  String get saturday => Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );

  ////
  String get sunday => Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );

  ////
  String get notFoundInCurrentTranslation => Intl.message(
      'not found in the current translation. Please',
      name: 'notFoundInCurrentTranslation',
      desc: '',
      args: [],
    );

  ////
  String get select => Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );

  ////
  String get or => Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );

  ////
  String get download => Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );

  ////
  String get appropriateTranslation => Intl.message(
      'The appropriate translation',
      name: 'appropriateTranslation',
      desc: '',
      args: [],
    );

  ////
  String get language => Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );

  ////
  String get size => Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );

  ////
  String get downloaded => Intl.message(
      'Downloaded',
      name: 'downloaded',
      desc: '',
      args: [],
    );

  ////
  String get downloading => Intl.message(
      'Downloading',
      name: 'downloading',
      desc: '',
      args: [],
    );

  ////
  String get updating => Intl.message(
      'Update in progress',
      name: 'updating',
      desc: '',
      args: [],
    );

  ////
  String get updatingDb => Intl.message(
      'Database update in progress',
      name: 'updatingDb',
      desc: '',
      args: [],
    );

  ////
  String get error => Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );

  ////
  String get errorDownloadDataMsg => Intl.message(
      'Error while retrieving data. Please check '
      'your internet access or try again later. If the problem persists,',
      name: 'errorDownloadDataMsg',
      desc: '',
      args: [],
    );

  ////
  String get sendReport => Intl.message(
      'Send a report',
      name: 'sendReport',
      desc: '',
      args: [],
    );

  ////
  String get reportSubject => Intl.message(
      'The application № 099 fails to install the translation',
      name: 'reportSubject',
      desc: '',
      args: [],
    );

  ////
  String get reportBody => Intl.message(
      'Enter a full description of your error',
      name: 'reportBody',
      desc: '',
      args: [],
    );

  ////
  String get reportCanSend => Intl.message(
      'Can\'t send report',
      name: 'reportCanSend',
      desc: '',
      args: [],
    );

  ////
  String get next => Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );

  ////
  String get ignore => Intl.message(
      'Ignore',
      name: 'ignore',
      desc: '',
      args: [],
    );

  ////
  String get start => Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );

  ////
  String get save => Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );

  ////
  String get moduleCalendarHeader => Intl.message(
      'Daily reading',
      name: 'moduleCalendarHeader',
      desc: '',
      args: [],
    );

  ////
  String get moduleCalendarContent => Intl.message(
      'The application offers daily verses from your '
      'community that you can read and share with your loved ones.',
      name: 'moduleCalendarContent',
      desc: '',
      args: [],
    );

  ////
  String get moduleBibleHeader => Intl.message(
      'Free access to several translations!',
      name: 'moduleBibleHeader',
      desc: '',
      args: [],
    );

  ////
  String get moduleBibleContent => Intl.message(
      'In the "translations" menu, you have the possibility '
      'of downloading a translation or several translations according '
      'to your preferences. You also have the possibility of '
      'making a filter: it is fast and efficient 😇',
      name: 'moduleBibleContent',
      desc: '',
      args: [],
    );

  ////
  String get moduleWelcomeContent => Intl.message(
      'This application has been designed to allow \n 	- Any believing community to create and share publications with their followers \n 	- Any family to improve awareness of speech \n 	- Any person to better analyze and share the St scriptures',
      name: 'moduleWelcomeContent',
      desc: '',
      args: [],
    );

  ////
  String get moduleWelcomeHeader => Intl.message(
      'Welcome!',
      name: 'moduleWelcomeHeader',
      desc: '',
      args: [],
    );

  ////
  String get selectPreferredLang => Intl.message(
      'Please select your preferred language',
      name: 'selectPreferredLang',
      desc: '',
      args: [],
    );

  ////
  String get french => Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );

  ////
  String get english => Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );

  ////
  String get one_timothy => Intl.message(
      '1 Timothy',
      name: 'one_timothy',
      desc: '',
      args: [],
    );

  ////
  String get psalms => Intl.message(
      'Psalms',
      name: 'psalms',
      desc: '',
      args: [],
    );

  ////
  String get genesis => Intl.message(
      'Genesis',
      name: 'genesis',
      desc: '',
      args: [],
    );

  ////
  String get exodus => Intl.message(
      'Exodus',
      name: 'exodus',
      desc: '',
      args: [],
    );

  ////
  String get leviticus => Intl.message(
      'Leviticus',
      name: 'leviticus',
      desc: '',
      args: [],
    );

  ////
  String get numbers => Intl.message(
      'Numbers',
      name: 'numbers',
      desc: '',
      args: [],
    );

  ////
  String get deuteronomy => Intl.message(
      'Deuteronomy',
      name: 'deuteronomy',
      desc: '',
      args: [],
    );

  ////
  String get joshua => Intl.message(
      'Joshua',
      name: 'joshua',
      desc: '',
      args: [],
    );

  ////
  String get judges => Intl.message(
      'Judges',
      name: 'judges',
      desc: '',
      args: [],
    );

  ////
  String get ruth => Intl.message(
      'Ruth',
      name: 'ruth',
      desc: '',
      args: [],
    );

  ////
  String get oneSamuel => Intl.message(
      '1 Samuel',
      name: 'oneSamuel',
      desc: '',
      args: [],
    );

  ////
  String get twoSamuel => Intl.message(
      '2 Samuel',
      name: 'twoSamuel',
      desc: '',
      args: [],
    );

  ////
  String get oneKings => Intl.message(
      '1 Kings',
      name: 'oneKings',
      desc: '',
      args: [],
    );

  ////
  String get twoKings => Intl.message(
      '2 Kings',
      name: 'twoKings',
      desc: '',
      args: [],
    );

  ////
  String get oneChronicles => Intl.message(
      '1 Chronicles',
      name: 'oneChronicles',
      desc: '',
      args: [],
    );

  ////
  String get twoChronicles => Intl.message(
      '2 Chronicles',
      name: 'twoChronicles',
      desc: '',
      args: [],
    );

  ////
  String get ezra => Intl.message(
      'Ezra',
      name: 'ezra',
      desc: '',
      args: [],
    );

  ////
  String get nehemiah => Intl.message(
      'Nehemiah',
      name: 'nehemiah',
      desc: '',
      args: [],
    );

  ////
  String get esther => Intl.message(
      'Esther',
      name: 'esther',
      desc: '',
      args: [],
    );

  ////
  String get job => Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );

  ////
  String get proverbs => Intl.message(
      'Proverbs',
      name: 'proverbs',
      desc: '',
      args: [],
    );

  ////
  String get ecclesiastes => Intl.message(
      'Ecclesiastes',
      name: 'ecclesiastes',
      desc: '',
      args: [],
    );

  ////
  String get songOfSongs => Intl.message(
      'Song of Songs',
      name: 'songOfSongs',
      desc: '',
      args: [],
    );

  ////
  String get isaiah => Intl.message(
      'Isaiah',
      name: 'isaiah',
      desc: '',
      args: [],
    );

  ////
  String get jeremiah => Intl.message(
      'Jeremiah',
      name: 'jeremiah',
      desc: '',
      args: [],
    );

  ////
  String get lamentations => Intl.message(
      'Lamentations',
      name: 'lamentations',
      desc: '',
      args: [],
    );

  ////
  String get ezekiel => Intl.message(
      'Ezekiel',
      name: 'ezekiel',
      desc: '',
      args: [],
    );

  ////
  String get daniel => Intl.message(
      'Daniel',
      name: 'daniel',
      desc: '',
      args: [],
    );

  ////
  String get hosea => Intl.message(
      'HHosea',
      name: 'hosea',
      desc: '',
      args: [],
    );

  ////
  String get joel => Intl.message(
      'Joel',
      name: 'joel',
      desc: '',
      args: [],
    );

  ////
  String get amos => Intl.message(
      'Amos',
      name: 'amos',
      desc: '',
      args: [],
    );

  ////
  String get obadiah => Intl.message(
      'Obadiah',
      name: 'obadiah',
      desc: '',
      args: [],
    );

  ////
  String get jonah => Intl.message(
      'Jonah',
      name: 'jonah',
      desc: '',
      args: [],
    );

  ////
  String get micah => Intl.message(
      'Micah',
      name: 'micah',
      desc: '',
      args: [],
    );

  ////
  String get nahum => Intl.message(
      'Nahum',
      name: 'nahum',
      desc: '',
      args: [],
    );

  ////
  String get habakkuk => Intl.message(
      'Habakkuk',
      name: 'habakkuk',
      desc: '',
      args: [],
    );

  ////
  String get zephaniah => Intl.message(
      'Zephaniah',
      name: 'zephaniah',
      desc: '',
      args: [],
    );

  ////
  String get haggai => Intl.message(
      'Haggai',
      name: 'haggai',
      desc: '',
      args: [],
    );

  ////
  String get zechariah => Intl.message(
      'Zechariah',
      name: 'zechariah',
      desc: '',
      args: [],
    );

  ////
  String get malachi => Intl.message(
      'Malachi',
      name: 'malachi',
      desc: '',
      args: [],
    );

  ////
  String get matthew => Intl.message(
      'Matthew',
      name: 'matthew',
      desc: '',
      args: [],
    );
  ////
  ////
  String get mark => Intl.message(
      'Mark',
      name: 'mark',
      desc: '',
      args: [],
    );

  ////
  String get luke => Intl.message(
      'Luke',
      name: 'luke',
      desc: '',
      args: [],
    );

  ////
  String get john => Intl.message(
      'John',
      name: 'john',
      desc: '',
      args: [],
    );

  ////
  String get acts => Intl.message(
      'Acts',
      name: 'acts',
      desc: '',
      args: [],
    );

  ////
  String get romans => Intl.message(
      'Romans',
      name: 'romans',
      desc: '',
      args: [],
    );

  ////
  String get oneCorinthians => Intl.message(
      '1 Corinthians',
      name: 'oneCorinthians',
      desc: '',
      args: [],
    );

  ////
  String get twoCorinthians => Intl.message(
      '2 Corinthians',
      name: 'twoCorinthians',
      desc: '',
      args: [],
    );

  ////
  String get galatians => Intl.message(
      'Galatians',
      name: 'galatians',
      desc: '',
      args: [],
    );

  ////
  String get ephesians => Intl.message(
      'Ephesians',
      name: 'ephesians',
      desc: '',
      args: [],
    );

  ////
  String get philippians => Intl.message(
      'Philippians',
      name: 'philippians',
      desc: '',
      args: [],
    );

  ////
  String get colossians => Intl.message(
      'Colossians',
      name: 'colossians',
      desc: '',
      args: [],
    );

  ////
  String get oneThessalonians => Intl.message(
      '1 Thessalonians',
      name: 'oneThessalonians',
      desc: '',
      args: [],
    );

  ////
  String get twoThessalonians => Intl.message(
      '2 Thessalonians',
      name: 'twoThessalonians',
      desc: '',
      args: [],
    );

  ////
  String get twoTimothy => Intl.message(
      '2 Timothy',
      name: 'twoTimothy',
      desc: '',
      args: [],
    );

  ////
  String get titus => Intl.message(
      'Titus',
      name: 'titus',
      desc: '',
      args: [],
    );

  ////
  String get philemon => Intl.message(
      'Philemon',
      name: 'philemon',
      desc: '',
      args: [],
    );

  ////
  String get hebrews => Intl.message(
      'Hebrews',
      name: 'hebrews',
      desc: '',
      args: [],
    );

  ////
  String get james => Intl.message(
      'Jame',
      name: 'james',
      desc: '',
      args: [],
    );

  ////
  String get onePeter => Intl.message(
      '1 Peter',
      name: 'onePeter',
      desc: '',
      args: [],
    );

  ////
  String get twoPeter => Intl.message(
      '2 Peter',
      name: 'twoPeter',
      desc: '',
      args: [],
    );

  ////
  String get oneJohn => Intl.message(
      '1 John',
      name: 'oneJohn',
      desc: '',
      args: [],
    );

  ////
  String get twoJohn => Intl.message(
      '2 John',
      name: 'twoJohn',
      desc: '',
      args: [],
    );

  ////
  String get treeJohn => Intl.message(
      '3 John',
      name: 'treeJohn',
      desc: '',
      args: [],
    );

  ////
  String get jude => Intl.message(
      'Jude',
      name: 'jude',
      desc: '',
      args: [],
    );

  ////
  String get revelation => Intl.message(
      'Revelation',
      name: 'revelation',
      desc: '',
      args: [],
    );

  ////
  String get youCanChoicetranslateStart => Intl.message(
      'You can download the',
      name: 'youCanChoicetranslateStart',
      desc: '',
      args: [],
    );

  ////
  String get youCanChoicetranslateMiddle => Intl.message(
      'or',
      name: 'youCanChoicetranslateMiddle',
      desc: '',
      args: [],
    );

  ////
  String get youCanChoiceTranslateEnd => Intl.message(
      'version',
      name: 'youCanChoiceTranslateEnd',
      desc: '',
      args: [],
    );
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {

  const AppLocalizationDelegate();

  /// Getter for the locale languages code we have chosen
  List<Locale> get supportedLocales => const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];

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