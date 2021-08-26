import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Demo test ->', () {
    test('type check', () {
      const int integer = 0;
      const num number = 0;
      expect(integer, number);
    });
  });
}
