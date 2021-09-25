library app_intl;

import 'package:flutter/widgets.dart';

part 'src/source_en.dart';
part 'src/source_fr.dart';
part 'src/delegate.dart';

/// The services that help to internationalize the application.
class AppIntl extends ChangeNotifier {
  /// Construct a new [AppIntl].
  factory AppIntl({required Locale locale}) {
    if (instance != null &&
        instance?._locale.languageCode != locale.languageCode) {
      instance?.setLocale(locale);
    }
    return instance ??= AppIntl._(locale);
  }

  AppIntl._(this._locale);

  /// The locale used to retrieve the current language code.
  Locale _locale;

  /// The unique available instance of the [AppIntl].
  static AppIntl? instance;

  ///
  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  /// Get the instance of [AppIntl] at the given context.
  static AppIntl? of(BuildContext context) =>
      Localizations.of<AppIntl>(context, AppIntl);

  /// Update the current locale.
  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  /// The localized value of << Home >>.
  String get home => _getIntlMessage(locale: _locale, key: 'home');

  /// The localized value of << Calendar >>.
  String get calendar => _getIntlMessage(
        locale: _locale,
        key: 'calendar',
      );

  /// The localized value of << Favorites >>.
  String get favorites => _getIntlMessage(
        locale: _locale,
        key: 'favorites',
      );

  /// The localized value of << translation >>.
  String get translation => _getIntlMessage(
        locale: _locale,
        key: 'translation',
      );

  /// The localized value of << Rate app >>.
  String get evaluate => _getIntlMessage(
        locale: _locale,
        key: 'evaluate',
      );

  /// Returns the localized value of << Share [lapp] >>.
  String share(Object lapp) => _getIntlMessage(
        locale: _locale,
        key: 'share',
        args: <Object>[lapp],
      );

  /// Returns the localized value of << Hey! here is a very interesting
  /// evangelistic sharing application 👉 [url] >>.
  String shareMsg(Object url) => _getIntlMessage(
        locale: _locale,
        key: 'shareMsg',
        args: <Object>[url],
      );

  /// The localized value of << Biblical calendar >>.
  String get appName => _getIntlMessage(
        locale: _locale,
        key: 'appName',
      );

  /// The localized value of << the application >>.
  String get lapp => _getIntlMessage(
        locale: _locale,
        key: 'lapp',
      );

  /// The localized value of << Verse >>.
  String get verse => _getIntlMessage(
        locale: _locale,
        key: 'verse',
      );

  /// The localized value of << No translation >>.
  String get noTranslation => _getIntlMessage(
        locale: _locale,
        key: 'noTranslation',
      );

  /// The localized value of << Please download at least one translation
  /// to access the application features >>.
  String get downloadLeastOneTranslate => _getIntlMessage(
        locale: _locale,
        key: 'downloadLeastOneTranslate',
      );

  /// The localized value of << Okay >>.
  String get ok => _getIntlMessage(
        locale: _locale,
        key: 'ok',
      );

  /// The localized value of << Confirmation of deletion >>.
  String get confirmDelete => _getIntlMessage(
        locale: _locale,
        key: 'confirmDelete',
      );

  /// The localized value of << Are you sure you want to delete
  /// the translation >>.
  String get reallyWantIt => _getIntlMessage(
        locale: _locale,
        key: 'reallyWantIt',
      );

  /// The localized value of << Delete >>.
  String get delete => _getIntlMessage(
        locale: _locale,
        key: 'delete',
      );

  /// The localized value of << Cancel >>.
  String get cancel => _getIntlMessage(
        locale: _locale,
        key: 'cancel',
      );

  /// Returns the localized value of << You have [count] translation[addS] >>.
  String youHaveXTranslation(Object count, Object addS) => _getIntlMessage(
        locale: _locale,
        key: 'youHaveXTranslation',
        args: <Object>[count, addS],
      );

  /// The localized value of << Add translation >>.
  String get addTranslation => _getIntlMessage(
        locale: _locale,
        key: 'addTranslation',
      );

  /// The localized value of << Default >>.
  String get def => _getIntlMessage(
        locale: _locale,
        key: 'def',
      );

