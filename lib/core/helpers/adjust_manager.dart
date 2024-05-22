import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:lines/core/helpers/hive_manager.dart';

class AdjustManager {
  AdjustManager._privateConstructor();

  static final AdjustManager _instance = AdjustManager._privateConstructor();

  factory AdjustManager() {
    return _instance;
  }

  static void trackEvent(
    EventType eventType, [
    Map<String, String>? parameters,
  ]) {
    if (HiveManager.hasAcceptedCookie) {
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

enum EventType {
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
      case EventType.registration:
        return "o3av1l";
      case EventType.nameSurname:
        return "5b7rxl";
      case EventType.birthDate:
        return "wt4ni6";
      case EventType.setTutorEmail:
        return "2uxjw2";
      case EventType.privacyPolicy:
        return "21k3a9";
      case EventType.confirmEmail:
        return "92a2f0";
      case EventType.tutorConfirmEmail:
        return "qswswq";
      case EventType.login:
        return "tnkzv6";
      case EventType.lastMensesConfirmed:
        return "44pxw4";
      case EventType.lastMensesDenied:
        return "qnuman";
      case EventType.mensesDurationConfirmed:
        return "9q9ejx";
      case EventType.mensesDurationDenied:
        return "8xwgeo";
      case EventType.referralCodeConfirmed:
        return "4ilwsf";
      case EventType.referralCodeDenied:
        return "4x3mto";
      case EventType.loadProductCode:
        return "e4tcxx";
      case EventType.productCodeLoaded:
        return "b7v0bz";
      case EventType.missionCompleted:
        return "hrv4f6";
      default:
        return "";
    }
  }
}
