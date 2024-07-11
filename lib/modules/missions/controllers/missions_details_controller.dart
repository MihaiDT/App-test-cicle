import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionsDetailsController extends GetxController {
  Mission get selectedMission => appController.missions.value!.firstWhere(
        (item) => item.id == appController.selectedMissionId.value,
      );

  RxInt get totalCoins => (appController.user.value?.coinsCollected ?? 0).obs;

  void onContinuePressed() {
    PiwikManager.trackEvent(
      PiwikEventType.mission,
      action: 'load code',
      name: selectedMission.title,
    );

    Get.toNamed(
      Routes.loadCode,
    );
  }
}
