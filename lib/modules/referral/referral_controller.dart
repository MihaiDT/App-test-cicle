import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/referral/widget/confirm_referral_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class ReferralController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool canProceed = false.obs;

  ReferralController() {
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

    ever(
      condition: () => Get.currentRoute == Routes.referral,
      appController.validateReferralCode.rxValue,
      (callback) async {
        if (callback.isPending) {
          isLoading.value = true;
        }
        if (callback.isFailed) {
          FlushBar(
            child: const Text('Impossibile utilizzare il codice'),
          ).show(Get.context!);
        }

        if (callback.isSuccessful) {
          AdjustManager.trackEvent(AjustEventType.referralCodeConfirmed);

          isLoading.value = false;
          if (callback.content?.isValid == true) {
            await AuthenticationService.completeUserRegistration(
              appController.updateUserParameters,
            );
          } else {
            FlushBar(
              child: const Text('Codice non valido'),
            ).show(Get.context!);
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

      await AuthenticationService.validateInvitationCode(
        referralCodeController.text,
      );
    } else {
      await showErrorDialog(
        context: context,
        builder: (_) => const ConfirmReferralDialog(),
      );
    }
  }

  Future<void> onSkipPressed(BuildContext context) async {
    bool continueWithoutCode = await showErrorDialog(
      context: context,
      builder: (_) => const ConfirmReferralDialog(),
    );
    if (continueWithoutCode) {
      AdjustManager.trackEvent(AjustEventType.referralCodeDenied);

      await AuthenticationService.completeUserRegistration(
        appController.updateUserParameters,
      );
    }
  }
}
