import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';

class MissionsController extends GetxController {
  @override
  Future<void> onReady() async {
    await ProductService.mission;
    super.onReady();
  }

  List<Mission> get missions => appController.missions.value ?? [];

  void navigateToMissionDetails(Mission mission) {
    Get.toNamed(
      Routes.missionsDetailsPage,
      arguments: mission,
    );
  }
}
