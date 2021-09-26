import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app_text_controller.dart';
import 'app_text_model.dart';

/// A widget that display a text base on our preference data.
class AppText extends StatelessWidget {
  /// Construct a new [AppText].
  const AppText(
      {required this.text,
      this.textStyle,
      Key? key,
      this.maxLines,
      this.textScaleFactor,
      this.overflow,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.textMode})
      : super(key: key);

  /// The text to display.
  final String text;

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

  /// The display mode of the text.
  final AppTextMode? textMode;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was
  /// unlimited horizontal space.
  final bool? softWrap;

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<AppTextController>(
        create: (_) => AppTextController(
          text: text,
          textStyle: textStyle ?? DefaultTextStyle.of(context).style,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: softWrap,
          textAlign: textAlign,
          textDirection: textDirection,
          textMode: textMode,
          textScaleFactor: textScaleFactor,
        ),
        child: _AppTextView(),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(IntProperty('maxLines', maxLines))
      ..add(DoubleProperty('textScaleFactor', textScaleFactor))
      ..add(EnumProperty<TextOverflow?>('overflow', overflow))
      ..add(EnumProperty<TextAlign?>('textAlign', textAlign))
      ..add(DiagnosticsProperty<bool?>('softWrap', softWrap))
      ..add(DiagnosticsProperty<AppTextMode>('textMode', textMode))
      ..add(EnumProperty<TextDirection?>('textDirection', textDirection));
  }
}

class _AppTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTextController appTextController =
        context.read<AppTextController>();
    final AppTextModel appTextModel = appTextController.data;
    return Text(
      appTextModel.text,
      style: appTextModel.textStyle,
      maxLines: appTextModel.maxLines,
      textScaleFactor: appTextModel.textScaleFactor,
      overflow: appTextModel.overflow,
      textAlign: appTextModel.textAlign,
      softWrap: appTextModel.softWrap,
      textDirection: appTextModel.textDirection,
    );
  }
}
