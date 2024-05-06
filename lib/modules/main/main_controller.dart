import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/controllers/advices_controller.dart';
import 'package:lines/modules/prizes/controller/prizes_controller.dart';

import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/routes/routes.dart';

class MainController extends GetxController {
  final RxInt rxTabIndex = 0.obs;

  int get tabIndex => rxTabIndex.value;

  set tabIndex(int newValue) => rxTabIndex.value = newValue;

  void onTapBottomNavigationBarMenu({required int selectedTab}) async {
    tabIndex = selectedTab;
    _lazyInit(tabIndex);
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
  }

  @override
  void onReady() {
    super.onReady();
    if (appController.hasUsedDeepLink.value) {
      Get.toNamed(Routes.cookie);
    }
  }
}
