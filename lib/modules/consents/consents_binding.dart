import 'package:get/get.dart';
import 'package:lines/modules/consents/consents_controller.dart';

class ConsentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConsentsController());
  }
}
