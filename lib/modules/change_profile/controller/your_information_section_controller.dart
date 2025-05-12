import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/modules/change_profile/widget/change_profile_bottomsheet.dart';
import 'package:lines/routes/routes.dart';

class YourInformationSectionController extends GetxController {
  User? get user {
    return appController.user.value;
  }

  bool get isZipCodeCompleted {
    return appController.user.value?.profileCompletedAreas?.zipCode == true &&
        user?.zipCode?.isNotEmpty == true;
  }

  RxBool isBottomsheetButtonLoading = false.obs;

  YourInformationSectionController() {
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.changeProfilePage,
      (callback) {
        if (callback.isPending) {
          isBottomsheetButtonLoading.value = true;
        } else {
          isBottomsheetButtonLoading.value = false;
        }
      },
    );
  }

  void showBottomSheet({
    required String title,
    required Function(String) onConfirm,
    required String initialText,
    required TextEditingController controller,
  }) {
    Get.bottomSheet(
      enableDrag: false,
      ignoreSafeArea: true,
      Obx(
        () {
          return ChangeProfileBottomsheet(
            title: title,
            onConfirm: onConfirm,
            controller: controller,
            isButtonLoading: isBottomsheetButtonLoading.value,
          );
        },
      ),
    );
  }

  void updateName({
    required String title,
    required Function(String) onConfirm,
    required String initialText,
  }) {
    final TextEditingController controller =
        TextEditingController(text: initialText);

    showBottomSheet(
      title: title,
      onConfirm: onConfirm,
      initialText: initialText,
      controller: controller,
    );
  }

  void updateLastName({
    required String title,
    required Function(String) onConfirm,
    required String initialText,
  }) {
    final TextEditingController controller =
        TextEditingController(text: initialText);
    showBottomSheet(
      title: title,
      onConfirm: onConfirm,
      initialText: initialText,
      controller: controller,
    );
  }

  void updateNickname({
    required String title,
    required Function(String) onConfirm,
    required String initialText,
  }) {
    final TextEditingController controller =
        TextEditingController(text: initialText);
    showBottomSheet(
      title: title,
      onConfirm: onConfirm,
      initialText: initialText,
      controller: controller,
    );
  }

  void updateZipCode({
    required String title,
    required Function(String) onConfirm,
    required String initialText,
  }) {
    final TextEditingController controller =
        TextEditingController(text: initialText);

    showBottomSheet(
      title: title,
      onConfirm: onConfirm,
      initialText: initialText,
      controller: controller,
    );
  }
}
