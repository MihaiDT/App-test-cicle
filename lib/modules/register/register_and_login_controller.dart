import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/register/widget/activate_email_dialog.dart';
import 'package:lines/modules/register/widget/email_does_not_exists.dart';
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
              appController.registerParameter.password = passwordController.text;
              Get.toNamed(Routes.nameSurname);
            } else if (callback.content?.emailExists == true && callback.content?.emailIsActive == false) {
              _showValidateEmailDialog();
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

  Future<void> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email'],
      clientId: '329390092342-as1nh1ofab4tddimc2iboo5kn3jd0u3q.apps.googleusercontent.com',
    );
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignIn.currentUser != null) {
      final auth = await googleSignInAccount?.authentication;
      final token = auth?.idToken;
      print(
        'Google ID: ${googleSignIn.currentUser?.id}\n'
        ' Email: ${googleSignIn.currentUser?.email}\n'
        ' ID Token: $token',
      );
    }
  }

  Future<void> facebookSignIn() async {
    // By default the login method has the next permissions ['email','public_profile']
    LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(fields: "first_name, last_name, email");

      print(
          "Facebook ID: ${userData['id']} - ${userData['email']} - ${userData['first_name']} - ${userData['last_name']}");
    }
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

    /// Check if the actual page is the login page or registration page
    if (isLoginPage) {
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
        await loginUser(
          emailController.text,
          passwordController.text,
        );
      }
    }
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

  void _showEmailDoesNotExists() {
    showErrorDialog(
      context: Get.context!,
      builder: (_) {
        return const EmailDoesNotExists();
      },
    );
  }
}
