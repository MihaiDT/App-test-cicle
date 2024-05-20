import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';

class ErrorManager {
  static final ErrorManager _singleton = ErrorManager._internal();

  factory ErrorManager() {
    return _singleton;
  }

  ErrorManager._internal();

  static ErrorType checkError(Object? error) {
    String errorType = "";
    if (error is DioException &&
        error.response != null &&
        error.response?.data is Map<String, dynamic>) {
      errorType = error.response?.data["error"] ?? "";
    }
    return ErrorTypeExtension.fromString(errorType);
  }
}
