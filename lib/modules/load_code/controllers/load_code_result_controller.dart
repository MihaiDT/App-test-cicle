import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/navigator_extension.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/current_missions_for_product.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/uploaded_product.dart';
import 'package:lines/repository/badges_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';

class LoadCodeResultController extends GetxController {
  UploadedProduct? uploadedProduct;
  CurrentMissionsForProduct? currentMissionsForProduct;
  ValueNotifier<Mission?> selectedMission = ValueNotifier<Mission?>(null);

  RxBool isPending = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments['uploadedProduct'] != null) {
      uploadedProduct = Get.arguments['uploadedProduct'] as UploadedProduct;
    }
    if (Get.arguments['currentMissionsForProduct'] != null) {
      currentMissionsForProduct = Get.arguments['currentMissionsForProduct']
          as CurrentMissionsForProduct;
    }
  }

  @override
  void onReady() {
    super.onReady();
    appController.selectedMissionId.refresh();
  }

  RxBool isMissionSelected(Mission mission) {
    return (selectedMission.value == mission).obs;
  }

  Future<void> onSaveButtonPressed() async {
    if (currentMissionsForProduct != null) {
      isPending.value = true;
      await ProductService.loadCode(
        currentMissionsForProduct!.code,
        selectedMission.value?.id,
      );
      await BadgesService.wallet;
      await ProductService.mission;
      isPending.value = false;


      /// Set the id of the mission as global variable
      appController.selectedMissionId.value = selectedMission.value?.id;
      Get.offAndToNamed(
        Routes.missionsDetailsPage,
      );
    }
  }
}
