import 'package:get/get.dart';
import 'package:lines/core/helpers/braze.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/controllers/advices_controller.dart';
import 'package:lines/modules/prizes/controller/prizes_controller.dart';

import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/profile/controllers/my_badges_controller.dart';
import 'package:lines/repository/badges_service.dart';
import 'package:lines/routes/routes.dart';

class MainController extends GetxController {
  final RxInt rxTabIndex = 0.obs;

  int get tabIndex => rxTabIndex.value;

  set tabIndex(int newValue) => rxTabIndex.value = newValue;

  void onTapBottomNavigationBarMenu({required int selectedTab}) async {
    tabIndex = selectedTab;
    _lazyInit(tabIndex);

    if (tabIndex == 3) {
      await BadgesService.fetchBadges();
    }
  }

  void _lazyInit(int selectedTab) {
    switch (selectedTab) {
      case 0:
        Get.put(
          HomeController(),
        );
      case 1:
        Get.put(
          AdvicesController(),
        );
      case 2:
        Get.put(
          PrizesController(),
        );
      case 3:
        Get.put(
          MyBadgesController(),
        );
    }
  }

  @override
  void onInit() {
    super.onInit();

    _lazyInit(tabIndex);
    _initSurveyTutorial();

    sendBrazeData();
  }

  void _initSurveyTutorial() {
    HiveManager.showSecondTutorialAccess = false;

    HiveManager.welcomeSurveyNumberOfAccess += 1;

    /// Viene mostrata i primi 3 accessi in app, però SOLO 1 volta al giorno.
    /// I primi 3 accessi partono dal 2' accesso in modo da non sovrapporsi al tutorial.
    if (HiveManager.welcomeSurveyTotalAccess > 1 &&
        HiveManager.welcomeSurveyTotalAccess < 5 &&
        HiveManager.welcomeSurveyNumberOfAccess == 1 &&
        showWelcomeQuizSection) {
      HiveManager.showSurveyTutorial = true;
    }
  }

  bool get showWelcomeQuizSection =>
      appController.user.value?.isWelcomeQuizCompleted == false;

  @override
  void onReady() {
    super.onReady();

    if (appController.hasUsedDeepLink.value) {
      Get.toNamed(Routes.cookie);
    }
  }
}
