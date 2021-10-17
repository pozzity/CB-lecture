import 'package:flutter/widgets.dart';

import 'app_text_model.dart';

/// A class that provide data to our app_text_view.
class AppTextController extends ChangeNotifier {
  /// Construct a new [AppTextController].
  AppTextController(
      {required String text,
      TextStyle? textStyle,
      int? maxLines,
      double? textScaleFactor,
      TextOverflow? overflow = TextOverflow.ellipsis,
      TextAlign? textAlign = TextAlign.left,
      TextDirection? textDirection = TextDirection.ltr,
      bool? softWrap = false,
      AppTextMode? textMode = AppTextMode.body,
      FontWeight? fontWeigth,
      Color? color})
      : _data = AppTextModel(
          textDirection,
          maxLines: maxLines,
          text: text,
          textScaleFactor: textScaleFactor,
          overflow: overflow,
          textAlign: textAlign,
          softWrap: softWrap,
          textStyle: _computeTextStyle(
            customStyle: textStyle,
            textMode: textMode,
            fontWeigth: fontWeigth,
            color: color,
          ),
        );

  final AppTextModel _data;

  /// The data used by our view.
  AppTextModel get data => _data;

  static TextStyle _computeTextStyle(
      {TextStyle? customStyle,
      AppTextMode? textMode,
      FontWeight? fontWeigth,
      Color? color}) {
    customStyle ??= const TextStyle();
    return customStyle.copyWith(
      fontSize: textMode?.fontSize,
      fontWeight: fontWeigth ?? textMode?.fontWeight,
      color: color,
    );
  }
}
