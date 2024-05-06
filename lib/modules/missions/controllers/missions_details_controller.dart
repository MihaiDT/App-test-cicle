import 'package:get/get.dart';
import 'package:lines/data/models/mission.dart';

class MissionsDetailsController extends GetxController {
  Mission get selectedMission => Get.arguments as Mission;
}
