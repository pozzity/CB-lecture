import 'package:cb_lecture/utils/app_intl/app_intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Locale frLocale = Locale('fr');
  const Locale enLocale = Locale('en');
  group('App internalization >', () {
    test('retrieve localized string on `fr` locale', () {
      final AppIntl intl = AppIntl(locale: frLocale);
      final String text = intl.appName;
      expect(text, 'Calendrier biblique');
    });
    test('retrieve localized string on `en` Locale', () {
      final AppIntl intl = AppIntl(locale: enLocale);
      final String text = intl.appName;
      expect(text, 'Biblical calendar');
    });
    test('retrieve localized parametered string on `en` Locale', () {
      final AppIntl intl = AppIntl(locale: enLocale);
      final String text = intl.share(intl.appName);
      final String text2 = intl.youHaveXTranslation(3, 's');

      expect(text, 'Share Biblical calendar');
      expect(text2, 'You have 3 translations');
    });
    test('retrieve localized parametered string on `fr` Locale', () {
      final AppIntl intl = AppIntl(locale: frLocale);
      final String text = intl.share(intl.appName);
      final String text2 = intl.youHaveXTranslation(5, 's');

      expect(text, 'Partager Calendrier biblique');
      expect(text2, 'Vous possédez 5 traductions');
    });
  });
}
