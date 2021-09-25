part of '../app_intl.dart';

const Locale _en = Locale.fromSubtags(languageCode: 'en');
const Locale _fr = Locale.fromSubtags(languageCode: 'fr');

/// The Map between Locale an attached resources.
final Map<Locale, Map<String, String>> _availableResource =
    <Locale, Map<String, String>>{
  _en: _sourceEn,
  _fr: _sourceFr,
};

const Locale _defaultLocale = _en;

/// A factory for a set of localized resources of type [AppIntl],
/// to be loaded by a [Localizations] widget.
class AppLocalizationDelegate extends LocalizationsDelegate<AppIntl> {
  /// Construct a new [AppLocalizationDelegate].
  const AppLocalizationDelegate();

  /// Getter for the locale languages code we have chosen
  List<Locale> get supportedLocales => _availableResource.keys.toList();

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  /// Start loading the resources for `locale`. The returned future completes
  /// when the resources have finished loading.
  ///
  /// It's assumed that the this method will return an object that contains
  /// a collection of related resources (typically defined with one method per
  /// resource). The object will be retrieved with [Localizations.of].
  // TODO(Tadjaur): Add database support when loading resource, https://github.com/pozzity/cb_lecture/issues/55
  @override
  Future<AppIntl> load(Locale locale) async => AppIntl(locale: locale);

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

String _getIntlMessage(
    {required Locale locale, required String key, List<Object>? args}) {
  final Locale storedLocale = _availableResource.keys.firstWhere(
      (Locale item) => item.languageCode == locale.languageCode,
      orElse: () => _defaultLocale);
  String value = _availableResource[storedLocale]?[key] ??
      _availableResource[_defaultLocale]?[key] ??
      key;
  int index = 0;
  while (args != null && args.length > index) {
    final Match? match = RegExp(r'\{[A-Za-z0-9_]*\}').firstMatch(value);
    if (match == null) {
      break;
    }
    value = value.substring(0, match.start) +
        args[index].toString() +
        value.substring(match.end, value.length);
    index++;
  }
  return value;
}
