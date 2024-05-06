import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';

class AppScaffoldController extends GetxController {
  final RxBool _isBusy = false.obs;

  bool get isBusy => _isBusy.value;

  set isBusy(bool newValue) => _isBusy.value = newValue;

  void onTapDefaultBeahaviour() {
    dismissKeyboard(Get.context!);
  }

  void onTapBack() {
    onTapDefaultBeahaviour();
    Get.back();
  }
}
