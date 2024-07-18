import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class ConfirmConditionController extends GetxController {
  String get email => (appController.user.value?.hasMoreThan18Years == false)
      ? appController.user.value?.legalGuardianEmail ?? ''
      : appController.user.value?.email ?? '';

  void logIn() {
    appController.isLoginFlow.value = true;
    Get.offAndToNamed(
      Routes.login,
    );
  }

  Future<void> sendNewEmail() async {
    await AuthenticationService.sendConsentsEmail();

    FlushBar(
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: HeadlineSmall(
          'Email inviata con successo!',
          color: ThemeColor.darkBlue,
        ),
      ),
    ).show(
      Get.context!,
    );
  }
}
