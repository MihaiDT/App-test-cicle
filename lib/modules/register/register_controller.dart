import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/regex_extension.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/repository/parameters_class/social_login_parameter.dart';
import 'package:lines/repository/social_service.dart';
import 'package:lines/routes/routes.dart';

class RegisterController extends GetxController {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxString emailError = "".obs;

  RxBool isButtonPending = false.obs;

  RxBool isSocialLogin = false.obs;

  RxBool canProceed = false.obs;

  final RxBool _hidePassword = RxBool(true);

  bool get hidePassword => _hidePassword.value;

  set hidePassword(bool value) {
    _hidePassword.value = value;
  }

  late final Worker checkEmailEver;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });

    checkEmailEver = ever(
      appController.checkEmail.rxValue,
      condition: () => Get.currentRoute == Routes.register,
      (callback) {
        if (callback.isPending) {
          isButtonPending.value = true;
        } else if (callback.isSuccessful) {
          isButtonPending.value = false;
          if (callback.content?.emailExists == false) {
            /// Save in the state email and password values
            if (appController.registerParameter.registrationProvider ==
                RegistrationProvider.email) {
              appController.registerParameter.email = emailController.text;
              appController.registerParameter.password = password;
            }

            AdjustManager.trackEvent(AjustEventType.registration, {
              "createdBy":
                  appController.registerParameter.registrationProvider?.name ??
                      "email",
            });
            PiwikManager.trackEvent(
              PiwikEventType.registration,
              action: 'step 2 - registration method',
              name:
                  appController.registerParameter.registrationProvider?.name ??
                      "email",
            );

            Get.offAndToNamed(Routes.nameSurname);
          } else if (callback.content?.emailExists == true &&
              callback.content?.emailIsActive == false) {
            appController.registerParameter = RegistrationParameters.initial();
            appController.socialLoginParameter = SocialLoginParameter.initial();

            _showValidateEmailDialog();
          } else {
            appController.registerParameter = RegistrationParameters.initial();
            appController.socialLoginParameter = SocialLoginParameter.initial();

            appController.isLoginFlow.value = true;

            emailController.text = '';
            passwordController.text = '';

            Get.offAndToNamed(Routes.login);
          }
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();

    checkEmailEver.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> setRegistrationProvider(
    RegistrationProvider registrationProvider,
  ) async {
    await SocialService.executeSocialLogin(
      registrationProvider: registrationProvider,
    );
    appController.registerParameter.registrationProvider = registrationProvider;
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
    if (canProceed.value) {
      /// Check if email exists and if it's active
      await AuthenticationService.checkEmail(emailController.text);
    }
  }

  void _showValidateEmailDialog() {
    showErrorDialog(
      context: Get.context!,
      builder: (_) {
        return ActivateEmailDialog(
          email: email,
        );
      },
    );
  }

  String? get password =>
      passwordController.text.isEmpty ? null : passwordController.text;

  String get email =>
      appController.socialLoginParameter.email ?? emailController.text;

  /// Check if the email is valid using a regex
  bool isEmailValid() {
    return RegexUtils.isEmail(email);
  }
}
