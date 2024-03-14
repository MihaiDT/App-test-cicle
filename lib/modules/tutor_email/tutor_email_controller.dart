import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/regex_extension.dart';
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
    return RegexUtils.isEmail(email);
  }

  void onContinue() {
    appController.registerParameter.legalGuardianEmail = emailController.text;
    Get.offAndToNamed(Routes.privacy);
  }
}
