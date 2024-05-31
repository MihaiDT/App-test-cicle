import 'package:get/get.dart';
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
          /* if (appController.hasUsedDeepLink.value) {
            /// Set to false to avoid entering the same condition
            appController.hasUsedDeepLink.value = false;
            AdvicesCategory? category = appController
                .advicesCategories.value?.categories.values
                .toList()
                .first
                .advicesCategory;
            AdvicesArticle? article = appController.advicesCategories.value
                ?.categories.values.first.subCategories.first.articles.first;

            Get.offAndToNamed(
              Routes.articleDetailPage,
              arguments: AdvicesDetailPair(
                category: category!,
                article: article!,
              ),
            );
          } else*/
          if (appController.user.value?.routeAfterLogin == "main") {
            Get.offAndToNamed(Routes.main);
          } else if (appController.user.value?.routeAfterLogin == "complete_profile") {
            Get.offAndToNamed(Routes.welcome);
            Get.toNamed(Routes.lastMensesPage);
          } else {
            Get.offAndToNamed(Routes.login);
          }
        }
      },
    );
    final String authToken = await Get.find<SecureStorageManager>().getToken();

    /// If the token is not empty and it's the first access, the saved token is removed
    if (authToken.isNotEmpty && HiveManager.firstAccess) {
      Get.find<SecureStorageManager>().saveToken("");
      HiveManager.firstAccess = false;
    }
    await SettingsService.fetchSettings();
    await AdvicesService.fetchArticles();
    await AdvicesService.fetchSuggestedArticles();
    await AdvicesService.fetchSingleArticle("");
    await CalendarService.symptomCategories;
    await CalendarService.homePageSymptomCategories;
    await BadgesService.fetchBadges();
    await MensesService.statisticPeriod;
    await MensesService.mensesStatistics;
    await ProductService.products;
    await ProductService.mission;
    await BadgesService.wallet;
    await AuthenticationService.fetchUser();
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
