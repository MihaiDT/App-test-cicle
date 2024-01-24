import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';

class RegisterAndLoginController extends AppScaffoldController {
  bool get isLoginPage => appController.isLoginFlow.value;

  set isLoginPage(bool value) {
    appController.isLoginFlow.value = value;
  }

  final RxBool _hidePassword = RxBool(true);

  bool get hidePassword => _hidePassword.value;

  set hidePassword(bool value) {
    _hidePassword.value = value;
  }

  Future<void> loginUser(String email, String password) async {
    await AuthenticationService.loginUser(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
  }
}
