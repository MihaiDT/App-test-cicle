import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';

class WelcomeController extends AppScaffoldController {
  WelcomeController() {
    _startAnimation();
  }

  final RxBool rxStartAnimation = RxBool(false);

  bool get startAnimation => rxStartAnimation.value;

  set startAnimation(bool newValue) => rxStartAnimation.value = newValue;

  final RxBool rxWebServerReady = RxBool(false);

  bool get webServerReady => rxWebServerReady.value;

  set webServerReady(bool newValue) => rxWebServerReady.value = newValue;

  void onTapSignin() {
    appController.isLoginFlow.value = false;
    if (HiveManager.hasAcceptedCookie) {
      Get.toNamed(
        Routes.register,
      );
    } else {
      Get.toNamed(
        Routes.cookie,
      );
    }
  }

  void onTapLogin() {
    appController.isLoginFlow.value = true;
    if (HiveManager.hasAcceptedCookie) {
      Get.toNamed(
        Routes.login,
      );
    } else {
      Get.toNamed(
        Routes.cookie,
      );
    }
  }

  /// Private methods
  void _startAnimation() async {
    await wait(milliseconds: 300);
    startAnimation = true;
  }
}
