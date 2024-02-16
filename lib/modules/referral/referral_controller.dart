import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class ReferralController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ever(
      appController.user.rxValue,
      (callback) {
        if (callback.isSuccessful) {
          Get.offAndToNamed(Routes.welcomeWalkthrough);
        }
      },
    );
  }

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
  }
}
