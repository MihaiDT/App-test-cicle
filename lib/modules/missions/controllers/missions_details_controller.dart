import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';

class MissionsDetailsController extends GetxController {
  Mission? get selectedMission => appController.selectedMission.value;
}
