import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:lines/core/error/error_manager.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/check_email.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/data/models/validate_referral_code.dart';
import 'package:lines/repository/parameters_class/login_parameters.dart';
import 'package:lines/repository/parameters_class/registration_parameters.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
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
      appController.user.responseHandler = ResponseHandler.failed(
        errorType: ErrorManager.checkError(e),
      );
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
        data: {
          "provider": socialLoginParameter.registrationProvider?.name,
          "email": socialLoginParameter.email,
          "token": socialLoginParameter.token,
        },
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
    if (registerParameter.registrationProvider != RegistrationProvider.email) {
      registerParameter.socialToken = userIDFromDB;
    }
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/users",
        data: {
          "user": registerParameter.toJson(),
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> updatePrivacy(
    UpdateUserParameters user,
  ) async {
    final userID = userIDFromDB;

    /// Takes the email from the user saved into state
    final email = appController.user.value?.email ?? '';
    user.email = email;

    user.hasConsentCookie = HiveManager.hasAcceptedCookie;
    appController.user.responseHandler = ResponseHandler.pending(
      content: appController.user.value,
    );
    try {
      final response = await dio.post(
        "/users/$userID/update_privacy",
        data: {
          "user": user.toJson(),
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
    final userID = userIDFromDB;

    /// Takes the email from the user saved into state
    final email = appController.user.value?.email ?? '';
    user.email = email;

    user.hasConsentCookie = HiveManager.hasAcceptedCookie;
    appController.user.responseHandler = ResponseHandler.pending(
      content: appController.user.value,
    );
    try {
      final response = await dio.put(
        "/users/$userID",
        data: {
          "user": user.toJson(),
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> fetchUser() async {
    final userID = userIDFromDB;
    appController.user.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/users/$userID",
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> completeUserRegistration(
    UpdateUserParameters updateUserParameters,
  ) async {
    final userID = userIDFromDB;
    final email = appController.user.value?.email ?? '';
    final name = appController.user.value?.firstName ?? '';
    final lastName = appController.user.value?.lastName ?? '';
    final cookieConsent = HiveManager.hasAcceptedCookie;

    appController.user.responseHandler = ResponseHandler.pending();

    updateUserParameters.email = email;
    try {
      final response = await dio.post(
        "/users/$userID/complete_profile",
        data: {
          "user": {
            "email": email,
            "first_name": name,
            "last_name": lastName,
            "nickname": updateUserParameters.nickname,
            "birthdate": updateUserParameters.birthdate,
            "last_menstruation_date_start":
                updateUserParameters.formattedLastMenstruationDateStart,
            "last_menstruation_date_end":
                updateUserParameters.formattedLastMenstruationDateEnd,
            "period_days": updateUserParameters.periodDays,
            "period_duration": updateUserParameters.periodDuration,
            "cookie_consent": cookieConsent,
            "calendar_consent": updateUserParameters.calendarConsent,
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
      appController.sendConfirmEmail.responseHandler =
          ResponseHandler.pending();
      await dio.post(
        "/auth/send_activation_link",
        data: {
          "email": email,
        },
      );
      appController.sendConfirmEmail.responseHandler =
          ResponseHandler.successful();
    } catch (e) {
      appController.sendConfirmEmail.responseHandler = ResponseHandler.failed(
        errorType: ErrorManager.checkError(e),
      );
      log.logApiException(e);
    }
  }

  static Future<void> recoverPassword(String email) async {
    try {
      await dio.post(
        "/auth/password_recovery",
        data: {
          "email": email,
        },
      );
    } catch (e) {
      log.logApiException(e);
    }
  }

  static Future<void> logout() async {
    try {
      await dio.delete(
        "/auth/logout",
      );
      appController.initializeState();
    } catch (e) {
      log.logApiException(e);
    }
  }

  static Future<void> updateInterests(List<String> interestsId) async {
    try {
      appController.user.responseHandler = ResponseHandler.pending(
        content: appController.user.value,
      );
      final userID = userIDFromDB;
      final response = await dio.post(
        "/users/$userID/update_interests",
        data: {
          "interest_ids": interestsId,
        },
      );
      _saveUserInfo(response);
    } catch (e) {
      appController.user.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> sendConsentsEmail([String? legalGuardianEmail]) async {
    try {
      final userID = userIDFromDB;
      await dio.post(
        "/users/$userID/send_consents_email",
        data: {
          "legal_guardian_email": legalGuardianEmail,
        },
      );
    } catch (e) {
      log.logApiException(e);
    }
  }

  static Future<void> validateInvitationCode(String invitationCode) async {
    try {
      appController.validateReferralCode.responseHandler =
          ResponseHandler.pending();
      final response = await dio.get(
        "/users/validate_invitation_code?invitation_code=$invitationCode",
      );
      appController.validateReferralCode.responseHandler =
          ResponseHandler.successful(
        content: ValidateReferralCode.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      appController.validateReferralCode.responseHandler =
          ResponseHandler.failed();
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
