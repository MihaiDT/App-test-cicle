import 'package:get/get.dart';
import 'package:lines/modules/profile/controllers/your_diary_section_controller.dart';

class YourDiarySectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourDiarySectionController>(() => YourDiarySectionController());
  }
}
