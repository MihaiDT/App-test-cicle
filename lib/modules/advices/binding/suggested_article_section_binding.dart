import 'package:get/get.dart';
import 'package:lines/modules/advices/controllers/suggested_article_section_controller.dart';

class SuggestedArticleSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuggestedArticleSectionController());
  }
}
