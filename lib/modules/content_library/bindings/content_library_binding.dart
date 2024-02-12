import 'package:get/get.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';

class ContentLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContentLibraryController());
  }
}
