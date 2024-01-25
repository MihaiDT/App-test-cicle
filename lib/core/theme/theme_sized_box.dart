import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

extension ThemeSizedBox on SizedBox {
  /// Height
  static SizedBox get height4 => const SizedBox(height: 4);

  static SizedBox get height8 => const SizedBox(height: 8);

  static SizedBox get height12 => const SizedBox(height: 12);

  static SizedBox get height16 => const SizedBox(height: 16);

  static SizedBox get height20 => const SizedBox(height: 20);

  static SizedBox get height24 => const SizedBox(height: 24);

  static SizedBox get height32 => const SizedBox(height: 32);

  static SizedBox get height36 => const SizedBox(height: 36);

  static SizedBox get height40 => const SizedBox(height: 40);

  static SizedBox get height48 => const SizedBox(height: 48);

  static SizedBox get height60 => const SizedBox(height: 60);

  static SizedBox get height90 => const SizedBox(height: 90);

  /// Width
  static SizedBox get width4 => const SizedBox(width: 4);

  static SizedBox get width6 => const SizedBox(width: 6);

  static SizedBox get width8 => const SizedBox(width: 8);

  static SizedBox get width12 => const SizedBox(width: 12);

  static SizedBox get width16 => const SizedBox(width: 16);

  static SizedBox get width20 => const SizedBox(width: 20);

  static SizedBox get width24 => const SizedBox(width: 24);

  static SizedBox get width32 => const SizedBox(width: 32);

  static SizedBox get width36 => const SizedBox(width: 36);

  static SizedBox get width40 => const SizedBox(width: 40);

  static SizedBox get width48 => const SizedBox(width: 48);

  static SizedBox get width60 => const SizedBox(width: 60);

  /// SafeArea
  static SizedBox get heightAppBarDefault =>
      SizedBox(height: ThemeSize.heightAppBarDefault);

  static SizedBox get heightBottomSafeArea =>
      SizedBox(height: ThemeSize.heightSafeAreaBottom);

  static SizedBox get heightTopSafeArea =>
      SizedBox(height: ThemeSize.heightSafeAreaTop);
}
