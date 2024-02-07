import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/social_registration_parameters.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialService {
  static Future<bool> executeSocialLogin({
    required RegistrationProvider registrationProvider,
  }) async {
    switch (registrationProvider) {
      case RegistrationProvider.google:
        return await googleSignIn();
      case RegistrationProvider.facebook:
        return await facebookSignIn();
      case RegistrationProvider.apple:
        return await appleSignIn();
    }
  }

  static Future<bool> appleSignIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    return _validateEmail(
      credential.email!,
      credential.identityToken!,
      RegistrationProvider.apple,
    );
  }

  static Future<bool> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignIn.currentUser != null) {
      final auth = await googleSignInAccount?.authentication;
      final token = auth?.idToken;
      print(
        'Google ID: ${googleSignIn.currentUser?.id}\n'
        ' Email: ${googleSignIn.currentUser?.email}\n'
        ' ID Token: $token',
      );
    }
    return _validateEmail(
      googleSignIn.currentUser!.email,
      googleSignIn.currentUser!.id,
      RegistrationProvider.google,
    );
  }

  static Future<bool> facebookSignIn() async {
    // By default the login method has the next permissions ['email','public_profile']
    LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance
          .getUserData(fields: "first_name, last_name, email");

      print(
          "Facebook ID: ${userData['id']} - ${userData['email']} - ${userData['first_name']} - ${userData['last_name']}");
      setSocialLoginParameters(
        userData['email'],
        loginResult.accessToken!.token,
        RegistrationProvider.facebook,
      );
    }
    return false;
  }

  static void setSocialLoginParameters(
    String email,
    String socialToken,
    RegistrationProvider registrationProvider,
  ) {
    appController.socialRegisterParameter.email = email;
    appController.socialRegisterParameter.socialToken = socialToken;
    appController.socialRegisterParameter.registrationProvider =
        registrationProvider;
  }

  static Future<bool> _validateEmail(
    String email,
    String identityToken,
    RegistrationProvider registrationProvider,
  ) async {
    await AuthenticationService.checkEmail(email);
    if (appController.checkEmail.value?.emailExists == true &&
        appController.checkEmail.value?.emailIsActive == true) {
      setSocialLoginParameters(
        email,
        identityToken,
        registrationProvider,
      );
      return true;
    } else {
      return false;
    }
  }
}
