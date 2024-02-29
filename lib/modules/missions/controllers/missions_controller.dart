import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionsController extends GetxController {
  void navigateToMissionDetails(Mission mission) {
    appController.selectedMission.value = mission;
    Get.toNamed(
      Routes.missionsDetailsPage,
    );
  }
}
