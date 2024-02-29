import 'package:dio/dio.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/settings.dart';
import 'package:lines/data/models/user.dart';

class SettingsService {
  /// Fetch app setting
  static Future<void> fetchSettings() async {
    try {
      appController.settings.responseHandler = ResponseHandler.pending();

      final response = await dio.get(
        "/settings",
      );

      _saveSettings(response);
    } catch (e) {
      appController.settings.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> updateInterests() async {
    try {
      final String id = HiveManager.userId;
      appController.settings.responseHandler = ResponseHandler.pending();

      final response = await dio.post(
        "/users/$id/update_interests",
      );

      _updateUser(response);
    } catch (e) {
      appController.settings.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static void _saveSettings(Response response) {
    appController.settings.responseHandler = ResponseHandler.successful(
      content: Settings.fromJson(
        response.data,
      ),
    );
  }

  static void _updateUser(Response response) {
    appController.user.responseHandler = ResponseHandler.successful(
      content: User.fromJson(
        response.data,
      ),
    );
  }
}
