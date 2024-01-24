class RegistrationParameters {
  /// Birthdate with yyyy-mm-dd format
  String birthdate;
  String email;
  String firstName;
  String lastName;

  /// The registration method, with Email, Apple, Google, Facebook
  RegistrationProvider registrationProvider;
  String? legalGuardianEmail;
  String? nickname;
  String? password;
  bool privacyPolicy;
  bool privacyMarketingEmail;

  RegistrationParameters.initial({
    this.birthdate = "",
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.registrationProvider = RegistrationProvider.email,
    this.legalGuardianEmail,
    this.nickname,
    this.password = "",
    this.privacyPolicy = true,
    this.privacyMarketingEmail = true,
  });
}

enum RegistrationProvider {
  email,
  apple,
  facebook,
  google,
}
