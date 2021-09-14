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
    final String localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      // ignore: join_return_with_assignment
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
      
    );

  
  ////
  String get calendar => Intl.message(
      'Calendar',
      name: 'calendar',
      
    );

  
  ////
  String get favorites => Intl.message(
      'Favorites',
      name: 'favorites',
      
    );

  ////
  String get translation => Intl.message(
      'translation',
      name: 'translation',
      
    );

  ////
  String get evaluate => Intl.message(
      'Rate app',
      name: 'evaluate',
      
    );

  ///
  String share(Object lapp) => Intl.message(
      'Share $lapp',
      name: 'share',
      // ignore: always_specify_types
      args: [lapp],
    );
  /// 
  String shareMsg(Object url) => Intl.message(
      'Hey! here is a very interesting '
      'evangelistic sharing application 👉 $url',
      name: 'shareMsg',
      // ignore: always_specify_types
      args: [url],
    );

  ////
  String get appName => Intl.message(
      'Biblical calendar',
      name: 'appName',
      
    );

  ////
  String get lapp => Intl.message(
      'the application',
      name: 'lapp',
      
    );

  ////
  String get verse => Intl.message(
      'Verse',
      name: 'verse',
      
    );

  ////
  String get noTranslation => Intl.message(
      'No translation',
      name: 'noTranslation',
      
    );

  ////
  String get downloadLeastOneTranslate => Intl.message(
      'Please download at least one translation '
      'to access the application features',
      name: 'downloadLeastOneTranslate',
      
    );

  ////
  String get ok => Intl.message(
      'Okay',
      name: 'ok',
      
    );

  ////
  String get confirmDelete => Intl.message(
      'Confirmation of deletion',
      name: 'confirmDelete',
      
    );

  ////
  String get reallyWantIt => Intl.message(
      'Are you sure you want to delete the translation',
      name: 'reallyWantIt',
      
    );

  ////
  String get delete => Intl.message(
      'Delete',
      name: 'delete',
      
    );

  ////
  String get cancel => Intl.message(
      'Cancel',
      name: 'cancel',
      
    );
  ///
  String youHaveXtranslation(Object count, Object addS) => Intl.message(
      'You have $count translation$addS',
      name: 'youHaveXtranslation',
      // ignore: always_specify_types
      args: [count, addS],
    );

  ////
  String get addTranslation => Intl.message(
      'Add translation',
      name: 'addTranslation',
      
    );

  ////
  String get def => Intl.message(
      'Default',
      name: 'def',
      
    );

  ////
  String get markAsPrincipal => Intl.message(
      'set as main translation',
      name: 'markAsPrincipal',
      
    );

  ////
  String get favoriteNotFound => Intl.message(
      'favorites not found',
      name: 'favoriteNotFound',
      
    );

  ////
  String get textOfD => Intl.message(
      'Text of the Day',
      name: 'textOfD',
      
    );

  ////
  String get monday => Intl.message(
      'Monday',
      name: 'monday',
      
    );

  ////
  String get tuesday => Intl.message(
      'Tuesday',
      name: 'tuesday',
      
    );

  ////
  String get wednesday => Intl.message(
      'Wednesday',
      name: 'wednesday',
      
    );

  ////
  String get thursday => Intl.message(
      'Thursday',
      name: 'thursday',
      
    );

  ////
  String get friday => Intl.message(
      'Friday',
      name: 'friday',
      
    );

  ////
  String get saturday => Intl.message(
      'Saturday',
      name: 'saturday',
      
    );

  ////
  String get sunday => Intl.message(
      'Sunday',
      name: 'sunday',
      
    );

  ////
  String get notFoundInCurrentTranslation => Intl.message(
      'not found in the current translation. Please',
      name: 'notFoundInCurrentTranslation',
      
    );

  ////
  String get select => Intl.message(
      'Select',
      name: 'select',
      
    );

  ////
  String get or => Intl.message(
      'Or',
      name: 'or',
      
    );

  ////
  String get download => Intl.message(
      'Download',
      name: 'download',
      
    );

  ////
  String get appropriateTranslation => Intl.message(
      'The appropriate translation',
      name: 'appropriateTranslation',
      
    );

  ////
  String get language => Intl.message(
      'Language',
      name: 'language',
      
    );

  ////
  String get size => Intl.message(
      'Size',
      name: 'size',
      
    );

  ////
  String get downloaded => Intl.message(
      'Downloaded',
      name: 'downloaded',
      
    );

  ////
  String get downloading => Intl.message(
      'Downloading',
      name: 'downloading',
      
    );

  ////
  String get updating => Intl.message(
      'Update in progress',
      name: 'updating',
      
    );

  ////
  String get updatingDb => Intl.message(
      'Database update in progress',
      name: 'updatingDb',
      
    );

  ////
  String get error => Intl.message(
      'Error',
      name: 'error',
      
    );

  ////
  String get errorDownloadDataMsg => Intl.message(
      'Error while retrieving data. Please check '
      'your internet access or try again later. If the problem persists,',
      name: 'errorDownloadDataMsg',
      
    );

  ////
  String get sendReport => Intl.message(
      'Send a report',
      name: 'sendReport',
      
    );

  ////
  String get reportSubject => Intl.message(
      'The application № 099 fails to install the translation',
      name: 'reportSubject',
      
    );

  ////
  String get reportBody => Intl.message(
      'Enter a full description of your error',
      name: 'reportBody',
      
    );

  ////
  String get reportCanSend => Intl.message(
      "Can't send report",
      name: 'reportCanSend',
      
    );

  ////
  String get next => Intl.message(
      'Next',
      name: 'next',
      
    );

  ////
  String get ignore => Intl.message(
      'Ignore',
      name: 'ignore',
      
    );

  ////
  String get start => Intl.message(
      'Start',
      name: 'start',
      
    );

  ////
  String get save => Intl.message(
      'Save',
      name: 'save',
      
    );

  ////
  String get moduleCalendarHeader => Intl.message(
      'Daily reading',
      name: 'moduleCalendarHeader',
      
    );

  ////
  String get moduleCalendarContent => Intl.message(
      'The application offers daily verses from your '
      'community that you can read and share with your loved ones.',
      name: 'moduleCalendarContent',
      
    );

  ////
  String get moduleBibleHeader => Intl.message(
      'Free access to several translations!',
      name: 'moduleBibleHeader',
      
    );

  ////
  String get moduleBibleContent => Intl.message(
      'In the "translations" menu, you have the possibility '
      'of downloading a translation or several translations according '
      'to your preferences. You also have the possibility of '
      'making a filter: it is fast and efficient 😇',
      name: 'moduleBibleContent',
      
    );

  ////
  String get moduleWelcomeContent => Intl.message(
      'This application has been designed to allow \n 	'
      '- Any believing community to create and share publications with their '
      'followers \n 	- Any family to improve awareness of speech \n 	- Any '
      'person to better analyze and share the St scriptures',
      name: 'moduleWelcomeContent',
      
    );

  ////
  String get moduleWelcomeHeader => Intl.message(
      'Welcome!',
      name: 'moduleWelcomeHeader',
      
    );

  ////
  String get selectPreferredLang => Intl.message(
      'Please select your preferred language',
      name: 'selectPreferredLang',
      
    );

  ////
  String get french => Intl.message(
      'French',
      name: 'french',
      
    );

  ////
  String get english => Intl.message(
      'English',
      name: 'english',
      
    );

  ////
  String get oneTimothy => Intl.message(
      '1 Timothy',
      name: 'oneTimothy',
      
    );

  ////
  String get psalms => Intl.message(
      'Psalms',
      name: 'psalms',
      
    );

  ////
  String get genesis => Intl.message(
      'Genesis',
      name: 'genesis',
      
    );

  ////
  String get exodus => Intl.message(
      'Exodus',
      name: 'exodus',
      
    );

  ////
  String get leviticus => Intl.message(
      'Leviticus',
      name: 'leviticus',
      
    );

  ////
  String get numbers => Intl.message(
      'Numbers',
      name: 'numbers',
      
    );

  ////
  String get deuteronomy => Intl.message(
      'Deuteronomy',
      name: 'deuteronomy',
      
    );

  ////
  String get joshua => Intl.message(
      'Joshua',
      name: 'joshua',
      
    );

  ////
  String get judges => Intl.message(
      'Judges',
      name: 'judges',
      
    );

  ////
  String get ruth => Intl.message(
      'Ruth',
      name: 'ruth',
      
    );

  ////
  String get oneSamuel => Intl.message(
      '1 Samuel',
      name: 'oneSamuel',
      
    );

  ////
  String get twoSamuel => Intl.message(
      '2 Samuel',
      name: 'twoSamuel',
      
    );

  ////
  String get oneKings => Intl.message(
      '1 Kings',
      name: 'oneKings',
      
    );

  ////
  String get twoKings => Intl.message(
      '2 Kings',
      name: 'twoKings',
      
    );

  ////
  String get oneChronicles => Intl.message(
      '1 Chronicles',
      name: 'oneChronicles',
      
    );

  ////
  String get twoChronicles => Intl.message(
      '2 Chronicles',
      name: 'twoChronicles',
      
    );

  ////
  String get ezra => Intl.message(
      'Ezra',
      name: 'ezra',
      
    );

  ////
  String get nehemiah => Intl.message(
      'Nehemiah',
      name: 'nehemiah',
      
    );

  ////
  String get esther => Intl.message(
      'Esther',
      name: 'esther',
      
    );

  ////
  String get job => Intl.message(
      'Job',
      name: 'job',
      
    );

  ////
  String get proverbs => Intl.message(
      'Proverbs',
      name: 'proverbs',
      
    );

  ////
  String get ecclesiastes => Intl.message(
      'Ecclesiastes',
      name: 'ecclesiastes',
      
    );

  ////
  String get songOfSongs => Intl.message(
      'Song of Songs',
      name: 'songOfSongs',
      
    );

  ////
  String get isaiah => Intl.message(
      'Isaiah',
      name: 'isaiah',
      
    );

  ////
  String get jeremiah => Intl.message(
      'Jeremiah',
      name: 'jeremiah',
      
    );

  ////
  String get lamentations => Intl.message(
      'Lamentations',
      name: 'lamentations',
      
    );

  ////
  String get ezekiel => Intl.message(
      'Ezekiel',
      name: 'ezekiel',
      
    );

  ////
  String get daniel => Intl.message(
      'Daniel',
      name: 'daniel',
      
    );

  ////
  String get hosea => Intl.message(
      'HHosea',
      name: 'hosea',
      
    );

  ////
  String get joel => Intl.message(
      'Joel',
      name: 'joel',
      
    );

  ////
  String get amos => Intl.message(
      'Amos',
      name: 'amos',
      
    );

  ////
  String get obadiah => Intl.message(
      'Obadiah',
      name: 'obadiah',
      
    );

  ////
  String get jonah => Intl.message(
      'Jonah',
      name: 'jonah',
      
    );

  ////
  String get micah => Intl.message(
      'Micah',
      name: 'micah',
      
    );

  ////
  String get nahum => Intl.message(
      'Nahum',
      name: 'nahum',
      
    );

  ////
  String get habakkuk => Intl.message(
      'Habakkuk',
      name: 'habakkuk',
      
    );

  ////
  String get zephaniah => Intl.message(
      'Zephaniah',
      name: 'zephaniah',
      
    );

  ////
  String get haggai => Intl.message(
      'Haggai',
      name: 'haggai',
      
    );

  ////
  String get zechariah => Intl.message(
      'Zechariah',
      name: 'zechariah',
      
    );

  ////
  String get malachi => Intl.message(
      'Malachi',
      name: 'malachi',
      
    );

  ////
  String get matthew => Intl.message(
      'Matthew',
      name: 'matthew',
      
    );
  ////
  ////
  String get mark => Intl.message(
      'Mark',
      name: 'mark',
      
    );

  ////
  String get luke => Intl.message(
      'Luke',
      name: 'luke',
      
    );

  ////
  String get john => Intl.message(
      'John',
      name: 'john',
      
    );

  ////
  String get acts => Intl.message(
      'Acts',
      name: 'acts',
      
    );

  ////
  String get romans => Intl.message(
      'Romans',
      name: 'romans',
      
    );

  ////
  String get oneCorinthians => Intl.message(
      '1 Corinthians',
      name: 'oneCorinthians',
      
    );

  ////
  String get twoCorinthians => Intl.message(
      '2 Corinthians',
      name: 'twoCorinthians',
      
    );

  ////
  String get galatians => Intl.message(
      'Galatians',
      name: 'galatians',
      
    );

  ////
  String get ephesians => Intl.message(
      'Ephesians',
      name: 'ephesians',
      
    );

  ////
  String get philippians => Intl.message(
      'Philippians',
      name: 'philippians',
      
    );

  ////
  String get colossians => Intl.message(
      'Colossians',
      name: 'colossians',
      
    );

  ////
  String get oneThessalonians => Intl.message(
      '1 Thessalonians',
      name: 'oneThessalonians',
      
    );

  ////
  String get twoThessalonians => Intl.message(
      '2 Thessalonians',
      name: 'twoThessalonians',
      
    );

  ////
  String get twoTimothy => Intl.message(
      '2 Timothy',
      name: 'twoTimothy',
      
    );

  ////
  String get titus => Intl.message(
      'Titus',
      name: 'titus',
      
    );

  ////
  String get philemon => Intl.message(
      'Philemon',
      name: 'philemon',
      
    );

  ////
  String get hebrews => Intl.message(
      'Hebrews',
      name: 'hebrews',
      
    );

  ////
  String get james => Intl.message(
      'Jame',
      name: 'james',
      
    );

  ////
  String get onePeter => Intl.message(
      '1 Peter',
      name: 'onePeter',
      
    );

  ////
  String get twoPeter => Intl.message(
      '2 Peter',
      name: 'twoPeter',
      
    );

  ////
  String get oneJohn => Intl.message(
      '1 John',
      name: 'oneJohn',
      
    );

  ////
  String get twoJohn => Intl.message(
      '2 John',
      name: 'twoJohn',
      
    );

  ////
  String get treeJohn => Intl.message(
      '3 John',
      name: 'treeJohn',
      
    );

  ////
  String get jude => Intl.message(
      'Jude',
      name: 'jude',
      
    );

  ////
  String get revelation => Intl.message(
      'Revelation',
      name: 'revelation',
      
    );

  ////
  String get youCanChoicetranslateStart => Intl.message(
      'You can download the',
      name: 'youCanChoicetranslateStart',
      
    );

  ////
  String get youCanChoicetranslateMiddle => Intl.message(
      'or',
      name: 'youCanChoicetranslateMiddle',
      
    );

  ////
  String get youCanChoiceTranslateEnd => Intl.message(
      'version',
      name: 'youCanChoiceTranslateEnd',
      
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
    for (final Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}