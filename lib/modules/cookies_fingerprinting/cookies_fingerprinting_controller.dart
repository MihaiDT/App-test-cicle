import 'package:get/get.dart';

class CookiesFingerprintingController extends GetxController {
  late final bool isEditing;

  CookiesFingerprintingController() {
    isEditing = Get.arguments as bool? ?? false;
  }
}
