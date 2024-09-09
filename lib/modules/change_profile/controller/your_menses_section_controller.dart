import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/change_profile/widget/how_often_menses_duration_bottomsheet.dart';
import 'package:lines/modules/change_profile/widget/modify_menses_duration_bottomsheet.dart';

class YourMensesSectionController extends GetxController {
  RxInt get periodDays => (appController.user.value?.periodDays ?? 0).obs;

  RxInt get periodDuration =>
      (appController.user.value?.periodDuration ?? 0).obs;

  RxBool isMensesDurationButtonLoading = false.obs;
  RxBool isHowOftenMensesButtonLoading = false.obs;

  void openModifyMensesDurationBottomSheet() {
    Get.bottomSheet(
      Obx(
        () {
          return ModifyMensesDurationBottomsheet(
            isButtonLoading: isHowOftenMensesButtonLoading.value,
            onSave: (int mensesDuration) {
              isHowOftenMensesButtonLoading.value = true;
              savePeriodDays(mensesDuration).then((_) {
                isHowOftenMensesButtonLoading.value = false;
                print("mensessDuration: $mensesDuration");
                Get.back();
              });
            },
          );
        },
      ),
    );
  }

  void openHowOftenMensesDurationBottomsheet() {
    Get.bottomSheet(
      Obx(
        () {
          return HowOftenMensesDurationBottomsheet(
            isButtonLoading: isMensesDurationButtonLoading.value,
            onSave: (int mensesDuration) {
              isMensesDurationButtonLoading.value = true;
              savePeriodDays(mensesDuration).then((_) {
                isMensesDurationButtonLoading.value = false;
                print("mensessDuration: $mensesDuration");
                Get.back();
              });
            },
          );
        },
      ),
    );
  }

  Future<void> savePeriodDays(int periodDays) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
