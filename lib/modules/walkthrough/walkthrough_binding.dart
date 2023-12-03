import 'package:get/get.dart';

import 'walkthrough_controller.dart';

class WalkthroughBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WalkthroughController());
  }
}
