import 'package:dio/dio.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/badge.dart';

class BadgesService {
  static Future<void> fetchBadges() async {
    try {
      appController.badges.responseHandler = ResponseHandler.pending();
      final response = await dio.get(
        "/badges",
      );
      _saveBadges(response);
    } catch (e) {
      appController.badges.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> get wallet async {
    try {
      final response = await dio.get(
        "/users/${HiveManager.userId}/wallet",
      );
    } catch (e) {
      log.logApiException(e);
    }
  }

  static void _saveBadges(Response response) {
    appController.badges.responseHandler = ResponseHandler.successful(
      content: response.data["badges"]
          .map<Badge>((badge) => Badge.fromJson(badge))
          .toList(),
    );
  }

  static Future<void> triggerEvent(BadgeEvent badgeEvent) async {
    try {
      await dio.get(
        "/gamification_events/trigger_event?event=${badgeEvent.code}",
      );
    } catch (e) {
      log.logApiException(e);
    }
  }
}

enum BadgeEvent {
  avatar,
  consiglio,
  gioco,
  login,
  periodTracker,
  share;

  String get code {
    switch (this) {
      case BadgeEvent.avatar:
        return 'AVATAR';
      case BadgeEvent.consiglio:
        return 'CONSIGLIO';
      case BadgeEvent.gioco:
        return 'GIOCO';
      case BadgeEvent.login:
        return 'LOGIN';
      case BadgeEvent.periodTracker:
        return 'PERIOD_TRACKER';
      case BadgeEvent.share:
        return 'SHARE';
      default:
        return "";
    }
  }
}