  /// The localized value of << set as main translation >>.
  String get markAsPrincipal => _getIntlMessage(
        locale: _locale,
        key: 'markAsPrincipal',
      );

  /// The localized value of << favorites not found >>.
  String get favoriteNotFound => _getIntlMessage(
        locale: _locale,
        key: 'favoriteNotFound',
      );

  /// The localized value of << Text of the Day >>.
  String get textOfD => _getIntlMessage(
        locale: _locale,
        key: 'textOfD',
      );

  /// The localized value of << Monday >>.
  String get monday => _getIntlMessage(
        locale: _locale,
        key: 'monday',
      );

  /// The localized value of << Tuesday >>.
  String get tuesday => _getIntlMessage(
        locale: _locale,
        key: 'tuesday',
      );

  /// The localized value of << Wednesday >>.
  String get wednesday => _getIntlMessage(
        locale: _locale,
        key: 'wednesday',
      );

  /// The localized value of << Thursday >>.
  String get thursday => _getIntlMessage(
        locale: _locale,
        key: 'thursday',
      );

  /// The localized value of << Friday >>.
  String get friday => _getIntlMessage(
        locale: _locale,
        key: 'friday',
      );

  /// The localized value of << Saturday >>.
  String get saturday => _getIntlMessage(
        locale: _locale,
        key: 'saturday',
      );

  /// The localized value of << Sunday >>.
  String get sunday => _getIntlMessage(
        locale: _locale,
        key: 'sunday',
      );

  /// The localized value of << not found in the current translation. Please >>.
  String get notFoundInCurrentTranslation => _getIntlMessage(
        locale: _locale,
        key: 'notFoundInCurrentTranslation',
      );

  /// The localized value of << Select >>.
  String get select => _getIntlMessage(
        locale: _locale,
        key: 'select',
      );

  /// The localized value of << Or >>.
  String get or => _getIntlMessage(
        locale: _locale,
        key: 'or',
      );

  /// The localized value of << Download >>.
  String get download => _getIntlMessage(
        locale: _locale,
        key: 'download',
      );

  /// The localized value of << The appropriate translation >>.
  String get appropriateTranslation => _getIntlMessage(
        locale: _locale,
        key: 'appropriateTranslation',
      );

  /// The localized value of << Language >>.
  String get language => _getIntlMessage(
        locale: _locale,
        key: 'language',
      );

  /// The localized value of << Size >>.
  String get size => _getIntlMessage(
        locale: _locale,
        key: 'size',
      );

  /// The localized value of << Downloaded >>.
  String get downloaded => _getIntlMessage(
        locale: _locale,
        key: 'downloaded',
      );

  /// The localized value of << Downloading >>.
  String get downloading => _getIntlMessage(
        locale: _locale,
        key: 'downloading',
      );

  /// The localized value of << Update in progress >>.
  String get updating => _getIntlMessage(
        locale: _locale,
        key: 'updating',
      );

  /// The localized value of << Database update in progress >>.
  String get updatingDb => _getIntlMessage(
        locale: _locale,
        key: 'updatingDb',
      );

  /// The localized value of << Error >>.
  String get error => _getIntlMessage(
        locale: _locale,
        key: 'error',
      );

  /// The localized value of << Error while retrieving data. Please check
  /// your internet access or try again later. If the problem persists, >>.
  String get errorDownloadDataMsg => _getIntlMessage(
        locale: _locale,
        key: 'errorDownloadDataMsg',
      );

  /// The localized value of << Send a report >>.
  String get sendReport => _getIntlMessage(
        locale: _locale,
        key: 'sendReport',
      );

  /// The localized value of << The application № 099 fails to install
  /// the translation >>.
  String get reportSubject => _getIntlMessage(
        locale: _locale,
        key: 'reportSubject',
      );

  /// The localized value of << Enter a full description of your error >>.
  String get reportBody => _getIntlMessage(
        locale: _locale,
        key: 'reportBody',
      );

  /// The localized value of << Can't send report >>.
  String get reportCanSend => _getIntlMessage(
        locale: _locale,
        key: 'reportCanSend',
      );

  /// The localized value of << Next >>.
  String get next => _getIntlMessage(
        locale: _locale,
        key: 'next',
      );

