import 'package:get/get.dart';

import '../../core/utils/helpers.dart';

class AppScaffoldController extends GetxController {
  final RxBool _isBusy = false.obs;
  bool get isBusy => _isBusy.value;
  set isBusy(bool newValue) => _isBusy.value = newValue;

  onTapDefaultBeahaviour() {
    dismissKeyboard(Get.context!);
  }

  onTapView() {
    dismissKeyboard(Get.context!);
  }

  onTapBack() {
    onTapDefaultBeahaviour();
    Get.back();
  }

  onTapClose() {
    onTapBack();
  }
}
