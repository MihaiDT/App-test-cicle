import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/settings.dart';

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

  static void _saveSettings(Response response) {
    appController.settings.responseHandler = ResponseHandler.successful(
      content: Settings.fromJson(
        response.data,
      ),
    );
  }
}
