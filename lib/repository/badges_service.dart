import 'package:dio/dio.dart';
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

  static void _saveBadges(Response response) {
    appController.badges.responseHandler = ResponseHandler.successful(
      content: response.data["badges"]
          .map<Badge>((badge) => Badge.fromJson(badge))
          .toList(),
    );
  }
}
