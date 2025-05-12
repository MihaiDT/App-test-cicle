import 'package:flutter_analytics_piwik/flutter_piwikpro.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/push_notification.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';

import 'package:lines/core/helpers/api.dart';

/// Send events to Piwik
class PiwikManager {
  PiwikManager._privateConstructor();

  static final PiwikManager _instance = PiwikManager._privateConstructor();

  factory PiwikManager() {
    return _instance;
  }

  /// Method that sends an event to Piwik,
  /// the parameters are optional and are used to send additional data to Piwik
  static void trackEvent(
    PiwikEventType eventType, {
    String? action,
    String? name,
    Map<String, bool>? privacyData,
  }) async {
    if (HiveManager.hasAcceptedCookieProfiling == true) {
      await FlutterPiwikPro.sharedInstance.configureTracker(
        baseURL: environment.piwik['baseUrl']!,
        siteId: environment.piwik['siteId']!,
      );

      await FlutterPiwikPro.sharedInstance.setAnonymizationState(false);

      final User? user = appController.user.value;
      if (user != null) {
        await FlutterPiwikPro.sharedInstance.setUserId(user.deepcubeId!);
      }

      /// Custom dimensions
      // index: 1 => Logged-in
      FlutterPiwikPro.sharedInstance.trackCustomDimension(
        value: user != null ? 'true' : 'false',
        index: 1,
      );
      // index: 2 => Social login
      // TODO:
      FlutterPiwikPro.sharedInstance.trackCustomDimension(
        value: user != null ? 'false' : 'undefined',
        index: 2,
      );

      // index: 3 => Push notification
      FlutterPiwikPro.sharedInstance.trackCustomDimension(
        value:
            await PushNotification.isPushPermissionEnabled() ? 'true' : 'false',
        index: 2,
      );

      // index: 7 => User coins
      FlutterPiwikPro.sharedInstance.trackCustomDimension(
        value: user != null ? "${user.coinsCollected}" : '0',
        index: 7,
      );

      if (privacyData != null) {
        // index: 8 => Offers communications
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: "${privacyData['privacyMarketing']}",
          index: 8,
        );

        // index: 9 => Personalized offers
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: "${privacyData['privacyProfiling']}",
          index: 9,
        );

        // index: 10 => Family communications
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: "${privacyData['privacyBrandMarketing']}",
          index: 10,
        );
      } else {
        // index: 8 => Offers communications
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: user != null
              ? (user.privacyMarketing ?? false)
                  ? 'true'
                  : 'false'
              : 'false',
          index: 8,
        );

        // index: 9 => Personalized offers
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: user != null
              ? (user.privacyProfiling ?? false)
                  ? 'true'
                  : 'false'
              : 'false',
          index: 9,
        );

        // index: 10 => Family communications
        FlutterPiwikPro.sharedInstance.trackCustomDimension(
          value: user != null
              ? (user.privacyBrandMarketing ?? false)
                  ? 'true'
                  : 'false'
              : 'false',
          index: 10,
        );
      }

      /// Custom event
      FlutterPiwikPro.sharedInstance.trackCustomEvent(
        action: action ?? '',
        category: eventType.category,
        name: name ?? '',
      );
    }
  }
}

enum PiwikEventType {
  avatar,
  gynecologist,
  loadCode,
  mission,
  registration,
  profile,
  login;

  String get category {
    switch (this) {
      case PiwikEventType.avatar:
        return 'Avatar';
      case PiwikEventType.gynecologist:
        return 'Advice - Gynecologist';
      case PiwikEventType.loadCode:
        return 'Load code';
      case PiwikEventType.mission:
        return 'Mission';
      case PiwikEventType.registration:
        return 'Registration';
      case PiwikEventType.login:
        return 'Login';
      case PiwikEventType.profile:
        return 'Profile';
      default:
        return "";
    }
  }
}
