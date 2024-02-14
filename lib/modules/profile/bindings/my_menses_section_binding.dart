import 'package:get/get.dart';
import 'package:lines/modules/profile/controllers/my_menses_section_controller.dart';

class MyMensesSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyMensesSectionController>(() => MyMensesSectionController());
  }
}
