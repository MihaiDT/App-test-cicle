import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  final isNotificationEnabled = false.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }

  void openSettings() async {
    const String url = 'app-settings:';
    await launchUrl(Uri.parse(url));
  }
}
