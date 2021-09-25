part of color_helper;

/// Class that bring more future to the class [MaterialColor]
class MaterialColorPlus extends MaterialColor {
  /// Construct a new [MaterialColorPlus].
  factory MaterialColorPlus(Color color) {
    final _MaterialColorPlus _temp = _MaterialColorPlus(color);
    return MaterialColorPlus._(_temp, _temp.material.value, _temp.swatch);
  }

  MaterialColorPlus._(this._backGenerator, int primary, Map<int, Color> swatch)
      : lightness = _backGenerator.getColorFromLight(980),
        darkness = _backGenerator.getColorFromLight(50),
        super(primary, swatch);

  final _MaterialColorPlus _backGenerator;

  /// The lightness representation of the current color.
  final Color lightness;

  /// The darkness  representation of the current color.
  final Color darkness;

  /// Returns the reversed brightness the current color.
  ///
  /// * [radius] The radius from the current brightness to the destination
  ///   brightness.
  ///     - minimum value: 70
  ///     - maximum value: 500
  /// * [relativeBrightnessResult] The state of the brightness of the returned
  ///   color relative to the brightness of the current color.
  Color reverseBrightness(
      {int radius = 500, Brightness? relativeBrightnessResult}) {
    final _MaterialColorPlus currentColor = _backGenerator;
    final int space = radius.clamp(0, 999) * 2;
    final int lightLevel =
        (currentColor.luminance * 1000).clamp(0, 999).toInt();
    relativeBrightnessResult ??=
        lightLevel >= 500 ? Brightness.dark : Brightness.light;

    int targetLight;
    switch (relativeBrightnessResult) {
      case Brightness.dark:
        targetLight = (lightLevel - space).clamp(0, 999);
        break;
      case Brightness.light:
        targetLight = (lightLevel + space).clamp(0, 999);
        break;
    }

    return currentColor.getColorFromLight(targetLight);
  }
}

class _MaterialColorPlus {
  _MaterialColorPlus(this.color) {
    final List<double> hsl =
        ColorUtil.rgbToHsl(color.red, color.green, color.blue);
    hue = hsl[0];
    saturation = hsl[1];
    luminance = hsl[2];
  }

  final Color color;
  late double hue, saturation, luminance;

  Map<int, Color>? _swatch;

  Map<int, Color> get swatch => _swatch ??= <int, Color>{
        50: getColorFromLight(950),
        100: getColorFromLight(900),
        200: getColorFromLight(800),
        300: getColorFromLight(700),
        400: getColorFromLight(600),
        500: getColorFromLight(500),
        600: getColorFromLight(400),
        700: getColorFromLight(300),
        800: getColorFromLight(200),
        900: getColorFromLight(100),
      };

  Color getColorFromLight(int intensity) {
    final List<int> aux =
        ColorUtil.hslToRgb(hue, saturation, intensity.clamp(0, 1000) / 1000);
    return Color.fromARGB(255, aux[0], aux[1], aux[2]);
  }

  MaterialColor get material => MaterialColor(color.value, swatch);
}
