import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/settings_service.dart';
import 'package:lines/routes/routes.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.logo,
      (callback) async {
        if (appController.user.responseHandler.isFailed) {
          _startAnimation();
        } else if (appController.user.responseHandler.isSuccessful) {
          if (appController.user.value?.routeAfterLogin == "complete_profile") {
            Get.offAndToNamed(Routes.lastMensesPage);
          } else {
            Get.offAndToNamed(Routes.main);
          }
        }
      },
    );

    await SettingsService.fetchSettings();
    await AuthenticationService.fetchUser();
    await AdvicesService.fetchArticles();
  }

  void _pageTransition() {
    Get.toNamed(
      Routes.welcome,
    );
  }

  _startAnimation() async {
    if (appController.settings.responseHandler.isSuccessful) {
      await wait(seconds: 1);
      _pageTransition();
    }
  }
}
