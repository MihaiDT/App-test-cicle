import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    fontSize: 24.sp,
    fontWeight: weightMedium,
    height: 1.1.sp,
  );

  static TextStyle largeDark = largeLight.copyWith(color: ThemeColor.primary);

  static TextStyle mediumLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 16.5.sp,
    fontWeight: weightMedium,
    height: 1.4.sp,
  );
  static TextStyle mediumDark = mediumLight.copyWith(color: ThemeColor.primary);

  static TextStyle bodyLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: weightMedium,
    height: 1.4.sp,
  );

  static TextStyle bodyDark = bodyLight.copyWith(color: ThemeColor.primary);

  static TextStyle bodySmallLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 13.sp,
    fontWeight: weightMedium,
    height: 1.4.sp,
  );

  static TextStyle bodySmallDark =
      bodySmallLight.copyWith(color: ThemeColor.primary);

  static TextStyle boldSmallDark =
      bodySmallDark.copyWith(fontWeight: weightBold);
  static TextStyle boldSmallLight =
      bodySmallLight.copyWith(fontWeight: weightBold);

  static TextStyle button = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: weightSemibold,
    height: 1.4.sp,
  );


  static TextStyle buttonSmall = button.copyWith(
    fontSize: 12.sp,
    height: 1.2.sp,
  );

  static TextStyle linkLight = GoogleFonts.barlow(
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.sp,
    fontSize: 14.sp,
    fontWeight: weightBold,
    height: 1.4.sp,
  );

  static TextStyle linkDark = linkLight.copyWith(color: ThemeColor.primary);

  static TextStyle labelLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 11.5.sp,
    fontWeight: weightBold,
    height: 1.4.sp,
    letterSpacing: 1.1.sp,
  );

  static TextStyle labelDark = labelLight.copyWith(color: ThemeColor.primary);

  static TextStyle placeholderLight = GoogleFonts.barlow(
    color: ThemeColor.whiteDark,
    fontSize: 11.5.sp,
    fontWeight: weightSemibold,
    letterSpacing: 1.1.sp,
  );

  static TextStyle placeholderDark =
      placeholderLight.copyWith(color: ThemeColor.primary);

  static TextStyle calendarMonth = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14.5.sp,
    fontWeight: weightSemibold,
    height: 1.4.sp,
    letterSpacing: 1.1,
  );

  static TextStyle calendarWeekDay = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14.5.sp,
    fontWeight: weightMedium,
    height: 1.4.sp,
    letterSpacing: 1.1,
  );

  static TextStyle ctaLight = GoogleFonts.barlow(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: weightMedium,
    height: 1.4.sp,
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
