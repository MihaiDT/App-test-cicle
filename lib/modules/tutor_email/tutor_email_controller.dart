import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';

class TutorEmailController extends GetxController {
  final emailController = TextEditingController();
  final rxCanProceed = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      rxCanProceed.value = isValidEmail(emailController.text);
    });
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return regex.hasMatch(email);
  }

  void onContinue() {
    appController.registerParameter.legalGuardianEmail = emailController.text;
    Get.offAndToNamed(Routes.privacy);
  }
}
