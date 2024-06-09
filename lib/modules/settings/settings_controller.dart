import 'package:get/get.dart';
import 'package:app_settings/app_settings.dart';

class SettingsController extends GetxController {
  final isNotificationEnabled = false.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }

  void openSettings() async {
    await AppSettings.openAppSettings(
      type: AppSettingsType.notification,
      asAnotherTask:
          true, // Android If asAnotherTask is set to true, the settings page is opened in a different Activity.
    );
  }
}
