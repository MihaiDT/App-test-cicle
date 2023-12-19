import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSize {
  /// Safe area
  static double heightSafeAreaBottom =
      MediaQuery.of(Get.context!).viewPadding.bottom +
          MediaQuery.of(Get.context!).viewInsets.bottom;
  static double heightSafeAreaTop = MediaQuery.of(Get.context!).viewPadding.top;
  static double heightAppBarDefault = AppBar().preferredSize.height;

  /// EdgeInsets (Padding)
  static const double paddingSmall = 16;
  static const double paddingMedium = 24;
  static const double paddingLarge = 32;
  static const EdgeInsets paddingS = EdgeInsets.symmetric(
    horizontal: paddingSmall,
  );
  static const EdgeInsets paddingM = EdgeInsets.symmetric(
    horizontal: paddingMedium,
  );
  static const EdgeInsets paddingL = EdgeInsets.symmetric(
    horizontal: paddingLarge,
  );

// /// Keyboard
// static RxDouble rxHKeyboard = 0.0.obs;
// static double get hKeyboard => rxHKeyboard.value;
// static set hKeyboard(double newValue) => rxHKeyboard.value = newValue;
}