  /// The localized value of << Ignore >>.
  String get ignore => _getIntlMessage(
        locale: _locale,
        key: 'ignore',
      );

  /// The localized value of << Start >>.
  String get start => _getIntlMessage(
        locale: _locale,
        key: 'start',
      );

  /// The localized value of << Save >>.
  String get save => _getIntlMessage(
        locale: _locale,
        key: 'save',
      );

  /// The localized value of << Daily reading >>.
  String get moduleCalendarHeader => _getIntlMessage(
        locale: _locale,
        key: 'moduleCalendarHeader',
      );

  /// The localized value of << The application offers daily verses from your
  /// community that you can read and share with your loved ones. >>.
  String get moduleCalendarContent => _getIntlMessage(
        locale: _locale,
        key: 'moduleCalendarContent',
      );

  /// The localized value of << Free access to several translations! >>.
  String get moduleBibleHeader => _getIntlMessage(
        locale: _locale,
        key: 'moduleBibleHeader',
      );

  /// The localized value of << In the "translations" menu, you have the
  /// possibility of downloading a translation or several translations
  /// according to your preferences. You also have the possibility of  making
  /// a filter: it is fast and efficient 😇 >>.
  String get moduleBibleContent => _getIntlMessage(
        locale: _locale,
        key: 'moduleBibleContent',
      );

  /// The localized value of << This application has been designed to allow
  /// - Any believing community to create and share publications with their
  /// followers.
  /// - Any family to improve awareness of speech.
  /// - Any person to better analyze and share the St scriptures >>.
  String get moduleWelcomeContent => _getIntlMessage(
        locale: _locale,
        key: 'moduleWelcomeContent',
      );

  /// The localized value of << Welcome! >>.
  String get moduleWelcomeHeader => _getIntlMessage(
        locale: _locale,
        key: 'moduleWelcomeHeader',
      );

  /// The localized value of << Please select your preferred language >>.
  String get selectPreferredLang => _getIntlMessage(
        locale: _locale,
        key: 'selectPreferredLang',
      );

  /// The localized value of << French >>.
  String get french => _getIntlMessage(
        locale: _locale,
        key: 'french',
      );

  /// The localized value of << English >>.
  String get english => _getIntlMessage(
        locale: _locale,
        key: 'english',
      );

  /// The localized value of << 1 Timothy >>.
  String get oneTimothy => _getIntlMessage(
        locale: _locale,
        key: 'oneTimothy',
      );

  /// The localized value of << Psalms >>.
  String get psalms => _getIntlMessage(
        locale: _locale,
        key: 'psalms',
      );

  /// The localized value of << Genesis >>.
  String get genesis => _getIntlMessage(
        locale: _locale,
        key: 'genesis',
      );

  /// The localized value of << Exodus >>.
  String get exodus => _getIntlMessage(
        locale: _locale,
        key: 'exodus',
      );

  /// The localized value of << Leviticus >>.
  String get leviticus => _getIntlMessage(
        locale: _locale,
        key: 'leviticus',
      );

  /// The localized value of << Numbers >>.
  String get numbers => _getIntlMessage(
        locale: _locale,
        key: 'numbers',
      );

  /// The localized value of << Deuteronomy >>.
  String get deuteronomy => _getIntlMessage(
        locale: _locale,
        key: 'deuteronomy',
      );

  /// The localized value of << Joshua >>.
  String get joshua => _getIntlMessage(
        locale: _locale,
        key: 'joshua',
      );

  /// The localized value of << Judges >>.
  String get judges => _getIntlMessage(
        locale: _locale,
        key: 'judges',
      );

  /// The localized value of << Ruth >>.
  String get ruth => _getIntlMessage(
        locale: _locale,
        key: 'ruth',
      );

  /// The localized value of << 1 Samuel >>.
  String get oneSamuel => _getIntlMessage(
        locale: _locale,
        key: 'oneSamuel',
      );

  /// The localized value of << 2 Samuel >>.
  String get twoSamuel => _getIntlMessage(
        locale: _locale,
        key: 'twoSamuel',
      );

  /// The localized value of << 1 Kings >>.
  String get oneKings => _getIntlMessage(
        locale: _locale,
        key: 'oneKings',
      );

