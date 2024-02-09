import 'package:get/get.dart';
import 'package:lines/modules/advices/advices_detail_store.dart';

class AdvicesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdvicesDetailStore());
  }
}
