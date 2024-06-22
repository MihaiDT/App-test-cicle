import 'package:braze_plugin/braze_plugin.dart';
import 'package:lines/core/helpers/push_notification.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/flavors.dart';

Future<void> sendBrazeData() async {
  if (await PushNotification.isPushPermissionEnabled()) {
    final token = await PushNotification.getToken();

    final String? deepcubeId = appController.user.value?.deepcubeId;

    if ((F.appFlavor?.isProdFlavor ?? false) &&
        token != null &&
        deepcubeId != null) {
      BrazePlugin braze = BrazePlugin();
      braze.changeUser(deepcubeId);
      braze.registerPushToken(token);
    }
  }
}
