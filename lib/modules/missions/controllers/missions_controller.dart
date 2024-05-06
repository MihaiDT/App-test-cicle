import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class MissionsController extends GetxController {
  List<Mission> get missions => appController.missions.value ?? [];

  void navigateToMissionDetails(Mission mission) {
    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: mission,
    );
  }
}
