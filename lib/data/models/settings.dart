class Settings {
  int? androidMinBuildNumber;
  String? androidStoreUrl;
  final int welcomeSurveyCoins;
  final int invitationCodeCoins;
  int? iosMinBuildNumber;
  String? iosStoreUrl;

  Settings({
    this.androidMinBuildNumber,
    this.androidStoreUrl,
    required this.welcomeSurveyCoins,
    required this.invitationCodeCoins,
    this.iosMinBuildNumber,
    this.iosStoreUrl,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      androidMinBuildNumber: json['android_min_build_number'],
      androidStoreUrl: json['android_store_url'],
      welcomeSurveyCoins: json['coins']['welcome_survey'],
      invitationCodeCoins: json['coins']['invitation_code'],
      iosMinBuildNumber: json['ios_min_build_number'],
      iosStoreUrl: json['ios_store_url'],
    );
  }

  factory Settings.toJson(Settings settings) {
    return Settings(
      androidMinBuildNumber: settings.androidMinBuildNumber,
      androidStoreUrl: settings.androidStoreUrl,
      welcomeSurveyCoins: settings.welcomeSurveyCoins,
      invitationCodeCoins: settings.invitationCodeCoins,
      iosMinBuildNumber: settings.iosMinBuildNumber,
      iosStoreUrl: settings.iosStoreUrl,
    );
  }
}
