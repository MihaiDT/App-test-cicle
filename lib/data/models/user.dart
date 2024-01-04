class User {
  String? birthdate;
  String? email;
  String? firstName;
  bool? isConfirmed;
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
  String? provider;
  String? sessionToken;

  User(
      {this.birthdate,
      this.email,
      this.firstName,
      this.isConfirmed,
      this.lastMenstrautionDate,
      this.lastName,
      this.legalGuardianEmail,
      this.mgmCode,
      this.nickname,
      this.password,
      this.periodDays,
      this.periodDuration,
      this.privacyProfiling,
      this.privacyMarketingEmail,
      this.provider,
      this.sessionToken});

  User.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'];
    email = json['email'];
    firstName = json['first_name'];
    isConfirmed = json['is_confirmed'];
    lastMenstrautionDate = json['last_menstraution_date'];
    lastName = json['last_name'];
    legalGuardianEmail = json['legal_guardian_email'];
    mgmCode = json['mgm_code'];
    nickname = json['nickname'];
    password = json['password'];
    periodDays = json['period_days'];
    periodDuration = json['period_duration'];
    privacyProfiling = json['privacy_profiling'];
    privacyMarketingEmail = json['privacy_marketing_email'];
    provider = json['provider'];
    sessionToken = json['session_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthdate'] = this.birthdate;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['is_confirmed'] = this.isConfirmed;
    data['last_menstraution_date'] = this.lastMenstrautionDate;
    data['last_name'] = this.lastName;
    data['legal_guardian_email'] = this.legalGuardianEmail;
    data['mgm_code'] = this.mgmCode;
    data['nickname'] = this.nickname;
    data['password'] = this.password;
    data['period_days'] = this.periodDays;
    data['period_duration'] = this.periodDuration;
    data['privacy_profiling'] = this.privacyProfiling;
    data['privacy_marketing_email'] = this.privacyMarketingEmail;
    data['provider'] = this.provider;
    data['session_token'] = this.sessionToken;
    return data;
  }
}
