import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;

  void onPasswordVisibilityChanged() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void savePassword() {
    // Save password
  }
}
