import 'dart:ui' show Color;
import 'package:cb_lecture/utils/color_helper/color_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const int radius = 25;
  const int convertionLost = 2;

  group('MaterialColorPlus::reverseBrightness >', () {
    test(
        'Check for dark color the validity of the light'
        ' level of the returned color', () {
      const double colorLight = 30;
      final List<int> rgb = ColorUtil.hslToRgb(.35, .7, colorLight / 100);
      final Color genColor = Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);
      final Color newColor =
          MaterialColorPlus(genColor).reverseBrightness(radius: 250);
      final int ligthLevel =
          (ColorUtil.rgbToHsl(newColor.red, newColor.green, newColor.blue)[2] *
                  100)
              .toInt();

      final bool isValidLigthLevel =
          (ligthLevel - (colorLight + radius * 2)).abs() < convertionLost;
      expect(isValidLigthLevel, true);
    });

    test(
        'Check for light color the validity of the light level of'
        ' the returned color', () {
      const double colorLight = 70;
      final List<int> rgb = ColorUtil.hslToRgb(.35, .7, colorLight / 100);
      final Color genColor = Color.fromARGB(255, rgb[0], rgb[1], rgb[2]);
      final Color newColor =
          MaterialColorPlus(genColor).reverseBrightness(radius: 250);
      final int ligthLevel =
          (ColorUtil.rgbToHsl(newColor.red, newColor.green, newColor.blue)[2] *
                  100)
              .toInt();

      final bool isValidLigthLevel =
          (ligthLevel - (colorLight - radius * 2)).abs() < convertionLost;
      expect(isValidLigthLevel, true);
    });
  });
}
