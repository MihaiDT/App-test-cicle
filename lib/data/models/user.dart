class User {
  String birthdate;
  String email;
  String firstName;
  bool isConfirmed;
  String? lastMenstrautionDate;
  String lastName;
  String? legalGuardianEmail;
  String? mgmCode;
  String? nickname;
  String? password;
  int periodDays;
  int periodDuration;
  bool? privacyProfiling;
  bool? privacyMarketingEmail;
  String provider;
  String sessionToken;

  User({
    required this.birthdate,
    required this.email,
    required this.firstName,
    required this.isConfirmed,
    this.lastMenstrautionDate,
    required this.lastName,
    this.legalGuardianEmail,
    required this.mgmCode,
    this.nickname,
    this.password,
    required this.periodDays,
    required this.periodDuration,
    this.privacyProfiling,
    this.privacyMarketingEmail,
    required this.provider,
    required this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birthdate: json['user']['birthdate'],
      email: json['user']['email'],
      firstName: json['user']['first_name'],
      isConfirmed: json['user']['is_confirmed'],
      lastMenstrautionDate: json['user']['last_menstraution_date'],
      lastName: json['user']['last_name'],
      mgmCode: json['user']['mgm_code'],
      periodDays: json['user']['period_days'],
      periodDuration: json['user']['period_duration'],
      privacyProfiling: json['user']['privacy_profiling'],
      privacyMarketingEmail: json['user']['privacy_marketing_email'],
      provider: json['user']['provider'],
      sessionToken: json['user']['session_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
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
    };
  }

  @override
  String toString() {
    return 'User{birthdate: $birthdate, email: $email, firstName: $firstName, isConfirmed: $isConfirmed, lastMenstrautionDate: $lastMenstrautionDate, lastName: $lastName, legalGuardianEmail: $legalGuardianEmail, mgmCode: $mgmCode, nickname: $nickname, password: $password, periodDays: $periodDays, periodDuration: $periodDuration, privacyProfiling: $privacyProfiling, privacyMarketingEmail: $privacyMarketingEmail, provider: $provider, sessionToken: $sessionToken}';
  }
}
