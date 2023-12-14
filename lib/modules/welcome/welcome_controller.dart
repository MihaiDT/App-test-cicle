import 'package:get/get.dart';
import 'package:lines/modules/register/register_and_login_page.dart';

import '../../core/utils/helpers.dart';
import '../../routes/routes.dart';
import '../../widgets/layouts/app_scaffold_controller.dart';

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
    Get.toNamed(
      Routes.registerAndLogin,
      arguments: RegisterAndLoginPageArguments(
        isLoginPage: false,
      ),
    );
  }

  /// Private methods
  void _startAnimation() async {
    await wait(milliseconds: 300);
    startAnimation = true;
  }
}
