import 'package:flutter_test/flutter_test.dart';

import 'package:cb_lecture/main.dart';

void main() {
  group('Componenent Demo ->', () {
    testWidgets('Check if the demo text show up.', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const CBLectureApp());

      // Verify that our counter starts at 0.
      expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    });
  });
}
