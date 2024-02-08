import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/modules/register/widget/email_does_not_exists.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/repository/social_service.dart';
import 'package:lines/routes/routes.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxString emailError = "".obs;

  RxBool isButtonPending = false.obs;
  RxBool isSocialLogin = false.obs;
  bool hidePassword = true;

  @override
  void onInit() {
    super.onInit();

    /// Check if email exists and if it's active
    ever(
      appController.checkEmail.rxValue,
      (callback) {
        if (callback.isPending) {
          isButtonPending.value = true;
        }
        if (callback.isSuccessful) {
          isButtonPending.value = false;

          /// Check if the actual page is the login page or registration page
          /// If the email doesn't exists show the dialog
          if (appController.checkEmail.value?.emailExists == false) {
            _showEmailDoesNotExists();
          }

          /// If the email is not active show the dialog
          else if (appController.checkEmail.value?.emailIsActive == false) {
            _showValidateEmailDialog();
          }

          /// If the email exists and is active login the user
          else if (appController.checkEmail.value?.emailIsValid == true) {
            // FIXME: here user in appController is not initialized yet
            if (appController.user.value!.provider?.registrationProvider
                    ?.isSocialProvider ==
                true) {
              socialLogin(RegistrationProvider.email);
            } else {
              loginUser(
                emailController.text,
                passwordController.text,
              );
            }
          }
        }
      },
    );
    ever(
      condition: appController.checkEmail.responseHandler.isSuccessful,
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
  }

  Future<void> onButtonPressed() async {
    await AuthenticationService.checkEmail(emailController.text);
  }

  Future<void> socialLogin(RegistrationProvider registrationProvider) async {
    await SocialService.executeSocialLogin(
      registrationProvider: registrationProvider,
    );
    await AuthenticationService.socialLoginUser(
      appController.socialLoginParameter,
    );
  }

  void validateEmail(String text) {
    print('Email validated');
  }

  Future<void> loginUser(String email, String password) async {
    await AuthenticationService.loginUser(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
  }

  void _showEmailDoesNotExists() {
    showErrorDialog(
      context: Get.context!,
      builder: (_) {
        return const EmailDoesNotExists();
      },
    );
  }

  void _showValidateEmailDialog() {
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
