class UpdateUserParameters {
  String? birthdate;
  String? email;
  String? firstName;
  DateTime? lastMenstruationDateStart;
  DateTime? lastMenstruationDateEnd;
  String? lastName;
  String? legalGuardianEmail;
  String? nickname;
  int? periodDays;
  int? periodDuration;
  bool? privacyProfiling;
  bool? privacyMarketing;
  bool? privacyBrandMarketing;
  String? referralCode;
  String? zipCode;
  bool? hasConsentCookieStats;
  bool? hasConsentCookieProfiling;
  bool? calendarConsent;
  bool? diaryConsent;

  UpdateUserParameters({
    this.birthdate,
    this.email,
    this.firstName,
    this.lastMenstruationDateStart,
    this.lastMenstruationDateEnd,
    this.lastName,
    this.legalGuardianEmail,
    this.nickname,
    this.periodDays,
    this.periodDuration,
    this.privacyProfiling,
    this.privacyMarketing,
    this.privacyBrandMarketing,
    this.referralCode,
    this.zipCode,
    this.hasConsentCookieStats,
    this.hasConsentCookieProfiling,
    this.calendarConsent,
    this.diaryConsent,
  });

  String? get formattedLastMenstruationDateStart {
    if (lastMenstruationDateStart != null) {
      return "${lastMenstruationDateStart!.year}-${lastMenstruationDateStart!.month}-${lastMenstruationDateStart!.day}";
    } else {
      return null;
    }
  }

  String? get formattedLastMenstruationDateEnd {
    if (lastMenstruationDateEnd != null) {
      return "${lastMenstruationDateEnd!.year}-${lastMenstruationDateEnd!.month}-${lastMenstruationDateEnd!.day}";
    } else {
      return null;
    }
  }

  factory UpdateUserParameters.initial() {
    /// return an initial state fot the UpdateUserParameters
    return UpdateUserParameters();
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
      "privacy_marketing": privacyMarketing,
      "privacy_brand_marketing": privacyBrandMarketing,
      "invitation_code": referralCode,
      "zip_code": zipCode,
      "cookie_stats": hasConsentCookieStats,
      "cookie_profiling": hasConsentCookieProfiling,
      "calendar_consent": calendarConsent,
      "diary_consent": diaryConsent,
    };
  }
}
