import 'package:get/get.dart';
import 'package:lines/modules/content_library/content_library_search_page_controller.dart';

class ContentLibrarySearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContentLibrarySearchPageController());
  }
}
