class UpdateUserParameters {
  String birthdate;
  String email;
  String firstName;
  DateTime? lastMenstruationDateStart;
  DateTime? lastMenstruationDateEnd;
  String lastName;
  String? legalGuardianEmail;
  String? nickname;
  int? periodDays;
  int? periodDuration;
  bool privacyProfiling;
  bool privacyMarketingEmail;
  String referralCode;

  UpdateUserParameters({
    required this.birthdate,
    required this.email,
    required this.firstName,
    this.lastMenstruationDateStart,
    this.lastMenstruationDateEnd,
    required this.lastName,
    this.legalGuardianEmail,
    this.nickname,
    this.periodDays,
    this.periodDuration,
    required this.privacyProfiling,
    required this.privacyMarketingEmail,
    this.referralCode = "",
  });

  String get formattedLastMenstruationDateStart {
    if (lastMenstruationDateStart != null) {
      return "${lastMenstruationDateStart!.year}-${lastMenstruationDateStart!.month}-${lastMenstruationDateStart!.day}";
    } else {
      return "";
    }
  }

  String get formattedLastMenstruationDateEnd {
    if (lastMenstruationDateEnd != null) {
      return "${lastMenstruationDateEnd!.year}-${lastMenstruationDateEnd!.month}-${lastMenstruationDateEnd!.day}";
    } else {
      return "";
    }
  }

  factory UpdateUserParameters.initial() {
    /// return an initial state fot the UpdateUserParameters
    return UpdateUserParameters(
      birthdate: "",
      email: "",
      firstName: "",
      lastName: "",
      privacyProfiling: false,
      privacyMarketingEmail: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
      "email": email,
      "first_name": firstName,
      "last_menstruation_date_start": formattedLastMenstruationDateStart,
      "last_menstruation_date_end": formattedLastMenstruationDateEnd,
      "last_name": lastName,
      "legal_guardian_email": legalGuardianEmail,
      "nickname": nickname,
      "period_days": periodDays,
      "period_duration": periodDuration,
      "privacy_profiling": privacyProfiling,
      "privacy_marketing_email": privacyMarketingEmail,
      "referral_code": referralCode,
    };
  }
}
