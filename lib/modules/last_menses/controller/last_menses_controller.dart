import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/last_menses/widget/consent_bottomsheet.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class LastMensesController extends GetxController {
  @override
  Future<void> onReady() async {
    final bool hasAcceptedPrivacyPolicy = await Get.bottomSheet(
      const ConsentBottomSheet(),
      enableDrag: false,
      isDismissible: false,
      backgroundColor: ThemeColor.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
    if (!hasAcceptedPrivacyPolicy) {
      await AuthenticationService.completeUserRegistration(
        appController.updateUserParameters,
      );
      if (HiveManager.isFirstTutorialWatched) {
        Get.offAndToNamed(Routes.welcomeWalkthrough);
      } else {
        Get.offAndToNamed(Routes.main);
      }
    }
    super.onReady();
  }

  ValueNotifier<DateTimeRange?> datetimeRange = ValueNotifier(null);
}
