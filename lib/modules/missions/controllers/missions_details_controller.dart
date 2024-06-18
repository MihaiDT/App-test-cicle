import 'package:get/get.dart';
import 'package:lines/data/models/mission.dart';

class MissionsDetailsController extends GetxController {
  late final Mission selectedMission;

  @override
  void onInit() {
    selectedMission = Get.arguments as Mission;
    super.onInit();
  }
}
