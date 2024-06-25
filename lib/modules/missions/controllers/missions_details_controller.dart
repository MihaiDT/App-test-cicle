import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/mission_completed/arguments/mission_completed_arguments.dart';
import 'package:lines/routes/routes.dart';

class MissionsDetailsController extends GetxController {
  Rx<Mission> selectedMission = (Get.arguments as Mission).obs;

  RxInt get totalCoins => (appController.user.value?.coinsCollected ?? 0).obs;

  @override
  void onInit() {
    super.onInit();
    ever(appController.missionCompletedArguments, (missionCompletedArguments) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (missionCompletedArguments.mission != null) {
            selectedMission.value = missionCompletedArguments.mission!;
          }
        },
      );
    });
  }

  void onContinuePressed() {
    PiwikManager.trackEvent(
      PiwikEventType.mission,
      action: 'load code',
      name: selectedMission.value.title,
    );

    appController.missionCompletedArguments.value = MissionCompletedArguments(
      mission: selectedMission.value,
      uploadedProduct: null,
    );

    Get.toNamed(
      Routes.loadCode,
    );
  }
}
