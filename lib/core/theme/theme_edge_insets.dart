import 'package:flutter/material.dart';

extension ThemeEdgeInsets on EdgeInsets {
  static EdgeInsets get allSmall => const EdgeInsets.all(16);
  static EdgeInsets get horizontalSmall =>
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets get horizontalLarge =>
      const EdgeInsets.symmetric(horizontal: 32);
}
