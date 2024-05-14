import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionRowSectionController extends GetxController {
  List<Mission> get missions => appController.missions.value ?? [];

  double get missionContainerSize => Get.height * 0.3;

  void navigateToMissionDetails(Mission mission) {
    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: mission,
    );
  }
}