  /// The localized value of << 2 Kings >>.
  String get twoKings => _getIntlMessage(
        locale: _locale,
        key: 'twoKings',
      );

  /// The localized value of << 1 Chronicles >>.
  String get oneChronicles => _getIntlMessage(
        locale: _locale,
        key: 'oneChronicles',
      );

  /// The localized value of << 2 Chronicles >>.
  String get twoChronicles => _getIntlMessage(
        locale: _locale,
        key: 'twoChronicles',
      );

  /// The localized value of << Ezra >>.
  String get ezra => _getIntlMessage(
        locale: _locale,
        key: 'ezra',
      );

  /// The localized value of << Nehemiah >>.
  String get nehemiah => _getIntlMessage(
        locale: _locale,
        key: 'nehemiah',
      );

  /// The localized value of << Esther >>.
  String get esther => _getIntlMessage(
        locale: _locale,
        key: 'esther',
      );

  /// The localized value of << Job >>.
  String get job => _getIntlMessage(
        locale: _locale,
        key: 'job',
      );

  /// The localized value of << Proverbs >>.
  String get proverbs => _getIntlMessage(
        locale: _locale,
        key: 'proverbs',
      );

  /// The localized value of << Ecclesiastes >>.
  String get ecclesiastes => _getIntlMessage(
        locale: _locale,
        key: 'ecclesiastes',
      );

  /// The localized value of << Song of Songs >>.
  String get songOfSongs => _getIntlMessage(
        locale: _locale,
        key: 'songOfSongs',
      );

  /// The localized value of << Isaiah >>.
  String get isaiah => _getIntlMessage(
        locale: _locale,
        key: 'isaiah',
      );

  /// The localized value of << Jeremiah >>.
  String get jeremiah => _getIntlMessage(
        locale: _locale,
        key: 'jeremiah',
      );

  /// The localized value of << Lamentations >>.
  String get lamentations => _getIntlMessage(
        locale: _locale,
        key: 'lamentations',
      );

  /// The localized value of << Ezekiel >>.
  String get ezekiel => _getIntlMessage(
        locale: _locale,
        key: 'ezekiel',
      );

  /// The localized value of << Daniel >>.
  String get daniel => _getIntlMessage(
        locale: _locale,
        key: 'daniel',
      );

  /// The localized value of << HHosea >>.
  String get hosea => _getIntlMessage(
        locale: _locale,
        key: 'hosea',
      );

  /// The localized value of << Joel >>.
  String get joel => _getIntlMessage(
        locale: _locale,
        key: 'joel',
      );

  /// The localized value of << Amos >>.
  String get amos => _getIntlMessage(
        locale: _locale,
        key: 'amos',
      );

  /// The localized value of << Obadiah >>.
  String get obadiah => _getIntlMessage(
        locale: _locale,
        key: 'obadiah',
      );

  /// The localized value of << Jonah >>.
  String get jonah => _getIntlMessage(
        locale: _locale,
        key: 'jonah',
      );

  /// The localized value of << Micah >>.
  String get micah => _getIntlMessage(
        locale: _locale,
        key: 'micah',
      );

  /// The localized value of << Nahum >>.
  String get nahum => _getIntlMessage(
        locale: _locale,
        key: 'nahum',
      );

  /// The localized value of << Habakkuk >>.
  String get habakkuk => _getIntlMessage(
        locale: _locale,
        key: 'habakkuk',
      );

  /// The localized value of << Zephaniah >>.
  String get zephaniah => _getIntlMessage(
        locale: _locale,
        key: 'zephaniah',
      );

  /// The localized value of << Haggai >>.
  String get haggai => _getIntlMessage(
        locale: _locale,
        key: 'haggai',
      );

  /// The localized value of << Zechariah >>.
  String get zechariah => _getIntlMessage(
        locale: _locale,
        key: 'zechariah',
      );

  /// The localized value of << Malachi >>.
  String get malachi => _getIntlMessage(
        locale: _locale,
        key: 'malachi',
      );

  /// The localized value of << Matthew >>.
  String get matthew => _getIntlMessage(
        locale: _locale,
        key: 'matthew',
      );

