import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/regex_extension.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/modules/birth_date/widget/too_young_error_dialog.dart';
import 'package:lines/modules/login/widget/forgot_password_bottomsheet.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/modules/register/widget/email_does_not_exists.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/repository/parameters_class/social_login_parameter.dart';
import 'package:lines/repository/social_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class LoginController extends GetxController {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final Worker checkEmailEver;
  late final Worker userEver;

  RxString emailValue = "".obs;
  RxBool isButtonPending = false.obs;
  RxBool isSocialLogin = false.obs;
  RxBool hidePassword = true.obs;

  RxBool canProceed = false.obs;

  @override
  void onInit() {
    super.onInit();

    appController.user = EasyGetter<User>();

    emailController.addListener(() {
      emailValue.value = emailController.text;
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      canProceed.value = isEmailValid() && passwordController.text.isNotEmpty;
    });

    /// Check if email exists and if it's active
    checkEmailEver = ever(
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
    userEver = ever(
      appController.user.rxValue,
      condition: () =>
          Get.currentRoute == Routes.login &&
          appController.checkEmail.responseHandler.isSuccessful,
      (userStatus) async {
        if (userStatus.isPending) {
          isButtonPending.value = true;
        }
        if (userStatus.isFailed) {
          appController.registerParameter = RegistrationParameters.initial();
          appController.socialLoginParameter = SocialLoginParameter.initial();

          if (userStatus.errorType == ErrorType.registerByEmail) {
            FlushBar(
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: HeadlineSmall(
                  "Effettua la login utilizzando e-mail e password",
                  color: ThemeColor.darkBlue,
                ),
              ),
            ).show(Get.context!);
          } else if (userStatus.errorType == ErrorType.wrongPassword ||
              userStatus.errorType == ErrorType.userNotFound) {
            FlushBar(
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: HeadlineSmall(
                  "Password errata",
                  color: ThemeColor.darkBlue,
                ),
              ),
            ).show(Get.context!);
          }

          isButtonPending.value = false;
        }
        if (userStatus.isSuccessful) {
          AdjustManager.trackEvent(AjustEventType.login);

          PiwikManager.trackEvent(
            PiwikEventType.login,
            action:
                appController.registerParameter.registrationProvider?.name ??
                    "email",
          );

          isButtonPending.value = false;

          if (appController.user.value?.appConsents == false) {
            /// If user has less than 14 years show the dialog and cancel the login
            if (appController.user.value?.hasMoreThan14Years == false) {
              Get.dialog(const TooYoungErrorDialog());

              /// If user has more than 14 years but less than 18 years
              /// needs the confirm from the tutor by email
            } else if (appController.user.value?.hasMoreThan18Years == false) {
              Get.toNamed(Routes.changeTutorEmailPage);
            } else if (appController.user.value?.isCreatedBeforeLive == true) {
              /// Privacy user registered before go live
              Get.toNamed(Routes.privacyOldRegistration);
            } else {
              /// Send confirm email
              await AuthenticationService.sendConsentsEmail();
              Get.toNamed(Routes.confirmCondition);
            }
          } else if (appController.user.value?.routeAfterLogin ==
              "complete_profile") {
            Get.offAllNamed(Routes.lastMensesPage);
          } else {
            Get.offAllNamed(Routes.main);
          }
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();

    userEver.dispose();
    checkEmailEver.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
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
        cookieProfiling: HiveManager.hasAcceptedCookieProfiling ?? false,
        cookieStats: HiveManager.hasAcceptedCookieStats ?? false,
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
