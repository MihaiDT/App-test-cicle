import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/routes/routes.dart';

class PrizesController extends GetxController {
  void navigateToMissionDetails(Mission mission) {
    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: mission,
    );
  }

  List<Mission> get missions => appController.missions.value ?? [];

  int get numberOfMissions => missions.length;

  bool get showSurveySection => false;
}
