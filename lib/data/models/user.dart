import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/data/models/interest.dart';
import 'package:lines/data/models/profile_completed_areas.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';

class User {
  bool? active;

  bool? appConsents;
  String? birthdate;
  int coinsCollected;
  String? deepcubeId;
  String? email;
  String? firstName;
  bool? isConfirmed;
  String? userId;
  String? lastMenstrautionDate;
  String? lastName;
  String? legalGuardianEmail;
  String? mgmCode;
  String? nickname;
  String? password;
  int? periodDays;
  int? periodDuration;
  int? friendsInvited;
  bool? privacyProfiling;
  bool? privacyMarketing;
  bool? privacyBrandMarketing;
  RegistrationProvider? provider;
  String? sessionToken;
  List<Interest>? interests;
  String? zipCode;
  ProfileCompletedAreas? profileCompletedAreas;

  bool? isWelcomeQuizCompleted;
  int? profileCompletionPercentage;
  String? routeAfterLogin;

  bool? hasConsentCookieProfiling;
  bool? hasConsentCookieStats;
  bool? calendarConsent;
  bool? diaryConsent;
  String? avatarPhase0ImgUrl;
  String? avatarPhase1ImgUrl;
  String? avatarPhase2ImgUrl;
  String? avatarPhase3ImgUrl;

