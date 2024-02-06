class RegistrationParameters {
  /// Birthdate with yyyy-mm-dd format
  String birthdate;
  String email;
  String firstName;
  String lastName;
  String? legalGuardianEmail;
  String? nickname;
  String? password;
  bool privacyProfiling;
  bool privacyMarketing;
  bool privacyBrandProfiling;
  bool privacyBrandMarketing;

  RegistrationParameters.initial({
    this.birthdate = "",
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.legalGuardianEmail,
    this.nickname,
    this.password = "",
    this.privacyProfiling = false,
    this.privacyMarketing = false,
    this.privacyBrandProfiling = false,
    this.privacyBrandMarketing = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "legal_guardian_email": legalGuardianEmail,
      "nickname": nickname,
      "password": password,
      "privacy_profiling": privacyProfiling,
      "privacy_marketing_email": privacyMarketing,
      "privacy_brand_profiling": privacyBrandProfiling,
      "privacy_brand_marketing": privacyBrandMarketing,
    };
  }
}
