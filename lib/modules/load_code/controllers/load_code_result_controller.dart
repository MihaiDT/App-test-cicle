import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/mission_completed/arguments/mission_completed_arguments.dart';
import 'package:lines/repository/product_service.dart';

class LoadCodeResultController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;
  final MissionCompletedArguments argument =
      appController.missionCompletedArguments.value;

  @override
  Future<void> onReady() async {
    super.onReady();

    await ProductService.mission;
    Mission mission = appController.missions.value!.firstWhere(
      (element) => element.id == argument.mission?.id,
    );
    appController.missionCompletedArguments.value = MissionCompletedArguments(
      uploadedProduct: argument.uploadedProduct,
      mission: mission,
    );
  }
}
