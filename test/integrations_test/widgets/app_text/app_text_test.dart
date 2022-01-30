import 'package:cb_lecture/widgets/app_text/app_text_model.dart';
import 'package:cb_lecture/widgets/app_text/app_text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  /// Test on header size
  final Column testOnHeaderSize =
      Column(mainAxisSize: MainAxisSize.min, children: const <AppText>[
    AppText(text: 'Hello World', textMode: AppTextMode.extraheader),
    AppText(text: 'Hello World', textMode: AppTextMode.header),
    AppText(text: 'Hello World', textMode: AppTextMode.subHeader),
    AppText(text: 'Hello World', textMode: AppTextMode.subHeader2),
    AppText(text: 'Hello World', textMode: AppTextMode.body),
    AppText(text: 'Hello World', textMode: AppTextMode.body2),
    AppText(text: 'Hello World', textMode: AppTextMode.note),
  ]);

  /// Test on custom color
  final Column testOnCustomColor =
      Column(mainAxisSize: MainAxisSize.min, children: const <AppText>[
    AppText(
        text: 'Hello World',
        textMode: AppTextMode.extraheader,
        color: Colors.green),
    AppText(
        text: 'Hello World', textMode: AppTextMode.header, color: Colors.red),
    AppText(
        text: 'Hello World',
        textMode: AppTextMode.subHeader,
        color: Colors.yellow),
    AppText(
        text: 'Hello World',
        textMode: AppTextMode.subHeader2,
        color: Colors.green),
    AppText(text: 'Hello World', textMode: AppTextMode.body, color: Colors.red),
    AppText(
        text: 'Hello World', textMode: AppTextMode.body2, color: Colors.yellow),
  ]);

  /// with custom font and custom color
  final Column testOnFontAndColor =
      Column(mainAxisSize: MainAxisSize.min, children: const <AppText>[
    AppText(
        text: 'Hello World',
        textMode: AppTextMode.note,
        fontWeight: FontWeight.bold,
        color: Colors.pink),
  ]);

  /// with custom font and custom color and custom style
  final Column testOnCustomStyle =
      Column(mainAxisSize: MainAxisSize.min, children: const <AppText>[
    AppText(
        text: 'Hello World',
        textMode: AppTextMode.note,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
        textStyle: TextStyle(
            backgroundColor: Colors.red,
            fontStyle: FontStyle.italic,
            color: Colors.pink)),
  ]);
  testGoldens('App Text Golden', (WidgetTester tester) async {
    final GoldenBuilder builder = GoldenBuilder.column()
      ..addScenario('Test on header size', testOnHeaderSize)
      ..addScenario('Test on header size', testOnCustomColor)
      ..addScenario('Test on header size', testOnFontAndColor)
      ..addScenario('Test on header size', testOnCustomStyle);
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'app_text');
  });
}
