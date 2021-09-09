import 'package:flutter/material.dart';

import 'color_helper.dart';

/// Class that bring more future to the class [MaterialColor]
class MaterialColorPlus extends MaterialColor {
  /// Construct a new [MaterialColorPlus].
  factory MaterialColorPlus(Color color) {
    final _MaterialColorPlus _temp = _MaterialColorPlus(color);
    return MaterialColorPlus._(_temp, _temp.material.value, _temp.swatch);
  }

  MaterialColorPlus._(this._backGenerator, int primary, Map<int, Color> swatch)
      : lightness = _backGenerator.rgb(20),
        darkness = _backGenerator.rgb(950),
        super(primary, swatch);

  final _MaterialColorPlus _backGenerator;

  /// Represents the lightness and the darkness representation
  /// of the current color.
  final Color lightness, darkness;

  /// Returns the reversed brightness of this color.
  Color reverseBrightness({Color? target, Brightness? brightness}) {
    _MaterialColorPlus sColor, dColor;
    sColor = _backGenerator;
    if (target == null) {
      dColor = sColor;
    } else if (target is MaterialColorPlus) {
      dColor = target._backGenerator;
    } else {
      dColor = _MaterialColorPlus(target);
    }
    final double distance = (dColor._luminance - sColor._luminance) * 100;
    final Color? _lightness = sColor._luminance * 1000 > 700
        ? null
        : dColor.rgb(
            (1000 - 300 - (sColor._luminance * 1000).clamp(0, 700)).toInt());
    final Color? _darkness = sColor._luminance * 1000 < 300
        ? null
        : dColor.rgb(
            (1000 + 300 - (sColor._luminance * 1000).clamp(300, 1000)).toInt());
    if (distance.abs() >= 30) {
      if (brightness == Brightness.light && distance.isNegative) {
        return _lightness ?? dColor.color;
      }
      if (brightness == Brightness.dark && !distance.isNegative) {
        return _darkness ?? dColor.color;
      }
      return dColor.color;
    } else {
      if (brightness == Brightness.light) {
        return _lightness ?? _darkness ?? dColor.color;
      }
      return _darkness ?? _lightness ?? dColor.color;
    }
  }
}

class _MaterialColorPlus {
  _MaterialColorPlus(this.color) {
    final List<double> hsl =
        ColorHelper.rgbToHsl(color.red, color.green, color.blue);
    _hue = hsl[0];
    _saturation = hsl[1];
    _luminance = hsl[2];
  }

  final Color color;
  late double _hue, _saturation, _luminance;

  Map<int, Color>? _swatch;

  Map<int, Color> get swatch => _swatch ??= <int, Color>{
        50: rgb(50),
        100: rgb(100),
        200: rgb(200),
        300: rgb(300),
        400: rgb(400),
        500: rgb(500),
        600: rgb(600),
        700: rgb(700),
        800: rgb(800),
        900: rgb(900),
      };

  Color rgb(int swatch) {
    final List<int> aux =
        ColorHelper.hslToRgb(_hue, _saturation, (1000 - swatch) / 1000);
    return Color.fromARGB(255, aux[0], aux[1], aux[2]);
  }

  MaterialColor get material => MaterialColor(color.value, swatch);
}
