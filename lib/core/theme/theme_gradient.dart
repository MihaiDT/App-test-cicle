import 'package:flutter/material.dart';

class ThemeGradient {
  static const colorPrimaryGradientLight = Color(0xffB63AB4);
  static const colorPrimaryGradientDark = Color(0xff513B9F);

  static const colorQuizGradientDark = Color(0xfff7f2f8);
  static const colorQuizGradientLight = Colors.white;

  static LinearGradient primary = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      colorPrimaryGradientLight,
      colorPrimaryGradientDark,
    ],
  );

  static LinearGradient quizBackGroundGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        colorQuizGradientDark,
        colorQuizGradientLight,
        colorQuizGradientDark,
      ]);

  static LinearGradient calendarBg = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFDFC5D8),
        Color(0xFFFDE9F0),
        Color(0xFFDFC5D8),
      ]);
}
