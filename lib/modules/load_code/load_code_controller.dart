import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class LoadCodeController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;

  final RxString writtenCode = "".obs;

  void updateWrittenCode(String newValue) {
    writtenCode.value = newValue;
  }

  bool get canProceed {
    return writtenCode.value.length == 10;
  }
}
