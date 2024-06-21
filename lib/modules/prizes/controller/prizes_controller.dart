import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class PrizesController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;

  RxList<Mission> get missions => (appController.missions.value ?? []).obs;

  void navigateToMissionDetails(Mission currentMission) {
    PiwikManager.trackEvent(
      PiwikEventType.mission,
      action: 'select mission',
      name: currentMission.title,
    );

    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: currentMission,
    );
  }
}
