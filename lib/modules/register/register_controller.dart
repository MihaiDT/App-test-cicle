import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';

class RegisterAndLoginController extends AppScaffoldController {
  final RxBool _isLoginPage = RxBool(false);

  bool get isLoginPage => _isLoginPage.value;

  set isLoginPage(bool value) {
    _isLoginPage.value = value;
  }

  final RxBool _hidePassword = RxBool(true);

  bool get hidePassword => _hidePassword.value;

  set hidePassword(bool value) {
    _hidePassword.value = value;
  }

  @override
  void onInit() {
    isLoginPage = Get.arguments.isLoginPage;

    super.onInit();
  }

  Future<void> loginUser() async {
    Authentication authentication = Authentication();
    await authentication.loginUser(
      LoginParameters(
        email: "m.fiore@tandu.it",
        password: "Password1!",
      ),
    );
  }

  Future<void> registrateUser() async {
    Authentication auth = Authentication();
    await auth.registration(
      RegisterParameter(
        birthdate: "2000-01-01",
        email: "d.spano+1@gmail.com",
        firstName: "Danilo",
        password: "Danilo1!",
        lastName: "Spano",
        registrationProvider: RegistrationProvider.email,
      ),
    );
  }
}
