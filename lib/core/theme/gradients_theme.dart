import 'package:flutter/material.dart';

class GradientsTheme {
  static const kColorGradientLight = Color(0xffB63AB4);
  static const kColorGradientDark = Color(0xff513B9F);

  LinearGradient get primary => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          kColorGradientLight,
          kColorGradientDark,
        ],
      );
}
