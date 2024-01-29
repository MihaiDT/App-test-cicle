import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class ReferralController extends GetxController {
  int get coinValue => appController.settings.value?.invitationCodeCoins ?? 25;

  TextEditingController referralCodeController = TextEditingController();

  void onButtonPressed() async {
    if (referralCodeController.text.isNotEmpty) {
      appController.updateUserParameters.referralCode =
          referralCodeController.text;
    }

    await AuthenticationService.completeUserRegistration(
      appController.updateUserParameters,
    );

    Get.toNamed(Routes.main);
  }
}
