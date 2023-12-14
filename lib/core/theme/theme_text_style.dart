import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lines/core/app_theme.dart';

class ThemeTextStyle {
  static const weightMedium = FontWeight.w500;
  static const weightRegular = FontWeight.w400;
  static const weightSemibold = FontWeight.w600;
  static const weightBold = FontWeight.w700;
  static const weightExtraBold = FontWeight.w900;

  static TextStyle largeLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 24,
    fontWeight: weightMedium,
    height: 1.1,
  );

  static TextStyle largeDark = largeLight.copyWith(color: ThemeColor.primary);

  static TextStyle mediumLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 16.5,
    fontWeight: weightMedium,
    height: 1.4,
  );
  static TextStyle mediumDark = mediumLight.copyWith(color: ThemeColor.primary);

  static TextStyle bodyLight = GoogleFonts.barlow(
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

  static TextStyle button = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 16,
    fontWeight: weightSemibold,
    height: 1.4,
  );


  static TextStyle buttonSmall = button.copyWith(
    fontSize: 12,
    height: 1.2,
  );

  static TextStyle linkLight = GoogleFonts.barlow(
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1,
    fontSize: 14,
    fontWeight: weightBold,
    height: 1.4,
  );

  static TextStyle linkDark = linkLight.copyWith(color: ThemeColor.primary);

  static TextStyle labelLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 11.5,
    fontWeight: weightBold,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle labelDark = labelLight.copyWith(color: ThemeColor.primary);

  static TextStyle placeholderLight = GoogleFonts.barlow(
    color: ThemeColor.whiteDark,
    fontSize: 11.5,
    fontWeight: weightSemibold,
    letterSpacing: 1.1,
  );

  static TextStyle placeholderDark =
      placeholderLight.copyWith(color: ThemeColor.primary);

  static TextStyle calendarMonth = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightSemibold,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle calendarWeekDay = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightMedium,
    height: 1.4,
    letterSpacing: 1.1,
  );

  static TextStyle ctaLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle ctaDark = ctaLight.copyWith(color: ThemeColor.primary);

  static TextStyle welcomeQuizSelectDark = GoogleFonts.barlow(
    height: 1.4,
    letterSpacing: 2.0,
    fontSize: 16,
    color: ThemeColor.darkBlue,
    fontWeight: weightBold,
  );
}
