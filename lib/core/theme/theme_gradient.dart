import 'package:flutter/material.dart';

class ThemeGradient {
  static const colorPrimaryGradientLight = Color(0xffB63AB4);
  static const colorPrimaryGradientDark = Color(0xff513B9F);

  static LinearGradient primary = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      colorPrimaryGradientLight,
      colorPrimaryGradientDark,
    ],
  );
}
