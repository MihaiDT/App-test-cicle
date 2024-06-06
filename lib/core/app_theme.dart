import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_text_style.dart';

import 'package:lines/core/theme/theme_color.dart';

export 'theme/text_wrapper.dart';
export 'theme/theme_button_size.dart';
export 'theme/theme_color.dart';
export 'theme/theme_decoration.dart';
export 'theme/theme_decoration_images.dart';
export 'theme/theme_edge_insets.dart';
export 'theme/theme_gradient.dart';
export 'theme/theme_icon.dart';
export 'theme/theme_image.dart';
export 'theme/theme_shader_text_wrapper.dart';
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
    textTheme: const TextTheme(
      displayLarge: ThemeTextStyle.displayLarge,
      displayMedium: ThemeTextStyle.displayMedium,
      displaySmall: ThemeTextStyle.displaySmall,
      headlineLarge: ThemeTextStyle.headlineLarge,
      headlineMedium: ThemeTextStyle.headlineMedium,
      headlineSmall: ThemeTextStyle.headlineSmall,
      bodyLarge: ThemeTextStyle.bodyLarge,
      bodyMedium: ThemeTextStyle.bodyMedium,
      bodySmall: ThemeTextStyle.bodySmall,
      labelSmall: ThemeTextStyle.labelSmall,
      titleLarge: ThemeTextStyle.titleLarge,
      titleMedium: ThemeTextStyle.titleMedium,
      titleSmall: ThemeTextStyle.titleSmall,
      labelLarge: ThemeTextStyle.labelLarge,
      labelMedium: ThemeTextStyle.labelMedium,
    ),
  );
}
