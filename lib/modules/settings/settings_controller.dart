import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isNotificationEnabled = false.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }
}
