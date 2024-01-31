import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/routes/routes.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class RegisterAndLoginController extends GetxController {
  @override
  void onInit() {
    if (isLoginPage) {
      ever(
        appController.user.rxValue,
        (callback) {
          if (callback.isPending) {
            isButtonPending.value = true;
          }
          if (callback.isSuccessful) {
            isButtonPending.value = false;

            if (HiveManager.firstAccess) {
              Get.offAndToNamed(Routes.lastMensesPage);
            } else {
              Get.offAndToNamed(Routes.main);
            }
          }
        },
      );
    } else {
      ever(
        appController.checkEmail.rxValue,
        (callback) {
          if (callback.isPending) {
            isButtonPending.value = true;
          }
          if (callback.isSuccessful) {
            isButtonPending.value = false;
            if (callback.content?.emailExists == false) {
              /// Save in the state email and password values
              appController.registerParameter.email = emailController.text;
              appController.registerParameter.password =
                  passwordController.text;
              Get.toNamed(Routes.nameSurname);
            } else if (callback.content?.emailExists == true &&
                callback.content?.emailIsActive == false) {
              _showError();
            }
          }
        },
      );
    }
    super.onInit();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxString emailError = "".obs;

  RxBool isButtonPending = false.obs;

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

  Future<void> appleSignIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(credential);
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
    } else {
      AuthenticationService.checkEmail(emailController.text);
    }
  }

  void _showError() {
    showErrorDialog(
      context: Get.context!,
      builder: (_) {
        return ActivateEmailDialog(
          email: emailController.text,
        );
      },
    );
  }
}
