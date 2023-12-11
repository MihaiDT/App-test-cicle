import 'package:get/get.dart';
import '../home/home_controller.dart';

import '../../widgets/layouts/app_scaffold_controller.dart';

class MainController extends AppScaffoldController {
  final RxInt rxTabIndex = 0.obs;
  int get tabIndex => rxTabIndex.value;
  set tabIndex(int newValue) => rxTabIndex.value = newValue;

  late final HomeController homeController;

  MainController() {
    homeController = Get.put(HomeController());
  }

  onTapBottomNavigationBarMenu({required int selectedTab}) async {
    tabIndex = selectedTab;
  }
}
