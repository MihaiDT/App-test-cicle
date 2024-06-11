import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          child: Text(sendConfirmEmailStatus.errorType?.errorText ?? ''),
        ).show(
          Get.context!,
        );
      }
      if (sendConfirmEmailStatus.isSuccessful) {
        FlushBar(
          child: const Text('Email inviata con successo!'),
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
    if (appController.isLoginFlow.value == true) {
      Get.back();
    } else {
      appController.isLoginFlow.value = true;
      Get.offNamedUntil(
        Routes.login,
        (route) => false,
      );
    }
  }

  Future<void> sendNewEmail() async {
    await AuthenticationService.sendActivationLink(email);
  }

  String get email => appController.user.value?.email ?? '';
}
