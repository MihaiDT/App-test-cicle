import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/current_missions_for_product.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/uploaded_product.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoadCodeResultController extends GetxController {
  UploadedProduct? uploadedProduct;
  CurrentMissionsForProduct? currentMissionsForProduct;
  ValueNotifier<Mission?> selectedMission = ValueNotifier<Mission?>(null);

  RxBool showBackButton = false.obs;

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

      ever(
        appController.uploadedProduct.rxValue,
        (uploadedProductResponse) async {
          if (uploadedProductResponse.isPending) {
            showBackButton.value = false;
            isPending.value = true;
          }
          if (uploadedProductResponse.isFailed) {
            showBackButton.value = true;
            isPending.value = false;

            FlushBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: HeadlineSmall(
                  uploadedProductResponse.errorType?.errorText ?? "".toString(),
                  color: ThemeColor.darkBlue,
                ),
              ),
            ).show(Get.context!);
          }
          if (uploadedProductResponse.isSuccessful) {
            showBackButton.value = false;

            // Aggiorno utente e wallet
            await AuthenticationService.fetchUser();
            // Aggiorno le missioni
            await ProductService.mission;

            isPending.value = false;

            // /// Update the state of the app
            // updateState(
            //   uploadedProductResponse.content,
            //   selectedMission.value,
            // );

            if (uploadedProductResponse.content!.prizeOrderCreated) {
              Get.offNamed(Routes.missionCompleted);
            } else {
              Get.back();
            }
          }
        },
      );
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
      appController.selectedMissionId.value = selectedMission.value?.id;

      // mission selected
      await ProductService.loadCode(
        currentMissionsForProduct!.code,
        selectedMission.value?.id,
      );
      // await BadgesService.wallet;
      // await ProductService.mission;

      // /// Set the id of the mission as global variable
      // appController.selectedMissionId.value = selectedMission.value?.id;
      // Get.offAndToNamed(
      //   Routes.missionsDetailsPage,
      // );
    }
  }
}
