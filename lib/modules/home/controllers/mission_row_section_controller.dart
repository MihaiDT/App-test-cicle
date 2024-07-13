import 'package:get/get.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionRowSectionController extends GetxController {
  List<Mission> get missions => appController.missions.value ?? [];

  double get missionContainerSize => Get.height * 0.3;

  void navigateToMissionDetails(Mission currentMission) {
    PiwikManager.trackEvent(
      PiwikEventType.mission,
      action: 'select mission',
      name: currentMission.title,
    );

    appController.selectedMissionId.value = currentMission.id;

    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: currentMission,
    );
  }
}
