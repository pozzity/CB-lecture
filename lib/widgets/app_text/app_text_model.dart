import 'package:flutter/rendering.dart';

/// A model representation of our AppStyle widget.
class AppTextModel {
  /// Construct a new [AppTextModel].
  AppTextModel(this.textDirection,
      {required this.textStyle,
      required this.maxLines,
      required this.text,
      required this.textScaleFactor,
      required this.overflow,
      required this.textAlign,
      required this.softWrap});

  /// The style to use for this text if non-null.
  final TextStyle? textStyle;

  /// An optional maximum number of lines for the text to span, wrapping
  /// if necessary.
  ///
  /// If the text exceeds the given number of lines,
  /// it will be truncated according to [overflow].
  final int? maxLines;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was
  /// unlimited horizontal space.
  final bool? softWrap;

  /// The text to display.
  final String text;

  /// Returns the new instance of [AppTextModel] with a shalow copy of
  /// it's property.
  AppTextModel copyWith(
          {String? text,
          TextStyle? textStyle,
          int? maxLines,
          double? textScaleFactor,
          TextOverflow? overflow,
          TextAlign? textAlign,
          TextDirection? textDirection,
          bool? softWrap,
          AppTextMode? textMode}) =>
      AppTextModel(textDirection ?? this.textDirection,
          textStyle: textStyle ?? this.textStyle,
          maxLines: maxLines ?? this.maxLines,
          text: text ?? this.text,
          textScaleFactor: textScaleFactor ?? this.textScaleFactor,
          overflow: overflow ?? this.overflow,
          textAlign: textAlign ?? this.textAlign,
          softWrap: softWrap ?? this.softWrap);
}

/// The set of style mode to display.
class AppTextMode {
  const AppTextMode._(this.fontSize, this.fontWeight);

  /// The font size of the selected mode.
  final double fontSize;

  /// The font weight of the selected mode.
  final FontWeight fontWeight;

  /// The large header display mode for document like's title.
  static const AppTextMode extraheader = AppTextMode._(25, FontWeight.bold);

  /// The header display mode that can be use for title bar.
  static const AppTextMode header = AppTextMode._(21, FontWeight.w600);

  /// The header display mode that can be use for dialog.
  static const AppTextMode subHeader = AppTextMode._(19, FontWeight.w600);

  /// The header display mode that can be use for appbar title.
  static const AppTextMode subHeader2 = AppTextMode._(17, FontWeight.w600);

  /// The default mode to display for any content.
  static const AppTextMode body = AppTextMode._(15, FontWeight.w500);

  /// The mode to display for smallest text
  static const AppTextMode body2 = AppTextMode._(13.5, FontWeight.w300);

  /// The mode to display for text like quote or small note.
  static const AppTextMode note = AppTextMode._(12, FontWeight.w200);
}
