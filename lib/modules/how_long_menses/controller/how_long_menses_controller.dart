import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';

class HowLongMensesController extends GetxController {
  int mensesDuration = 5;

  int howOftenMensesValue = 28;

  void onButtonPressed() {
    appController.updateUserParameters.periodDays = mensesDuration;
    appController.updateUserParameters.periodDuration = howOftenMensesValue;
    AdjustManager.trackEvent(
      AjustEventType.mensesDurationConfirmed,
    );

    PiwikManager.trackEvent(
      PiwikEventType.registration,
      action: 'step 7 optional - period duration',
    );
    Get.toNamed(Routes.referral);
  }
}
