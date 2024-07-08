import 'package:get/get.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';

class WalkthroughBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalkthroughController());
  }
}
