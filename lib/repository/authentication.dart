import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';

class Authentication {
  Future<void> loginUser(LoginParameters loginParameters) async {
    final response = await dio.post(
      "/auth/login",
      data: {
        "email": loginParameters.email,
        "password": loginParameters.password,
      },
    );

    print("response");
    print(response.data);
  }

  Future<void> registration(RegisterParameter registerParameter) async {
    appController.user?.responseHandler = ResponseHandler.pending();
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
      appController.user?.responseHandler = ResponseHandler.successful(
        content: User.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      appController.user?.responseHandler = ResponseHandler.failed();
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
  final String birthdate;
  final String email;
  final String firstName;
  final String lastName;

  /// The registration method, with Email, Apple, Google, Facebook
  final RegistrationProvider registrationProvider;
  final String? legalGuardianEmail;
  final String? nickname;
  final String? password;
  final bool privacyPolicy;
  final bool privacyMarketingEmail;

  RegisterParameter({
    required this.birthdate,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.registrationProvider,
    this.legalGuardianEmail,
    this.nickname,
    this.password,
    this.privacyPolicy = false,
    this.privacyMarketingEmail = false,
  });
}

enum RegistrationProvider {
  email,
  apple,
  facebook,
  google,
}
