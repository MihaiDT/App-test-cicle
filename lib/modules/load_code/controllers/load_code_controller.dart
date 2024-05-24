import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoadCodeController extends GetxController {
  @override
  void onReady() {
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
          await AuthenticationService.fetchUser();
          isPending.value = false;
          Get.offAndToNamed(
            Routes.loadCodeResultsPage,
            arguments: uploadedProductResponse.content,
          );
        }
      },
    );
    super.onReady();
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
      await ProductService.loadCode(upperCaseCode);
    }
  }
}
