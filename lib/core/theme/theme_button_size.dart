import 'dart:ui';

import 'package:flutter/material.dart';

enum ButtonSize {
  h31,
  h55,
}

extension ButtonSizeExtension on ButtonSize {
  double get toDouble {
    switch (this) {
      case ButtonSize.h31:
        return 31.0;
      case ButtonSize.h55:
        return 55.0;
    }
  }

  TextStyle textStyle(ThemeData themeData) {
    switch (this) {
      case ButtonSize.h31:
        return themeData.textTheme.headlineSmall!;
      case ButtonSize.h55:
        return themeData.textTheme.titleLarge!;
    }
  }

  EdgeInsetsGeometry get buttonPadding {
    double verticalPadding = 0.0;
    switch (this) {
      case ButtonSize.h31:
        verticalPadding = 6;
      case ButtonSize.h55:
        verticalPadding = 19;
    }

    return EdgeInsets.only(
      top: verticalPadding,
      bottom: verticalPadding,
    );
  }
}
