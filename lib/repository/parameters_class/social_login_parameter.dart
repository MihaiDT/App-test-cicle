import 'package:lines/repository/parameters_class/registration_provider.dart';

/// This class is used to pass the parameters to the social login API.
class SocialLoginParameter {
  /// The provider of the social login. It can be "google", "facebook", "apple"
  RegistrationProvider? registrationProvider;

  /// The email of the user
  String? email;

  /// The social token
  String? token;

  SocialLoginParameter({
    required this.registrationProvider,
    required this.email,
    required this.token,
  });

  factory SocialLoginParameter.fromJson(Map<String, dynamic> json) {
    return SocialLoginParameter(
      registrationProvider: json['provider'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "provider": registrationProvider?.name,
      "email": email,
      "token": token,
    };
  }

  factory SocialLoginParameter.initial() {
    return SocialLoginParameter(
      registrationProvider: null,
      email: null,
      token: null,
    );
  }
}
