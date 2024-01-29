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
  String? referralCode;

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
    this.referralCode,
  });

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
}
