import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';

class AuthenticationService {
  static Future<void> loginUser(LoginParameters loginParameters) async {
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/auth/login",
        data: {
          "email": loginParameters.email,
          "password": loginParameters.password,
        },
      );

      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
    }
  }

  static Future<void> registration(RegisterParameter registerParameter) async {
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/users",
        data: {
          "user": {
            "birthdate": registerParameter.birthdate,
            "email": registerParameter.email,
            "first_name": registerParameter.firstName,
            "last_name": registerParameter.lastName,
            "legal_guardian_email": registerParameter.legalGuardianEmail,
            "nickname": registerParameter.nickname,
            "password": registerParameter.password,
            "privacy_profiling": registerParameter.privacyPolicy,
            "privacy_marketing_email": registerParameter.privacyMarketingEmail,
            "provider": registerParameter.registrationProvider.name,
          }
        },
      );

      _saveUserInfo(response);

      await Get.find<SecureStorageManager>().saveToken(
        response.data['user']['session_token'],
      );
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
    }
  }

  static void _saveUserInfo(Response response) {
    appController.user.responseHandler = ResponseHandler.successful(
      content: User.fromJson(
        response.data,
      ),
    );

    _saveAccessTokenInDB(response.data['user']['session_token']);
  }

  /// Save accessToken in secure storage
  static Future<void> _saveAccessTokenInDB(String? accessToken) async {
    if (accessToken?.isNotEmpty == true) {
      await Get.find<SecureStorageManager>().saveToken(
        accessToken!,
      );
    }
  }
}

class LoginParameters {
  final String email;
  final String password;

  LoginParameters({
    required this.email,
    this.password = "",
  });
}

class RegisterParameter {
  /// Birthdate with yyyy-mm-dd format
  String birthdate;
  String email;
  String firstName;
  String lastName;

  /// The registration method, with Email, Apple, Google, Facebook
  RegistrationProvider registrationProvider;
  String? legalGuardianEmail;
  String? nickname;
  String? password;
  bool privacyPolicy;
  bool privacyMarketingEmail;

  RegisterParameter.initial({
    this.birthdate = "",
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.registrationProvider = RegistrationProvider.email,
    this.legalGuardianEmail,
    this.nickname,
    this.password = "",
    this.privacyPolicy = true,
    this.privacyMarketingEmail = true,
  });
}

enum RegistrationProvider {
  email,
  apple,
  facebook,
  google,
}
