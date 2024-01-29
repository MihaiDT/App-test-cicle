import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/routes/routes.dart';

class RegisterAndLoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxString emailError = "".obs;

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

  /// Check if email is valid for the regex
  void validateEmail() {
    if (!GetUtils.isEmail(emailValue.value)) {
      emailError.value = "Email non valida";
    } else {
      emailError.value = "";
    }
  }

  Future<void> onButtonPressed() async {
    if (isLoginPage) {
      await loginUser(
        emailController.text,
        passwordController.text,
      );
      if (appController.user.responseHandler.isSuccessful) {
        Get.offAndToNamed(Routes.main);
      }
    } else {
      /// Save in the state email and password values
      appController.registerParameter.email = emailController.text;
      appController.registerParameter.password = passwordController.text;
      Get.toNamed(Routes.nameSurname);
    }
  }
}
