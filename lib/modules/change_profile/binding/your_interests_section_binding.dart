import 'package:get/get.dart';
import 'package:lines/modules/change_profile/controller/your_interests_section_controller.dart';

class YourInterestsSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourInterestsSectionController>(
      () => YourInterestsSectionController(),
    );
  }
}
