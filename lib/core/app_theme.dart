import 'package:flutter/material.dart';

import 'theme/theme_color.dart';

export 'theme/theme_color.dart';
export 'theme/theme_decoration.dart';
export 'theme/theme_gradient.dart';
export 'theme/theme_icon.dart';
export 'theme/theme_image.dart';
export 'theme/theme_shadow.dart';
export 'theme/theme_size.dart';
export 'theme/theme_sized_box.dart';
export 'theme/theme_text_field.dart';
export 'theme/theme_text_style.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColor.primary,
      centerTitle: true,
      elevation: 0,
    ),
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    fontFamily: 'Barlow',
    focusColor: ThemeColor.primary,
    // primarySwatch: colorPrimaryMaterial,
    splashColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
        // labelStyle: textStyleBody,
        ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: ThemeColor.primary,
      selectionHandleColor: ThemeColor.primary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
