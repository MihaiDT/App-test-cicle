import 'dart:io';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialService {
  static Future<void> executeSocialLogin({
    required RegistrationProvider registrationProvider,
  }) async {
    switch (registrationProvider) {
      case RegistrationProvider.google:
        await googleSignIn();
        break;
      case RegistrationProvider.facebook:
        await facebookSignIn();
        break;
      case RegistrationProvider.facebookIOS:
        await facebookSignIn();
        break;
      case RegistrationProvider.apple:
        await appleSignIn();
        break;
      case RegistrationProvider.email:
        break;
    }
  }

  static Future<void> appleSignIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    await _saveUserData(
      credential.givenName!,
      credential.familyName!,
      credential.email!,
      // credential.identityToken!,
    );

    await _validateEmail(
      credential.email!,
      credential.identityToken!,
      RegistrationProvider.apple,
    );
  }

  static Future<void> googleSignIn() async {
    GoogleSignIn googleSignIn = Platform.isAndroid
        ? GoogleSignIn(scopes: ['email'])
        : GoogleSignIn(
            scopes: ['email'],
            clientId:
                '329390092342-as1nh1ofab4tddimc2iboo5kn3jd0u3q.apps.googleusercontent.com',
          );

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignIn.currentUser != null) {
      final auth = await googleSignInAccount?.authentication;

      await _validateEmail(
        googleSignIn.currentUser!.email,
        auth!.idToken!,
        RegistrationProvider.google,
      );

      await _saveUserData(
        "",
        "",
        googleSignIn.currentUser!.email,
        // googleSignIn.currentUser!.id,
      );
    }
  }

  static Future<void> facebookSignIn() async {
    // By default the login method has the next permissions ['email','public_profile']
    LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(
        fields: "first_name, last_name, email",
      );

      _validateEmail(
        userData['email'],
        loginResult.accessToken!.tokenString,
        Platform.isIOS
            ? RegistrationProvider.facebookIOS
            : RegistrationProvider.facebook,
      );

      await _saveUserData(
        "",
        "",
        userData['email'],
        // userData['id'],
      );
    }
  }

  static Future<void> _validateEmail(
    String email,
    String identityToken,
    RegistrationProvider registrationProvider,
  ) async {
    _setSocialLoginParameters(
      email,
      identityToken,
      registrationProvider,
    );
    await AuthenticationService.checkEmail(email);
  }

  static void _setSocialLoginParameters(
    String email,
    String socialToken,
    RegistrationProvider registrationProvider,
  ) {
    appController.socialLoginParameter.email = email;
    appController.socialLoginParameter.registrationProvider =
        registrationProvider;
    appController.socialLoginParameter.token = socialToken;

    appController.registerParameter.email = email;
    appController.registerParameter.registrationProvider = registrationProvider;
    appController.registerParameter.socialToken = socialToken;
  }

  static Future<void> _saveUserData(
    String name,
    String lastName,
    String email,
    // String id,
  ) async {
    appController.registerParameter.firstName = name;
    appController.registerParameter.lastName = lastName;
    appController.registerParameter.email = email;

    // HiveManager.userId = id;
  }
}
