import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';

class ChangePasswordController extends GetxController {
  RxBool pageIsPending = false.obs;

  ChangePasswordController() {
    ever(appController.updatePassword.rxValue, (response) {
      if (response.isPending) {
        pageIsPending.value = true;
      }
      if (response.isSuccessful) {
        pageIsPending.value = false;

        Get.back();
      }
    });
  }

  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;

  RxBool get canProceed => passwordController.text.isNotEmpty.obs;

  void onPasswordVisibilityChanged() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> savePassword() async {
    final email = appController.user.value?.email ?? "";

    await AuthenticationService.changePassword(
      email,
      passwordController.text,
    );
  }
}
