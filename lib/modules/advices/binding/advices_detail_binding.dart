import 'package:get/get.dart';
import 'package:lines/modules/advices/controllers/advices_detail_controller.dart';

class AdvicesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdvicesDetailController());
  }
}
