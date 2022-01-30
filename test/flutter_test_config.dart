import 'dart:async';
import 'dart:io';

import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) =>
    GoldenToolkit.runWithConfiguration(
      () async {
        await loadAppFonts();
        return testMain();
      },
      config: GoldenToolkitConfiguration(
          skipGoldenAssertion: () => !Platform.isLinux),
    );
