import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoadCodeController extends GetxController {
  late final int? missionId;

  LoadCodeController() {
    final Mission? mission = Get.arguments?['mission'];
    missionId = mission?.id;

    ever(
      appController.uploadedProduct.rxValue,
      (uploadedProductResponse) async {
        if (uploadedProductResponse.isPending) {
          isPending.value = true;
        }
        if (uploadedProductResponse.isFailed) {
          isPending.value = false;
          FlushBar(
            child: Text(
              uploadedProductResponse.errorType?.errorText ?? "",
            ),
          ).show(Get.context!);
        }
        if (uploadedProductResponse.isSuccessful) {
          // Aggiorno utente e wallet
          await AuthenticationService.fetchUser();
          // Aggiorno le missioni
          await ProductService.mission;

          isPending.value = false;

          if (uploadedProductResponse.content!.prizeOrderCreated) {
            Get.offNamed(
              Routes.missionCompleted,
              arguments: uploadedProductResponse.content,
            );
          } else {
            Get.offNamed(
              Routes.loadCodeResultsPage,
              arguments: uploadedProductResponse.content,
            );
          }
        }
      },
    );
  }

  int get totalCoins => appController.user.value?.coinsCollected ?? 0;

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
      await ProductService.loadCode(upperCaseCode, missionId);
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
