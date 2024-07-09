import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionsController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;

  // List<Mission> get completedMission => appController.missions.value ?? [];

  RxList<Mission> get missions => (appController.missions.value ?? []).obs;

  // @override
  // Future<void> onReady() async {
  //   if (!appController.missions.responseHandler.isSuccessful) {
  //     await ProductService.mission;
  //   }
  //   super.onReady();
  // }

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