  /// The localized value of << Mark >>.
  String get mark => _getIntlMessage(
        locale: _locale,
        key: 'mark',
      );

  /// The localized value of << Luke >>.
  String get luke => _getIntlMessage(
        locale: _locale,
        key: 'luke',
      );

  /// The localized value of << John >>.
  String get john => _getIntlMessage(
        locale: _locale,
        key: 'john',
      );

  /// The localized value of << Acts >>.
  String get acts => _getIntlMessage(
        locale: _locale,
        key: 'acts',
      );

  /// The localized value of << Romans >>.
  String get romans => _getIntlMessage(
        locale: _locale,
        key: 'romans',
      );

  /// The localized value of << 1 Corinthians >>.
  String get oneCorinthians => _getIntlMessage(
        locale: _locale,
        key: 'oneCorinthians',
      );

  /// The localized value of << 2 Corinthians >>.
  String get twoCorinthians => _getIntlMessage(
        locale: _locale,
        key: 'twoCorinthians',
      );

  /// The localized value of << Galatians >>.
  String get galatians => _getIntlMessage(
        locale: _locale,
        key: 'galatians',
      );

  /// The localized value of << Ephesians >>.
  String get ephesians => _getIntlMessage(
        locale: _locale,
        key: 'ephesians',
      );

  /// The localized value of << Philippians >>.
  String get philippians => _getIntlMessage(
        locale: _locale,
        key: 'philippians',
      );

  /// The localized value of << Colossians >>.
  String get colossians => _getIntlMessage(
        locale: _locale,
        key: 'colossians',
      );

  /// The localized value of << 1 Thessalonians >>.
  String get oneThessalonians => _getIntlMessage(
        locale: _locale,
        key: 'oneThessalonians',
      );

  /// The localized value of << 2 Thessalonians >>.
  String get twoThessalonians => _getIntlMessage(
        locale: _locale,
        key: 'twoThessalonians',
      );

  /// The localized value of << 2 Timothy >>.
  String get twoTimothy => _getIntlMessage(
        locale: _locale,
        key: 'twoTimothy',
      );

  /// The localized value of << Titus >>.
  String get titus => _getIntlMessage(
        locale: _locale,
        key: 'titus',
      );

  /// The localized value of << Philemon >>.
  String get philemon => _getIntlMessage(
        locale: _locale,
        key: 'philemon',
      );

  /// The localized value of << Hebrews >>.
  String get hebrews => _getIntlMessage(
        locale: _locale,
        key: 'hebrews',
      );

  /// The localized value of << Jame >>.
  String get james => _getIntlMessage(
        locale: _locale,
        key: 'james',
      );

  /// The localized value of << 1 Peter >>.
  String get onePeter => _getIntlMessage(
        locale: _locale,
        key: 'onePeter',
      );

  /// The localized value of << 2 Peter >>.
  String get twoPeter => _getIntlMessage(
        locale: _locale,
        key: 'twoPeter',
      );

  /// The localized value of << 1 John >>.
  String get oneJohn => _getIntlMessage(
        locale: _locale,
        key: 'oneJohn',
      );

  /// The localized value of << 2 John >>.
  String get twoJohn => _getIntlMessage(
        locale: _locale,
        key: 'twoJohn',
      );

  /// The localized value of << 3 John >>.
  String get treeJohn => _getIntlMessage(
        locale: _locale,
        key: 'treeJohn',
      );

  /// The localized value of << Jude >>.
  String get jude => _getIntlMessage(
        locale: _locale,
        key: 'jude',
      );

  /// The localized value of << Revelation >>.
  String get revelation => _getIntlMessage(
        locale: _locale,
        key: 'revelation',
      );

  /// The localized value of << You can download the >>.
  String get youCanChoiceTranslateStart => _getIntlMessage(
        locale: _locale,
        key: 'youCanChoiceTranslateStart',
      );

  /// The localized value of << or >>.
  String get youCanChoiceTranslateMiddle => _getIntlMessage(
        locale: _locale,
        key: 'youCanChoiceTranslateMiddle',
      );

  /// The localized value of << version >>.
  String get youCanChoiceTranslateEnd => _getIntlMessage(
        locale: _locale,
        key: 'youCanChoiceTranslateEnd',
      );
}
