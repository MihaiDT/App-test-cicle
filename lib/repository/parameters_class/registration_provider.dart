enum RegistrationProvider {
  google,
  facebook,
  apple,
  email;
}

extension RegistrationProviderExtension on RegistrationProvider {
  static String toJson(RegistrationProvider registrationProvider) {
    switch (registrationProvider) {
      case RegistrationProvider.google:
        return "google";
      case RegistrationProvider.facebook:
        return "facebook";
      case RegistrationProvider.apple:
        return "apple";
      case RegistrationProvider.email:
        return "email";
    }
  }

  static RegistrationProvider fromJson(String registrationProvider) {
    switch (registrationProvider) {
      case "google":
        return RegistrationProvider.google;
      case "facebook":
        return RegistrationProvider.facebook;
      case "apple":
        return RegistrationProvider.apple;
      case "email":
        return RegistrationProvider.email;
      default:
        return RegistrationProvider.email;
    }
  }

  bool get isSocialProvider {
    switch (this) {
      case RegistrationProvider.google:
      case RegistrationProvider.facebook:
      case RegistrationProvider.apple:
        return true;
      case RegistrationProvider.email:
        return false;
    }
  }
}
