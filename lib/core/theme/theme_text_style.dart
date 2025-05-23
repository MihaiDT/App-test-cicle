import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_color.dart';

class ThemeTextStyle {
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

  static const TextStyle headlineExtraLarge = TextStyle(
    fontSize: 20,
    fontWeight: weightSemibold,
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
    letterSpacing: 2.0,
  );

  static const titleMedium = TextStyle(
    fontSize: 12,
    fontWeight: weightBold,
    height: 1.2,
  );

  static const labelLarge = TextStyle(
    fontSize: 10,
    fontWeight: weightBold,
    height: 1.3,
  );

  static const labelMedium = TextStyle(
    fontSize: 10,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static const labelSmall = TextStyle(
    fontSize: 9,
    fontWeight: weightBold,
    height: 1.1,
  );

  static const TextStyle calendarWeekDay = TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle calendarMonth = const TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: weightSemibold,
    height: 1.4,
  );
  static TextStyle horizontalCalendarWDay = const TextStyle(
    color: Color(0xffB438B2),
    fontSize: 13,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle horizontalCalendarWDayToday =
      horizontalCalendarWDay.copyWith(
    fontWeight: weightExtraBold,
  );

  static TextStyle horizontalCalendarDate = const TextStyle(
    color: ThemeColor.primary,
    fontSize: 16,
    fontWeight: weightMedium,
    height: 1.4,
  );

  static TextStyle horizontalCalendarDateToday =
      horizontalCalendarDate.copyWith(
    fontSize: 20,
    fontWeight: weightExtraBold,
  );
}
