import 'package:get/get.dart';
import 'package:lines/modules/confirm_conditions/confirm_condition_controller.dart';

class ConfirmConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmConditionController>(() => ConfirmConditionController());
  }
}
