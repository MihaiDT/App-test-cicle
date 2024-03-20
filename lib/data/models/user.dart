import 'package:lines/data/models/interest.dart';
import 'package:lines/data/models/profile_completed_areas.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';

class User {
  bool? active;
  String? birthdate;
  int coinsCollected;
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
  bool? privacyProfiling;
  bool? privacyMarketingEmail;
  RegistrationProvider? provider;
  String? sessionToken;
  List<Interest>? interests;
  String? zipCode;
  ProfileCompletedAreas? profileCompletedAreas;

  bool? isWelcomeQuizCompleted;
  int? profileCompletionPercentage;
  String? routeAfterLogin;

  User({
    this.active = false,
    this.birthdate,
    this.coinsCollected = 0,
    this.email,
    this.firstName,
    this.isConfirmed = false,
    this.userId,
    this.lastMenstrautionDate,
    this.lastName,
    this.legalGuardianEmail,
    this.mgmCode,
    this.nickname,
    this.password,
    required this.periodDays,
    required this.periodDuration,
    this.privacyProfiling,
    this.privacyMarketingEmail,
    this.provider,
    this.sessionToken,
    this.interests,
    this.zipCode,
    this.profileCompletedAreas,
    this.isWelcomeQuizCompleted,
    this.profileCompletionPercentage,
    this.routeAfterLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      active: json['user']['active'],
      birthdate: json['user']['birthdate'],
      coinsCollected: json['user']['coins'],
      email: json['user']['email'],
      firstName: json['user']['first_name'],
      isConfirmed: json['user']['is_confirmed'],
      userId: json['user']['id'],
      lastMenstrautionDate: json['user']['last_menstraution_date'],
      lastName: json['user']['last_name'],
      mgmCode: json['user']['mgm_code'],
      periodDays: json['user']['period_days'],
      periodDuration: json['user']['period_duration'],
      privacyProfiling: json['user']['privacy_profiling'],
      privacyMarketingEmail: json['user']['privacy_marketing_email'],
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
      "coins": coinsCollected,
      "email": email,
      "first_name": firstName,
      "is_confirmed": isConfirmed,
      "last_menstraution_date": lastMenstrautionDate,
      "last_name": lastName,
      "legal_guardian_email": legalGuardianEmail,
      "mgm_code": mgmCode,
      "nickname": nickname,
      "password": password,
      "period_days": periodDays,
      "period_duration": periodDuration,
      "privacy_profiling": privacyProfiling,
      "privacy_marketing_email": privacyMarketingEmail,
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
    };
  }

  @override
  String toString() {
    return 'User{birthdate: $birthdate, email: $email, firstName: $firstName,'
        ' isConfirmed: $isConfirmed, lastMenstrautionDate: $lastMenstrautionDate,'
        ' lastName: $lastName, legalGuardianEmail: $legalGuardianEmail,'
        ' mgmCode: $mgmCode, nickname: $nickname, password: $password,'
        ' periodDays: $periodDays, periodDuration: $periodDuration,'
        ' privacyProfiling: $privacyProfiling, privacyMarketingEmail: $privacyMarketingEmail,'
        ' provider: $provider, sessionToken: $sessionToken, interests: $interests,'
        ' zipCode: $zipCode, active: $active, coinsCollected: $coinsCollected, userId: $userId,'
        ' profileCompletedAreas: ${profileCompletedAreas.toString()},'
        ' isWelcomeQuizCompleted: $isWelcomeQuizCompleted,'
        ' profileCompletionPercentage: $profileCompletionPercentage,'
        ' routeAfterLogin: $routeAfterLogin, }';
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
}
