import 'package:get/get.dart';
import 'package:lines/modules/profile/controllers/profile_header_controller.dart';

class ProfileHeaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileHeaderController>(() => ProfileHeaderController());
  }
}
