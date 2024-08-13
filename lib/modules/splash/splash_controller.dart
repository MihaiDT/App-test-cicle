import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/badges_service.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/menses_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/repository/settings_service.dart';
import 'package:lines/routes/routes.dart';

class SplashPageController extends GetxController {
  SplashPageController() {
    _init();
  }

  void _init() async {
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.logo,
      (callback) async {
        if (appController.user.responseHandler.isFailed) {
          _startAnimation();
        } else if (appController.user.responseHandler.isSuccessful) {
          if (appController.user.value?.routeAfterLogin == "main") {
            Get.offAllNamed(Routes.main);
          } else if (appController.user.value?.routeAfterLogin ==
              "complete_profile") {
            Get.offAllNamed(Routes.welcome);
            Get.toNamed(Routes.lastMensesPage);
          } else {
            Get.offAllNamed(Routes.login);
          }
        }
      },
    );

    final String authToken = await Get.find<SecureStorageManager>().getToken();
    await SettingsService.fetchSettings();

    /// If the token is not empty and it's the first access, the saved token is removed
    if (authToken.isNotEmpty && HiveManager.firstAccess) {
      Get.find<SecureStorageManager>().saveToken("");
      HiveManager.firstAccess = false;
    }

    await AuthenticationService.fetchUser();

    if ((appController.user.value?.appConsents ?? false) == false) {
      await AuthenticationService.logout();
      Get.offAllNamed(Routes.welcome);

      return;
    }

    await AdvicesService.fetchArticles();
    await AdvicesService.fetchSuggestedArticles();
    await AdvicesService.fetchSingleArticle("");
    await CalendarService.symptomCategories;
    await CalendarService.homePageSymptomCategories;
    await CalendarService.symptomsDiaryHistory();

    await MensesService.statisticPeriod;
    await MensesService.mensesStatistics;
    await ProductService.products;
    await ProductService.mission;
    await BadgesService.wallet;
  }

  void _pageTransition() {
    Get.toNamed(
      Routes.welcome,
    );
  }

  void _startAnimation() async {
    if (appController.settings.responseHandler.isSuccessful) {
      await wait(seconds: 1);
      _pageTransition();
    }
  }
}
