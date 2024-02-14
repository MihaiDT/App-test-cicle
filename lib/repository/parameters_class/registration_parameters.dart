import 'package:lines/repository/parameters_class/registration_provider.dart';

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
  bool privacyBrandMarketing;
  RegistrationProvider? registrationProvider;
  String? socialToken;

  RegistrationParameters.initial({
    this.birthdate = "",
    this.email = "",
    this.firstName = "",
    this.lastName = "",
    this.legalGuardianEmail,
    this.nickname,
    this.password,
    this.privacyProfiling = true,
    this.privacyMarketing = true,
    this.privacyBrandMarketing = true,
    this.registrationProvider = RegistrationProvider.email,
    this.socialToken = "",
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
      "privacy_marketing": privacyMarketing,
      "privacy_brand_marketing": privacyBrandMarketing,
      "registration_provider": registrationProvider?.name,
      "social_token": socialToken,
    };
  }
}
