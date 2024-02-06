import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/social_registration_parameters.dart';
import 'package:lines/repository/social_service.dart';
import 'package:lines/routes/routes.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
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
            appController.registerParameter.password = passwordController.text;
            Get.offAndToNamed(Routes.nameSurname);
          } else if (callback.content?.emailExists == true &&
              callback.content?.emailIsActive == false) {
            _showValidateEmailDialog();
          } else {
            appController.isLoginFlow.value = true;
            Get.offAndToNamed(Routes.login);
          }
        }
      },
    );
    super.onInit();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxString emailError = "".obs;

  RxBool isButtonPending = false.obs;

  RxBool isSocialLogin = false.obs;

  final RxBool _hidePassword = RxBool(true);

  bool get hidePassword => _hidePassword.value;

  set hidePassword(bool value) {
    _hidePassword.value = value;
  }

  Future<void> appleSignIn() async {
    if (await SocialService.executeSocialLogin(
      registrationProvider: RegistrationProvider.apple,
    )) {}
  }

  Future<void> googleSignIn() async {
    await SocialService.executeSocialLogin(
      registrationProvider: RegistrationProvider.google,
    );
  }

  Future<void> facebookSignIn() async {
    SocialService.facebookSignIn();
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
    /// Check if email exists and if it's active
    await AuthenticationService.checkEmail(emailController.text);
  }

  void setSocialLoginParameters(
    String email,
    String socialToken,
    RegistrationProvider registrationProvider,
  ) {
    appController.socialRegisterParameter.email = email;
    appController.socialRegisterParameter.socialToken = socialToken;
    appController.socialRegisterParameter.registrationProvider =
        registrationProvider;
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
