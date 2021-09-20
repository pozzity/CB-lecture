import 'package:flutter/widgets.dart';

import 'app_text_model.dart';

/// A class that provide data to our app_text_view.
class AppTextController extends ChangeNotifier {
  /// Construct a new [AppTextController].
  AppTextController(
      {required String text,
      TextStyle textStyle = const TextStyle(),
      int? maxLines,
      double? textScaleFactor,
      TextOverflow? overflow = TextOverflow.ellipsis,
      TextAlign? textAlign = TextAlign.left,
      TextDirection? textDirection = TextDirection.ltr,
      bool? softWrap = false,
      AppTextMode? textMode = AppTextMode.body})
      : _data = AppTextModel(
          textDirection,
          maxLines: maxLines,
          text: text,
          textScaleFactor: textScaleFactor,
          overflow: overflow,
          textAlign: textAlign,
          softWrap: softWrap,
          textStyle: textStyle.copyWith(
            fontSize: textMode?.fontSize,
            fontWeight: textMode?.fontWeight,
          ),
        );

  final AppTextModel _data;

  /// The data used by our view.
  AppTextModel get data => _data;
}
