import 'package:flutter/material.dart';

import 'theme/colors_theme.dart';
import 'theme/decorations_theme.dart';
import 'theme/gradients_theme.dart';
import 'theme/icons_theme.dart';
import 'theme/images_theme.dart';
import 'theme/shadows_theme.dart';
import 'theme/sizes_theme.dart';
import 'theme/text_styles_theme.dart';

class AppTheme {
  static ColorsTheme colors = ColorsTheme();
  static DecorationsTheme decorations = DecorationsTheme();
  static FontStylesTheme fonts = FontStylesTheme();
  static GradientsTheme gradients = GradientsTheme();
  static IconsTheme icons = IconsTheme();
  static ImagesTheme images = ImagesTheme();
  static SizesTheme sizes = SizesTheme();
  static ShadowsTheme shadows = ShadowsTheme();

  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: colors.primary,
      centerTitle: true,
      elevation: 0,
    ),
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    fontFamily: 'Barlow',
    focusColor: colors.primary,
    // primarySwatch: colorPrimaryMaterial,
    splashColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
        // labelStyle: textStyleBody,
        ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: colors.primary,
      selectionHandleColor: colors.primary,
      // cursorColor: colorPrimary,
      // selectionColor: colorPrimary,
      // selectionHandleColor: colorPrimary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
