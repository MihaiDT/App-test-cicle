import 'package:flutter/material.dart';
import 'package:get/get.dart';

void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

final RxDouble rxKeyboardHeight = RxDouble(0.0);
double get keyboardHeight => rxKeyboardHeight.value;
set keyboardHeight(double newValue) => rxKeyboardHeight.value = newValue;

Widget keyboardSizedBox() {
  return Obx(() => SizedBox(height: keyboardHeight));
}
