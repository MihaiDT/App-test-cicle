enum RegistrationProvider {
  google,
  facebookIOS,
  facebook,
  apple,
  email;

  static RegistrationProvider fromJson(String registrationProvider) {
    switch (registrationProvider) {
      case "google":
        return RegistrationProvider.google;
      case "facebook":
        return RegistrationProvider.facebook;
      case "facebook_jwt":
        return RegistrationProvider.facebookIOS;
      case "apple":
        return RegistrationProvider.apple;
      case "email":
      default:
        return RegistrationProvider.email;
    }
  }
}

extension RegistrationProviderExtension on RegistrationProvider {
  static String toJson(RegistrationProvider registrationProvider) {
    switch (registrationProvider) {
      case RegistrationProvider.google:
        return "google";
      case RegistrationProvider.facebook:
        return "facebook";
      case RegistrationProvider.facebookIOS:
        return 'facebook_jwt';
      case RegistrationProvider.apple:
        return "apple";
      case RegistrationProvider.email:
        return "email";
    }
  }

  bool get isSocialProvider {
    switch (this) {
      case RegistrationProvider.google:
      case RegistrationProvider.facebook:
      case RegistrationProvider.facebookIOS:
      case RegistrationProvider.apple:
        return true;
      case RegistrationProvider.email:
        return false;
    }
  }
}
