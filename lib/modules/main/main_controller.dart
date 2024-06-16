import 'package:get/get.dart';
import 'package:lines/core/helpers/braze.dart';
import 'package:lines/core/helpers/keyboard.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/controllers/advices_controller.dart';
import 'package:lines/modules/prizes/controller/prizes_controller.dart';

import 'package:lines/modules/home/home_controller.dart';
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
    }
  }

  @override
  void onInit() {
    super.onInit();

    _lazyInit(tabIndex);

    sendBrazeData();
  }

  @override
  void onReady() {
    super.onReady();

    dismissKeyboard(Get.context!);

    if (appController.hasUsedDeepLink.value) {
      Get.toNamed(Routes.cookie);
    }
  }
}
