import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class ConfirmEmailController extends GetxController {
  ConfirmEmailController() {
    ever(appController.sendConfirmEmail.rxValue, (sendConfirmEmailStatus) {
      if (sendConfirmEmailStatus.isFailed) {
        FlushBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: HeadlineSmall(
              sendConfirmEmailStatus.errorType?.errorText ?? '',
              color: ThemeColor.darkBlue,
            ),
          ),
        ).show(
          Get.context!,
        );
      }
      if (sendConfirmEmailStatus.isSuccessful) {
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
    });
  }

  @override
  Future<void> onReady() async {
    await AuthenticationService.sendActivationLink(email);

    super.onReady();
  }

  void logIn() {
    AdjustManager.trackEvent(AjustEventType.confirmEmail);

    appController.isLoginFlow.value = true;
    Get.offAndToNamed(
      Routes.login,
    );
  }

  Future<void> sendNewEmail() async {
    await AuthenticationService.sendActivationLink(email);
  }

  String get email => appController.user.value?.email ?? '';
}
