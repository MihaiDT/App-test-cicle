import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/referral/widget/confirm_referral_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class ReferralController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool canProceed = false.obs;

  @override
  void onInit() {
    super.onInit();

    referralCodeController.addListener(() {
      if (referralCodeController.text.isNotEmpty) {
        canProceed.value = true;
      } else {
        canProceed.value = false;
      }
    });

    ever(
      condition: () => Get.currentRoute == Routes.referral,
      appController.user.rxValue,
      (callback) {
        if (callback.isPending) {
          isLoading.value = true;
        }
        if (callback.isSuccessful) {
          isLoading.value = false;
          if (!HiveManager.isFirstTutorialWatched) {
            Get.offAndToNamed(Routes.welcomeWalkthrough);
          } else {
            Get.offAndToNamed(Routes.main);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    referralCodeController.dispose();
  }

  int get coinValue => appController.settings.value?.invitationCodeCoins ?? 50;

  TextEditingController referralCodeController = TextEditingController();

  void onUseCodePressed(BuildContext context) async {
    if (referralCodeController.text.isNotEmpty) {
      appController.updateUserParameters.referralCode =
          referralCodeController.text;
    } else {
      await showErrorDialog(
        context: context,
        builder: (_) => const ConfirmReferralDialog(),
      );
    }

    /*await AuthenticationService.completeUserRegistration(
      appController.updateUserParameters,
    );*/
  }

  Future<void> onSkipPressed(BuildContext context) async {
    bool continueWithoutCode = await showErrorDialog(
      context: context,
      builder: (_) => const ConfirmReferralDialog(),
    );
    if (continueWithoutCode) {
      await AuthenticationService.completeUserRegistration(
        appController.updateUserParameters,
      );
    }
  }
}
