import 'package:lines/repository/parameters_class/social_registration_parameters.dart';

/// This class is used to pass the parameters to the social login API.
class SocialLoginParameter {
  /// The provider of the social login. It can be "google", "facebook", "apple"
  final RegistrationProvider registrationProvider;

  /// The email of the user
  final String email;

  SocialLoginParameter({
    required this.registrationProvider,
    required this.email,
  });

  factory SocialLoginParameter.fromJson(Map<String, dynamic> json) {
    return SocialLoginParameter(
      registrationProvider: json['provider'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "provider": registrationProvider.name,
      "email": email,
    };
  }
}
