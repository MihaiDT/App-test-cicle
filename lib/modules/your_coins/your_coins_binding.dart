import 'package:get/get.dart';
import 'package:lines/modules/your_coins/your_coins_controller.dart';

class YourCoinsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutCoinsController());
  }
}
