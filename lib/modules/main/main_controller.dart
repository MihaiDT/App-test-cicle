import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/modules/welcome_quiz/widgets/welcome_quiz_alert_dialog.dart';

import '../../widgets/layouts/app_scaffold_controller.dart';
import '../home/home_controller.dart';

class MainController extends AppScaffoldController {
  final RxInt rxTabIndex = 0.obs;

  int get tabIndex => rxTabIndex.value;

  set tabIndex(int newValue) => rxTabIndex.value = newValue;

  late final HomeController homeController;

  @override
  void onReady() {
    super.onReady();
    _showWelcomeQuizAlertDialog;
  }

  void get _showWelcomeQuizAlertDialog {
    final int numberOfAccess = HiveManager.numberOfAccess;

    if (numberOfAccess > 1 && numberOfAccess < 4) {
      showErrorDialog(
        context: Get.context!,
        builder: (_) => WelcomeQuizAlertDialog(),
      );
    }
    HiveManager.numberOfAccess = numberOfAccess + 1;
  }

  MainController() {
    homeController = Get.put(HomeController());
  }

  onTapBottomNavigationBarMenu({required int selectedTab}) async {
    tabIndex = selectedTab;
  }
}
