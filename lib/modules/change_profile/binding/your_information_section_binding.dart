import 'package:get/get.dart';
import 'package:lines/modules/change_profile/controller/your_information_section_controller.dart';

class YourInformationSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourInformationSectionController>(
      () => YourInformationSectionController(),
    );
  }
}
