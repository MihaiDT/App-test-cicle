import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:lines/core/helpers/hive_manager.dart';

/// Send events to Adjust
class AdjustManager {
  AdjustManager._privateConstructor();

  static final AdjustManager _instance = AdjustManager._privateConstructor();

  factory AdjustManager() {
    return _instance;
  }

  /// Method that sends an event to Adjust,
  /// the EventType is an enum that contains„ all the events code that we want to track,
  /// the parameters are optional and are used to send additional data to Adjust
  static void trackEvent(
    AjustEventType eventType, [
    Map<String, String>? parameters,
  ]) {
    if ((HiveManager.hasAcceptedCookieProfiling ?? false)) {
      // && !kDebugMode && F.appFlavor == Flavor.prod) {
      final adjustEvent = AdjustEvent(
        eventType.tokenName,
      );
      if (parameters != null) {
        for (final key in parameters.keys) {
          adjustEvent.addCallbackParameter(key, parameters[key]!);
        }
      }
      Adjust.trackEvent(
        adjustEvent,
      );
    }
  }
}

enum AjustEventType {
  registration,
  nameSurname,
  birthDate,
  setTutorEmail,
  privacyPolicy,
  confirmEmail,
  tutorConfirmEmail,
  login,
  lastMensesConfirmed,
  lastMensesDenied,
  mensesDurationConfirmed,
  mensesDurationDenied,
  referralCodeConfirmed,
  referralCodeDenied,
  loadProductCode,
  productCodeLoaded,
  missionCompleted;

  String get tokenName {
    switch (this) {
      case AjustEventType.registration:
        return "o3av1l";
      case AjustEventType.nameSurname:
        return "5b7rxl";
      case AjustEventType.birthDate:
        return "wt4ni6";
      case AjustEventType.setTutorEmail:
        return "2uxjw2";
      case AjustEventType.privacyPolicy:
        return "21k3a9";
      case AjustEventType.confirmEmail:
        return "92a2f0";
      case AjustEventType.tutorConfirmEmail:
        return "qswswq";
      case AjustEventType.login:
        return "tnkzv6";
      case AjustEventType.lastMensesConfirmed:
        return "44pxw4";
      case AjustEventType.lastMensesDenied:
        return "qnuman";
      case AjustEventType.mensesDurationConfirmed:
        return "9q9ejx";
      case AjustEventType.mensesDurationDenied:
        return "8xwgeo";
      case AjustEventType.referralCodeConfirmed:
        return "4ilwsf";
      case AjustEventType.referralCodeDenied:
        return "4x3mto";
      case AjustEventType.loadProductCode:
        return "e4tcxx";
      case AjustEventType.productCodeLoaded:
        return "b7v0bz";
      case AjustEventType.missionCompleted:
        return "hrv4f6";
      default:
        return "";
    }
  }
}
