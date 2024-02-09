import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/check_email.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/social_login_parameter.dart';
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
      log.logApiException(e);
    }
  }

  static Future<void> socialLoginUser(
    SocialLoginParameter socialLoginParameter,
  ) async {
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/auth/social_login",
        data: socialLoginParameter.toJson(),
      );

      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
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
          "user": registerParameter
            ..socialToken = userIDFromDB
            ..toJson(),
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> updateUser(
    UpdateUserParameters user,
  ) async {
    final userId = HiveManager.userId;
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.put(
        "/users/$userId",
        data: {
          "user": user.toJson(),
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.pending();
      log.logApiException(e);
    }
  }

  static Future<void> completeUserRegistration(
    UpdateUserParameters updateUserParameters,
  ) async {
    final userId = HiveManager.userId;

    appController.user.responseHandler = ResponseHandler.pending();

    try {
      final response = await dio.post(
        "/users/$userId/complete_profile",
        data: {
          "user": {
            "invitation_code": updateUserParameters.referralCode,
            "last_menstruation_date_start":
                updateUserParameters.formattedLastMenstruationDateStart,
            "last_menstruation_date_end":
                updateUserParameters.formattedLastMenstruationDateEnd,
            "period_days": updateUserParameters.periodDays,
            "period_duration": updateUserParameters.periodDuration,
          },
        },
      );

      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  /// Check if the email is already registered and it's active
  static Future<void> checkEmail(String email) async {
    appController.checkEmail.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/auth/check_email",
        data: {
          "email": email,
        },
      );
      _saveCheckEmail(response);
    } catch (e) {
      appController.checkEmail.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> sendActivationLink(String email) async {
    try {
      await dio.post(
        "/auth/send_activation_link",
        data: {
          "email": email,
        },
      );
    } catch (e) {
      log.logApiException(e);
    }
  }

  static void _saveUserInfo(Response response) async {
    appController.user.responseHandler = ResponseHandler.successful(
      content: User.fromJson(
        response.data,
      ),
    );
    HiveManager.userId = appController.user.value?.userId ?? "";
    await _saveAccessTokenInDB(response.data['user']['session_token']);
  }

  /// Save accessToken in secure storage
  static Future<void> _saveAccessTokenInDB(String? accessToken) async {
    if (accessToken?.isNotEmpty == true) {
      await Get.find<SecureStorageManager>().saveToken(
        accessToken!,
      );
    }
  }

  static void _saveCheckEmail(Response response) {
    appController.checkEmail.responseHandler = ResponseHandler.successful(
      content: CheckEmail.fromJson(
        response.data,
      ),
    );
  }

  static String get userIDFromDB {
    return HiveManager.userId;
  }
}
