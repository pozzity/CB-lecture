import 'dart:ui' show Color;

import 'package:cb_lecture/utils/color_helper/color_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Color baseColor = Color(0xff238C83);
  const String baseColorHex = '238C83';
  const String baseColorHexWithAlpha = '238C83ff';
  const String baseColorHexWithSymbolAndAlpha = '#238C83ff';
  const List<int> baseColorH360S100V100 = <int>[175, 75, 55];
  const List<int> baseColorH360S100L100 = <int>[175, 60, 34];
  const List<int> baseColorRGB = <int>[35, 140, 131];
  const int convertionLost = 2;
  group('ColorUtil::hex2Color >', () {
    test('Check invalid hexadecimal.', () {
      final Color? parsedColor1 = ColorUtil.hex2Color('aa'),
          parsedColor2 = ColorUtil.hex2Color('12345'),
          parsedColor3 = ColorUtil.hex2Color('1234567'),
          parsedColor4 = ColorUtil.hex2Color('123456789');

      expect(parsedColor1, null);
      expect(parsedColor2, null);
      expect(parsedColor3, null);
      expect(parsedColor4, null);
    });
    test('Check valid hexadecimal.', () {
      final bool colorIsvalid1 = ColorUtil.hex2Color('#aaa') != null,
          colorIsvalid2 = ColorUtil.hex2Color('#1234') != null,
          colorIsvalid3 = ColorUtil.hex2Color('#123456') != null,
          colorIsvalid4 = ColorUtil.hex2Color('#12345678') != null;

      expect(colorIsvalid1, true);
      expect(colorIsvalid2, true);
      expect(colorIsvalid3, true);
      expect(colorIsvalid4, true);
    });

    test('Check the validity of the returned color.', () {
      final Color? parsedColor1 = ColorUtil.hex2Color(baseColorHex);
      final Color? parsedColor2 = ColorUtil.hex2Color(baseColorHexWithAlpha);
      final Color? parsedColor3 =
          ColorUtil.hex2Color(baseColorHexWithSymbolAndAlpha);

      final bool theyMatch = parsedColor1?.value == parsedColor2?.value &&
          parsedColor2?.value == parsedColor3?.value;

      expect(theyMatch, true);
      expect(parsedColor1?.value, baseColor.value);
    });
  });

  group('ColorUtil::rgbToHsl >', () {
    test('Check the validity of the returned hsl', () {
      final List<double> parsedHSL =
          ColorUtil.rgbToHsl(baseColorRGB[0], baseColorRGB[1], baseColorRGB[2]);

      final bool hasValidLenght = parsedHSL.length == 3;
      expect(hasValidLenght, true);

      final bool hasValidData =
          (parsedHSL[0] * 360 - baseColorH360S100L100[0]).abs() <=
                  convertionLost &&
              (parsedHSL[1] * 100 - baseColorH360S100L100[1]).abs() <=
                  convertionLost &&
              (parsedHSL[2] * 100 - baseColorH360S100L100[2]).abs() <=
                  convertionLost;
      expect(hasValidData, true);
    });
  });
  group('ColorUtil::rgbToHsv >', () {
    test('Check the validity of the returned hsv', () {
      final List<double> parsedHSV =
          ColorUtil.rgbToHsv(baseColorRGB[0], baseColorRGB[1], baseColorRGB[2]);

      final bool hasValidLenght = parsedHSV.length == 3;
      expect(hasValidLenght, true);

      final bool hasValidData =
          (parsedHSV[0] * 360 - baseColorH360S100V100[0]).abs() <=
                  convertionLost &&
              (parsedHSV[1] * 100 - baseColorH360S100V100[1]).abs() <=
                  convertionLost &&
              (parsedHSV[2] * 100 - baseColorH360S100V100[2]).abs() <=
                  convertionLost;
      expect(hasValidData, true);
    });
  });
  group('ColorUtil::hslToRgb >', () {
    test('Check the validity of the returned rgb', () {
      final List<int> parsedRGB = ColorUtil.hslToRgb(
          baseColorH360S100L100[0] / 360,
          baseColorH360S100L100[1] / 100,
          baseColorH360S100L100[2] / 100);

      final bool hasValidLenght = parsedRGB.length == 3;
      expect(hasValidLenght, true);

      final bool hasValidData =
          (parsedRGB[0] - baseColorRGB[0]).abs() <= convertionLost &&
              (parsedRGB[1] - baseColorRGB[1]).abs() <= convertionLost &&
              (parsedRGB[2] - baseColorRGB[2]).abs() <= convertionLost;
      expect(hasValidData, true);
    });
  });
  group('ColorUtil::hsvToRgb >', () {
    test('Check the validity of the returned rgb', () {
      final List<int> parsedRGB = ColorUtil.hsvToRgb(
          baseColorH360S100V100[0] / 360,
          baseColorH360S100V100[1] / 100,
          baseColorH360S100V100[2] / 100);

      final bool hasValidLenght = parsedRGB.length == 3;
      expect(hasValidLenght, true);

      final bool hasValidData =
          (parsedRGB[0] - baseColorRGB[0]).abs() <= convertionLost &&
              (parsedRGB[1] - baseColorRGB[1]).abs() <= convertionLost &&
              (parsedRGB[2] - baseColorRGB[2]).abs() <= convertionLost;
      expect(hasValidData, true);
    });
  });
}
