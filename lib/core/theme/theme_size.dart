import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSize {
  /// Safe area
  static double heightSafeAreaBottom =
      MediaQuery.of(Get.context!).viewPadding.bottom + MediaQuery.of(Get.context!).viewInsets.bottom;
  static double heightSafeAreaTop = MediaQuery.of(Get.context!).viewPadding.top;
  static double heightAppBarDefault = AppBar().preferredSize.height;

  /// EdgeInsets (Padding)
  static double widthPaddingSmall = 16;
  static double widthPaddingLarge = 24;
  static EdgeInsets paddingS = const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets paddingL = const EdgeInsets.symmetric(horizontal: 24);

  // /// Keyboard
  // static RxDouble rxHKeyboard = 0.0.obs;
  // static double get hKeyboard => rxHKeyboard.value;
  // static set hKeyboard(double newValue) => rxHKeyboard.value = newValue;
}
