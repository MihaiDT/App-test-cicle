import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/regex_extension.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';

class ChangeTutorEmailController extends GetxController {
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

  void onContinue() async {
    await AuthenticationService.updateUser(
      UpdateUserParameters(legalGuardianEmail: emailController.text),
    ).then((value) async {
      if (appController.user.value?.isCreatedBeforeLive == true) {
        /// Privacy user registered before go live
        Get.toNamed(Routes.privacyOldRegistration);
      } else {
        /// Send confirm email
        await AuthenticationService.sendConsentsEmail();
        Get.toNamed(Routes.confirmCondition);
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
