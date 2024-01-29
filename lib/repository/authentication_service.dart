import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

class AuthenticationService {
  static Future<void> loginUser(
    LoginParameters loginParameters,
  ) async {
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

  static Future<void> registration(
    RegistrationParameters registerParameter,
  ) async {
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

  static Future<void> updateUser(
    UpdateUserParameters user,
  ) async {
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.put(
        // todo check what is id
        "/users/:id",
        data: {
          "user": {
            "birthdate": user.birthdate,
            "email": user.email,
            "first_name": user.firstName,
            "last_menstruation_date_start": user.lastMenstruationDateStart,
            "last_menstruation_date_end": user.lastMenstruationDateEnd,
            "last_name": user.lastName,
            "legal_guardian_email": user.legalGuardianEmail,
            "nickname": user.nickname,
            "period_days": user.periodDays,
            "period_duration": user.periodDuration,
            "privacy_profiling": user.privacyProfiling,
            "privacy_marketing_email": user.privacyMarketingEmail,
          }
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.pending();
    }
  }

  static Future<void> completeUserRegistration(
    UpdateUserParameters updateUserParameters,
  ) async {
    appController.user.responseHandler = ResponseHandler.pending();

    try {
      final response = await dio.post(
        "/users/:id/complete_profile",
        data: {
          "user": {
            "invitation_code": updateUserParameters.referralCode,
            "last_menstruation_date_start":
                updateUserParameters.lastMenstruationDateStart,
            "last_menstruation_date_end":
                updateUserParameters.lastMenstruationDateEnd,
            "period_days": updateUserParameters.periodDays,
            "period_duration": updateUserParameters.periodDuration,
          },
        },
      );

      _saveUserInfo(response);
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
