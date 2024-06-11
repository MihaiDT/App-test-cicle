import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/utils/regex_extension.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/tutor_email/tutor_email_arguments.dart';

class TutorEmailController extends GetxController {
  final TutorEmailArguments? arguments = Get.arguments;
  final emailController = TextEditingController();

  final rxCanProceed = false.obs;

  String get registrationEmail => appController.registerParameter.email;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      rxCanProceed.value = isValidEmail(emailController.text);
    });
  }

  bool isValidEmail(String email) {
    return RegexUtils.isEmail(email) && email != registrationEmail;
  }

  void onContinue() {
    appController.registerParameter.legalGuardianEmail = emailController.text;
    if (arguments?.onContinue != null) {
      AdjustManager.trackEvent(AjustEventType.setTutorEmail);
      arguments!.onContinue(emailController.text);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
