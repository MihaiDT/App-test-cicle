import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizesTheme {
  /// Safe area
  final double paddingBottomSafeArea = MediaQuery.of(Get.context!).padding.bottom;
  final double paddingTopSafeArea = MediaQuery.of(Get.context!).padding.top;
  final double paddingAppBarDefault = AppBar().preferredSize.height;
  SizedBox get hBottomSafeArea => SizedBox(height: paddingBottomSafeArea);
  SizedBox get hTopSafeArea => SizedBox(height: paddingTopSafeArea);
  SizedBox get hAppBarDefault => SizedBox(height: paddingAppBarDefault);

  /// EdgeInsets (Padding)
  final double paddingSizeSmall = 16;
  final double paddingSizeLarge = 24;
  EdgeInsets get paddingSmall => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get paddingLarge => const EdgeInsets.symmetric(horizontal: 24);

  /// Height (SizedBox)
  SizedBox get h4 => const SizedBox(height: 4);
  SizedBox get h8 => const SizedBox(height: 8);
  SizedBox get h12 => const SizedBox(height: 12);
  SizedBox get h16 => const SizedBox(height: 16);
  SizedBox get h20 => const SizedBox(height: 20);
  SizedBox get h24 => const SizedBox(height: 24);
  SizedBox get h32 => const SizedBox(height: 32);
  SizedBox get h36 => const SizedBox(height: 36);
  SizedBox get h40 => const SizedBox(height: 40);
  SizedBox get h48 => const SizedBox(height: 48);
  SizedBox get h60 => const SizedBox(height: 60);

  /// Width (SizedBox)
  SizedBox get w4 => const SizedBox(width: 4);
  SizedBox get w8 => const SizedBox(width: 8);
  SizedBox get w12 => const SizedBox(width: 12);
  SizedBox get w16 => const SizedBox(width: 16);
  SizedBox get w20 => const SizedBox(width: 20);
  SizedBox get w24 => const SizedBox(width: 24);
  SizedBox get w32 => const SizedBox(width: 32);
  SizedBox get w36 => const SizedBox(width: 36);
  SizedBox get w40 => const SizedBox(width: 40);
  SizedBox get w48 => const SizedBox(width: 48);
  SizedBox get w60 => const SizedBox(width: 60);
}
