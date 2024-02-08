import 'package:get/get.dart';
import 'package:lines/modules/advices/advices_controller.dart';

import '../home/home_controller.dart';

class MainControllerV2 extends GetxController {
  final RxInt rxTabIndex = 0.obs;

  int get tabIndex => rxTabIndex.value;

  set tabIndex(int newValue) => rxTabIndex.value = newValue;

  onTapBottomNavigationBarMenu({required int selectedTab}) async {
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
    }
  }

  @override
  void onInit() {
    super.onInit();
    _lazyInit(tabIndex);
  }
}
