import 'package:get/get.dart';
import 'package:lines/modules/profile/controllers/profile_completion_percentage_controller.dart';

class ProfileCompletionPercentageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileCompletionPercentageController>(
      () => ProfileCompletionPercentageController(),
    );
  }
}
