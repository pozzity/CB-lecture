import 'dart:io';
import 'package:flutter/foundation.dart';

import 'main.dart' as original_main;

// This file is the default main entry-point for go-flutter application.
void main() {
  if(!Platform.isAndroid || !Platform.isIOS){
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
  original_main.main();
}
