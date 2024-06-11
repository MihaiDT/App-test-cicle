import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';

class MissionsController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;
  List<Mission> get missions => appController.missions.value ?? [];

  @override
  Future<void> onReady() async {
    await ProductService.mission;
    appController.selectedMissionIndex = -1;

    super.onReady();
  }

  void navigateToMissionDetails(int missionIndex) {
    appController.selectedMissionIndex = missionIndex;

    PiwikManager.trackEvent(
      PiwikEventType.mission,
      action: 'select mission',
      name: missions[missionIndex].title,
    );

    Get.toNamed(
      Routes.missionsDetailsPage,
    );
  }
}