  User({
    this.active = false,
    this.appConsents = false,
    this.birthdate,
    this.coinsCollected = 0,
    this.calendarConsent = false,
    this.diaryConsent = false,
    this.deepcubeId,
    this.email,
    this.firstName,
    this.isConfirmed = false,
    this.userId,
    this.lastMenstrautionDate,
    this.lastName,
    this.legalGuardianEmail,
    this.friendsInvited = 0,
    this.mgmCode,
    this.nickname,
    this.password,
    required this.periodDays,
    required this.periodDuration,
    this.privacyProfiling,
    this.privacyMarketing,
    this.privacyBrandMarketing,
    this.provider,
    this.sessionToken,
    this.interests,
    this.zipCode,
    this.profileCompletedAreas,
    this.isWelcomeQuizCompleted,
    this.profileCompletionPercentage,
    this.routeAfterLogin,
    this.hasConsentCookieProfiling,
    this.hasConsentCookieStats,
    this.avatarPhase0ImgUrl,
    this.avatarPhase1ImgUrl,
    this.avatarPhase2ImgUrl,
    this.avatarPhase3ImgUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      active: json['user']['active'],
      appConsents: json['user']['app_consents'],
      birthdate: json['user']['birthdate'],
      calendarConsent: json['user']['calendar_consent'],
      diaryConsent: json['user']['diary_consent'],
      coinsCollected: json['user']['coins'],
      deepcubeId: json['user']['deepcube_id'],
      email: json['user']['email'],
      firstName: json['user']['first_name'],
      isConfirmed: json['user']['is_confirmed'],
      userId: json['user']['id'],
      friendsInvited: json['user']['invited_friends'] ?? 0,
      lastMenstrautionDate: json['user']['last_menstraution_date'],
      lastName: json['user']['last_name'],
      mgmCode: json['user']['mgm_code'],
      periodDays: json['user']['period_days'],
      periodDuration: json['user']['period_duration'],
      privacyProfiling: json['user']['privacy_profiling'],
      privacyMarketing: json['user']['privacy_marketing'],
      privacyBrandMarketing: json['user']['privacy_brand_marketing'],
      provider: RegistrationProvider.fromJson(json['user']['provider']),
      sessionToken: json['user']['session_token'],
      interests: (json['user']['interests'] as List)
          .map(
            (interest) => Interest.fromJson(interest as Map<String, dynamic>),
          )
          .toList(),
      password: json['user']['password'],
      nickname: json['user']['nickname'],
      legalGuardianEmail: json['user']['legal_guardian_email'],
      zipCode: json['user']['zip_code'],
      profileCompletedAreas: ProfileCompletedAreas.fromJson(
        json['user']['profile_completed_areas'],
      ),
      isWelcomeQuizCompleted: json['user']['is_welcome_quiz_completed'],
      profileCompletionPercentage: json['user']['profile_percentage'],
      routeAfterLogin: json['user']['route_after_login'],

      /// The value of hasConsentCookieProfiling and hasConsentCookieStats is saved in DB
      /// because the value in api can be not updated
      hasConsentCookieProfiling: HiveManager.hasAcceptedCookieProfiling,
      hasConsentCookieStats: HiveManager.hasAcceptedCookieStats,
      avatarPhase0ImgUrl: json['user']['phase_0_img_url'],
      avatarPhase1ImgUrl: json['user']['phase_1_img_url'],
      avatarPhase2ImgUrl: json['user']['phase_2_img_url'],
      avatarPhase3ImgUrl: json['user']['phase_3_img_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
      "app_consents": appConsents,
      "coins": coinsCollected,
      "calendar_consent": calendarConsent,
      "diary_consent": diaryConsent,
      "deepcube_id": deepcubeId,
      "email": email,
      "first_name": firstName,
      "is_confirmed": isConfirmed,
      "last_menstraution_date": lastMenstrautionDate,
      "last_name": lastName,
      "legal_guardian_email": legalGuardianEmail,
      "mgm_code": mgmCode,
      "nickname": nickname,
      "friendsInvited": friendsInvited,
      "password": password,
      "period_days": periodDays,
      "period_duration": periodDuration,
      "privacy_profiling": privacyProfiling,
      "privacy_brand_marketing": privacyProfiling,
      "privacy_marketing": privacyMarketing,
      "session_token": sessionToken,
      "interests": interests!
          .map(
            (interest) => Interest.toJson(interest),
          )
          .toList(),
      "zip_code": zipCode,
      "active": active,
      "user_id": userId,
      "profile_completed_areas": profileCompletedAreas?.toJson(),
      "is_welcome_quiz_completed": isWelcomeQuizCompleted,
      "profile_percentage": profileCompletionPercentage,
      "route_after_login": routeAfterLogin,
      "cookie_profiling": hasConsentCookieProfiling,
      "cookie_stats": hasConsentCookieStats,
      'phase_0_img_url': avatarPhase0ImgUrl,
      'phase_1_img_url': avatarPhase1ImgUrl,
      'phase_2_img_url': avatarPhase2ImgUrl,
      'phase_3_img_url': avatarPhase3ImgUrl,
    };
  }

  @override
  String toString() {
    return 'User{birthdate: $birthdate, email: $email, firstName: $firstName,'
        ' isConfirmed: $isConfirmed, lastMenstrautionDate: $lastMenstrautionDate,'
        ' lastName: $lastName, legalGuardianEmail: $legalGuardianEmail,'
        ' mgmCode: $mgmCode, nickname: $nickname, password: $password,'
        ' periodDays: $periodDays, periodDuration: $periodDuration,'
        ' privacyProfiling: $privacyProfiling, privacyMarketingEmail: $privacyMarketing,'
        ' provider: $provider, sessionToken: $sessionToken, interests: $interests,'
        ' zipCode: $zipCode, active: $active, coinsCollected: $coinsCollected, userId: $userId,'
        ' profileCompletedAreas: ${profileCompletedAreas.toString()},'
        ' isWelcomeQuizCompleted: $isWelcomeQuizCompleted,'
        ' profileCompletionPercentage: $profileCompletionPercentage,'
        ' routeAfterLogin: $routeAfterLogin,'
        ' hasConsentCookieProfiling: $hasConsentCookieProfiling,'
        ' hasConsentCookieStats: $hasConsentCookieStats, }';
  }

  bool get hasCompletedInterests {
    return profileCompletedAreas?.interests ?? false;
  }

  bool get hasCompletedZipCode {
    return profileCompletedAreas?.zipCode ?? false;
  }

  bool get hasCompletedPeriodData {
    return profileCompletedAreas?.periodData ?? false;
  }

  int get age {
    DateTime birthDate = DateTime.parse(birthdate ?? "");
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  bool get hasMoreThan14Years {
    return age >= 14;
  }

  bool get hasMoreThan18Years {
    return age >= 18;
  }

  String get formattedDateWithPipes {
    return birthdate?.split("-").reversed.join(" | ") ?? "";
  }

  bool get isAvatarConfigured =>
      avatarPhase0ImgUrl != null ||
      avatarPhase1ImgUrl != null ||
      avatarPhase2ImgUrl != null ||
      avatarPhase3ImgUrl != null;
}
