import 'package:get/get.dart';
import 'package:lines/modules/drawer/controller/drawer_main_page_controller.dart';

class DrawerMainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerMainPageController>(() => DrawerMainPageController());
  }
}
