import 'package:dio/dio.dart';
import 'package:get/get.dart';
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
    /*  String loggedMessage = message.toString();
    if (exception != null) {
      loggedMessage =
          " $message | ERROR WITH ${exception.response?.statusCode} ${exception.response?.statusMessage}";
    }
    e(
      loggedMessage,
      error: error,
      stackTrace: stackTrace,
    );*/
  }

  void logApiException(
    dynamic exception, [
    StackTrace? stackTrace,
  ]) {
    if (stackTrace != null) {
      stackTrace.printInfo();
    }
    if (exception is DioException) {
      String errorMessage = "";
      if (exception.response != null && exception.response?.statusCode == 422) {
        errorMessage = exception.response?.data['error'] ?? '';
      }
      String loggedMessage =
          "ERROR ${exception.response?.statusCode} | ${exception.response?.statusMessage} \nError at path ${exception.requestOptions.path}\n ERROR MESSAGE: $errorMessage";
      e(
        loggedMessage,
        error: exception,
      );

      // if (exception.response?.statusCode == 422) {
      //   FlushBar(
      //     child: Text(loggedMessage),
      //   ).show(
      //     Get.context!,
      //   );
      // }
    } else {
      e(
        exception,
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
