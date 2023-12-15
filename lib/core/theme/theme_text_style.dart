import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lines/core/app_theme.dart';

class ThemeTextStyle {
  static const weightMedium = FontWeight.w500;
  static const weightRegular = FontWeight.w400;
  static const weightSemibold = FontWeight.w600;
  static const weightBold = FontWeight.w700;
  static const weightExtraBold = FontWeight.w900;

  static TextStyle largeLight = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: weightMedium,
    height: 1.1,
  );

  static TextStyle largeDark = largeLight.copyWith(color: ThemeColor.primary);

  static TextStyle mediumLight = const TextStyle(
    color: Colors.white,
    fontSize: 16.5,
    fontWeight: weightMedium,
    height: 1.4,
  );
  static TextStyle mediumDark = mediumLight.copyWith(color: ThemeColor.primary);

  static TextStyle bodyLight = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle bodyDark = bodyLight.copyWith(color: ThemeColor.primary);

  static TextStyle bodySmallLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 13,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle bodySmallDark =
      bodySmallLight.copyWith(color: ThemeColor.primary);

  static TextStyle boldSmallDark =
      bodySmallDark.copyWith(fontWeight: weightBold);
  static TextStyle boldSmallLight =
      bodySmallLight.copyWith(fontWeight: weightBold);

  static TextStyle button = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: weightSemibold,
    height: 1.4,
  );

  static TextStyle buttonSmall = button.copyWith(
    fontSize: 12,
    height: 1.2,
  );

  static TextStyle linkLight = const TextStyle(
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1,
    fontSize: 14,
    fontWeight: weightBold,
    height: 1.4,
  );

  static TextStyle linkDark = linkLight.copyWith(color: ThemeColor.primary);

  static TextStyle labelLight = const TextStyle(
    color: Colors.white,
    fontSize: 11.5,
    fontWeight: weightBold,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle labelDark = labelLight.copyWith(color: ThemeColor.primary);

  static TextStyle placeholderLight = const TextStyle(
    color: ThemeColor.whiteDark,
    fontSize: 11.5,
    fontWeight: weightSemibold,
    letterSpacing: 1.1,
  );

  static TextStyle placeholderDark =
      placeholderLight.copyWith(color: ThemeColor.primary);

  static TextStyle calendarMonth = const TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightSemibold,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle calendarWeekDay = const TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightMedium,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle ctaLight = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle ctaDark = ctaLight.copyWith(color: ThemeColor.primary);

  static TextStyle quizSelectDark = const TextStyle(
    height: 1.4,
    letterSpacing: 2.0,
    fontSize: 12,
    color: ThemeColor.darkBlue,
    fontWeight: weightBold,
  );

  static TextStyle welcomeQuizMultipleSelectionLight = GoogleFonts.barlow(
    height: 1.4,
    fontSize: 14,
    color: Colors.white,
    fontWeight: weightMedium,
  );

  static TextStyle welcomeQuizMultipleSelectionDarkPink = welcomeQuizMultipleSelectionLight.copyWith(color: ThemeColor.brightPink);
}

class NewThemeTextStyle {
  static const weightRegular = FontWeight.w400;
  static const weightMedium = FontWeight.w500;

  static const weightSemibold = FontWeight.w600;
  static const weightBold = FontWeight.w700;
  static const weightExtraBold = FontWeight.w900;
  static const TextStyle displayLarge = TextStyle(
    fontSize: 24,
    fontWeight: weightExtraBold,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 24,
    fontWeight: weightMedium,
    height: 1.2,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 18,
    fontWeight: weightExtraBold,
    height: 1.2,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18,
    fontWeight: weightSemibold,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: weightSemibold,
    height: 1.3,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    fontWeight: weightSemibold,
    height: 1.3,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 13,
    fontWeight: weightSemibold,
    height: 1.3,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: weightRegular,
    height: 1.4,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: weightRegular,
    height: 1.4,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: weightRegular,
    height: 1.4,
  );

  static const titleLarge = TextStyle(
    fontSize: 14,
    fontWeight: weightBold,
    height: 1.2,
    letterSpacing: 2,
  );

  static const titleMedium = TextStyle(
    fontSize: 12,
    fontWeight: weightBold,
    height: 1.2,
    letterSpacing: 2,
  );

  static const labelLarge = TextStyle(
    fontSize: 10,
    fontWeight: weightBold,
    height: 1.3,
    letterSpacing: 2,
  );

  static const labelMedium = TextStyle(
    fontSize: 10,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static const labelSmall = TextStyle(
    fontSize: 8,
    fontWeight: weightBold,
    height: 1.3,
    letterSpacing: 2,
  );
}
