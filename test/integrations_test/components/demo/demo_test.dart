import 'package:flutter_test/flutter_test.dart';

import 'package:cb_lecture/main.dart';

void main() {
  group('Componenent Demo ->', () {
    testWidgets('Check if the demo text show up.', (WidgetTester tester) async {
      const CBLectureApp app = CBLectureApp();
      // Build our app and trigger a frame.
      await tester.pumpWidget(app);
      await tester.pumpFrames(app, const Duration(seconds: 1));
      expect(find.text('Biblical calendar'), findsOneWidget);
    });
  });
}
