class UpdateUserParameters {
  final String birthdate;
  final String email;
  final String firstName;
  final DateTime? lastMenstruationDateStart;
  final DateTime? lastMenstruationDateEnd;
  final String lastName;
  final String? legalGuardianEmail;
  final String? nickname;
  final int periodDays;
  final int periodDuration;
  final bool privacyProfiling;
  final bool privacyMarketingEmail;

  UpdateUserParameters({
    required this.birthdate,
    required this.email,
    required this.firstName,
    this.lastMenstruationDateStart,
    this.lastMenstruationDateEnd,
    required this.lastName,
    this.legalGuardianEmail,
    this.nickname,
    required this.periodDays,
    required this.periodDuration,
    required this.privacyProfiling,
    required this.privacyMarketingEmail,
  });
}
