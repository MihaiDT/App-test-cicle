import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoadCodeController extends GetxController {
  Mission? get selectedMission => appController.selectedMissionId.value != null
      ? appController.missions.value!.firstWhere(
          (item) => item.id == appController.selectedMissionId.value,
        )
      : null;

  RxInt get totalCoins => (appController.user.value?.coinsCollected ?? 0).obs;

  @override
  void onInit() {
    super.onInit();

    if (selectedMission != null) {
      ever(
        appController.uploadedProduct.rxValue,
        (uploadedProductResponse) async {
          if (uploadedProductResponse.isPending) {
            isPending.value = true;
          }
          if (uploadedProductResponse.isFailed) {
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
              Get.offNamed(
                Routes.loadCodeResultsPage,
                arguments: {
                  'uploadedProduct': uploadedProductResponse.content,
                },
              );
            }
          }
        },
      );
    } else {
      ever(
        appController.currentMissionsForProduct.rxValue,
        (callback) {
          if (callback.isPending) {
            isPending.value = true;
          }
          if (callback.isFailed) {
            isPending.value = false;
            FlushBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: HeadlineSmall(
                  callback.errorType?.errorText ?? "".toString(),
                  color: ThemeColor.darkBlue,
                ),
              ),
            ).show(Get.context!);
          }
          if (callback.isSuccessful) {
            isPending.value = false;
            Get.offNamed(
              Routes.loadCodeResultsPage,
              arguments: {
                'currentMissionsForProduct': callback.content,
              },
            );
          }
        },
      );
    }
  }

  final RxString writtenCode = "".obs;

  RxBool isPending = false.obs;

  void updateWrittenCode(String newValue) {
    writtenCode.value = newValue;
  }

  bool get canProceed {
    return writtenCode.value.length == 10;
  }

  Future<void> onConfirm() async {
    if (canProceed) {
      final String upperCaseCode = writtenCode.value.toUpperCase();
      if (selectedMission != null) {
        await ProductService.loadCode(
          upperCaseCode,
          selectedMission?.id,
        );
      } else {
        await ProductService.findMissionByCode(
          upperCaseCode,
        );
      }
    }
  }

  void showBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      constraints: BoxConstraints(maxHeight: Get.height * 0.85),
      context: context,
      isScrollControlled: true,
      builder: (_) => InfoBottomSheet(
        child: child,
      ),
    );
  }
}
