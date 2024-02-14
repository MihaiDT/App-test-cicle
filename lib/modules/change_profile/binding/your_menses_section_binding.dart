import 'package:get/get.dart';
import 'package:lines/modules/change_profile/controller/your_menses_section_controller.dart';

class YourMensesSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourMensesSectionController>(
        () => YourMensesSectionController());
  }
}
