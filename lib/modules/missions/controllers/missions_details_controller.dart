import 'package:get/get.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/repository/advices_service.dart';

class MissionsDetailsController extends GetxController {
  @override
  Future<void> onReady() async {
    await AdvicesService.fetchSuggestedArticles();

    super.onReady();
  }

  Mission get selectedMission => Get.arguments as Mission;
}
