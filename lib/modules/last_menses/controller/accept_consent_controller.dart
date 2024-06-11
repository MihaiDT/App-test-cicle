import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class AcceptConsentController extends GetxController {
  RxBool pageIsPending = false.obs;

  void onContinue() async {
    PiwikManager.trackEvent(
      PiwikEventType.registration,
      action: 'step 7 optional - period consent denied',
    );

    pageIsPending.value = true;
    await AuthenticationService.completeUserRegistration(
      appController.updateUserParameters,
    );
    if (HiveManager.isFirstTutorialWatched) {
      Get.offAndToNamed(Routes.welcomeWalkthrough);
    } else {
      Get.offAndToNamed(Routes.main);
    }
    pageIsPending.value = false;
  }
}
