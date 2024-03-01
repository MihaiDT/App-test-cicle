import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomLogger extends Logger {
  CustomLogger._internal()
      : super(
          printer: PrettyPrinter(
            methodCount: 0,
            errorMethodCount: 0,
            lineLength: 100,
            colors: true,
            printEmojis: true,
            printTime: false,
          ),
          filter: DevelopmentFilter(),
          output: null,
        );

  static final CustomLogger _instance = CustomLogger._internal();

  factory CustomLogger() {
    return _instance;
  }

  void logError(
    dynamic message, {
    DioException? exception,
    Object? error,
    StackTrace? stackTrace,
  }) {
    String loggedMessage = message.toString();
    if (exception != null) {
      loggedMessage =
          " $message | ERROR WITH ${exception.response?.statusCode} ${exception.response?.statusMessage}";
    }
    e(
      loggedMessage,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void logApiException(
    dynamic exception,
  ) {
    if (exception is DioException) {
      String loggedMessage =
          "ERROR ${exception.response?.statusCode} | ${exception.response?.statusMessage} \nError at path ${exception.requestOptions.path}";
      e(
        loggedMessage,
        error: exception,
      );
    }
  }

  void logWarning(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    w(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
