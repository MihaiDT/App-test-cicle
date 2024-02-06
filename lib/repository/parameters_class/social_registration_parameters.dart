import 'package:lines/repository/parameters_class/registration_parameters.dart';

class SocialRegistrationParameters extends RegistrationParameters {
  String socialToken;

  /// The provider used for the registration (apple, facebook, google)
  RegistrationProvider registrationProvider;

  SocialRegistrationParameters({
    required this.socialToken,
    required this.registrationProvider,
  }) : super.initial(
          password: "",
        );

  factory SocialRegistrationParameters.initial() {
    return SocialRegistrationParameters(
      socialToken: "",
      registrationProvider: RegistrationProvider.apple,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      "social_token": socialToken,
      "registration_provider": registrationProvider.toString().split('.').last,
    };
  }
}

enum RegistrationProvider {
  apple,
  facebook,
  google;

  // create toJson method
  static RegistrationProvider toJson(String value) {
    switch (value) {
      case "apple":
        return RegistrationProvider.apple;
      case "facebook":
        return RegistrationProvider.facebook;
      case "google":
        return RegistrationProvider.google;
      default:
        throw Exception("Invalid registration provider");
    }
  }
}
