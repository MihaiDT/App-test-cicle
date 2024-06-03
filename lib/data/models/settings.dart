import 'package:lines/data/models/interest.dart';

class Settings {
  int? androidMinBuildNumber;
  String? androidStoreUrl;
  final int welcomeSurveyCoins;
  final int invitationCodeCoins;
  int? iosMinBuildNumber;
  String? iosStoreUrl;
  List<Interest> interests;
  String? helpdeskUrl;

  /// Returns true if the feature "Symptoms in home" is active
  final bool symptomsInHomeActive;

  Settings({
    this.androidMinBuildNumber,
    this.androidStoreUrl,
    required this.welcomeSurveyCoins,
    required this.invitationCodeCoins,
    this.iosMinBuildNumber,
    this.iosStoreUrl,
    required this.symptomsInHomeActive,
    this.interests = const [],
    this.helpdeskUrl,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      androidMinBuildNumber: json['android_min_build_number'],
      androidStoreUrl: json['android_store_url'],
      welcomeSurveyCoins: json['coins']['welcome_survey'],
      invitationCodeCoins: json['coins']['invitation_code'],
      iosMinBuildNumber: json['ios_min_build_number'],
      iosStoreUrl: json['ios_store_url'],
      symptomsInHomeActive: json['show_sections']['symptoms_in_home'],
      interests: (json['interests'] as List).map((interest) => Interest.fromJson(interest)).toList(),
      helpdeskUrl: json['helpdesk_url'],
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
      symptomsInHomeActive: settings.symptomsInHomeActive,
      interests: settings.interests,
      helpdeskUrl: settings.helpdeskUrl,
    );
  }
}
