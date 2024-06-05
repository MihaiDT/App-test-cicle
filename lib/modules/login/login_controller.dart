import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/regex_extension.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/birth_date/widget/too_young_error_dialog.dart';
import 'package:lines/modules/login/widget/forgot_password_bottomsheet.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/modules/register/widget/email_does_not_exists.dart';
import 'package:lines/modules/tutor_email/tutor_email_arguments.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/repository/social_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoginController extends GetxController {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailValue = "".obs;
  RxBool isButtonPending = false.obs;
  RxBool isSocialLogin = false.obs;
  RxBool hidePassword = true.obs;

  RxBool canProceed = false.obs;

  LoginController() {
    /// Check if email exists and if it's active
    ever(
      appController.checkEmail.rxValue,
      condition: () => Get.currentRoute == Routes.login,
      (callback) async {
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
            // FIXME: test this
            if (appController.socialLoginParameter.registrationProvider
                    ?.isSocialProvider ==
                true) {
              await AuthenticationService.socialLoginUser(
                appController.socialLoginParameter,
              );
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
      appController.user.rxValue,
      condition: () =>
          Get.currentRoute == Routes.login &&
          appController.checkEmail.responseHandler.isSuccessful,
      (userStatus) async {
        if (userStatus.isPending) {
          isButtonPending.value = true;
        }
        if (userStatus.isFailed) {
          if (userStatus.errorType == ErrorType.wrongPassword) {
            FlushBar(
              child: const Text(
                "Password errata",
              ),
            ).show(Get.context!);
          }
          isButtonPending.value = false;
        }
        if (userStatus.isSuccessful) {
          AdjustManager.trackEvent(EventType.login);

          isButtonPending.value = false;

          if (appController.user.value?.appConsents == false) {
            /// If user has less than 14 years show the dialog and cancel the login
            if (appController.user.value?.hasMoreThan14Years == false) {
              Get.dialog(const TooYoungErrorDialog());

              /// If user has more than 14 years but less than 18 years
              /// needs the confirm from the tutor by email
            } else if (appController.user.value?.hasMoreThan18Years == false) {
              Get.toNamed(
                Routes.tutorEmailPage,
                arguments: TutorEmailArguments(
                  onContinue: (tutorEmail) async {
                    await AuthenticationService.sendConsentsEmail(tutorEmail);
                    Get.offAndToNamed(
                      Routes.confirmTutorEmail,
                      arguments: tutorEmail,
                    );
                  },
                ),
              );
            } else {
              /// Send confirm email
              await AuthenticationService.sendConsentsEmail();
              Get.toNamed(Routes.confirmEmailPage);
            }
          } else if (appController.user.value?.routeAfterLogin ==
              "complete_profile") {
            Get.offAndToNamed(Routes.lastMensesPage);
          } else {
            Get.offAndToNamed(Routes.main);
          }
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      emailValue.value = emailController.text;
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });
  }

  @override
  void onClose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> onButtonPressed() async {
    await AuthenticationService.checkEmail(emailController.text);
  }

  Future<void> socialLogin(RegistrationProvider registrationProvider) async {
    await SocialService.executeSocialLogin(
      registrationProvider: registrationProvider,
    );
  }

  Future<void> loginUser(String email, String password) async {
    await AuthenticationService.loginUser(
      LoginParameters(
        email: email,
        password: password,
        cookieProfiling: HiveManager.hasAcceptedCookieProfiling,
        cookieStats: HiveManager.hasAcceptedCookieStats,
      ),
    );
  }

  /// Show the dialog for email that does not exist
  void _showEmailDoesNotExists() {
    showErrorDialog(
      context: Get.context!,
      builder: (_) {
        return const EmailDoesNotExists();
      },
    );
  }

  /// Show the dialog for email that exist but is not active
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

  String get email =>
      appController.socialLoginParameter.email ?? emailController.text;

  /// Open the bottomsheet to recover the password
  void onForgotPasswordTap(BuildContext context) async {
    final TextEditingController emailController = TextEditingController();
    await Get.bottomSheet(
      ForgotPasswordBottomsheet(
        controller: emailController,
        onConfirm: (email) async {
          await AuthenticationService.recoverPassword(email);
        },
      ),
    );
  }

  /// Check if the email is valid using a regex
  bool isEmailValid() {
    return RegexUtils.isEmail(email);
  }
}
