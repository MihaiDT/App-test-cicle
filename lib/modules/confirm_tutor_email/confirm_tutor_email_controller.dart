import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class ConfirmTutorEmailController extends GetxController {
  final String? tutorEmail = Get.arguments;

  ConfirmTutorEmailController() {
    ever(appController.sendConfirmEmail.rxValue, (sendConfirmEmailStatus) {
      if (sendConfirmEmailStatus.isFailed) {
        FlushBar(
          child: Text(sendConfirmEmailStatus.errorType?.errorText ?? ''),
        ).show(Get.context!);
      }
    });
  }

  void sendEmail() async {
    await AuthenticationService.sendConsentsEmail(tutorEmail);
  }
}
