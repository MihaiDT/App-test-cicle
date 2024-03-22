import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';

class DioInterceptor extends Interceptor {
  final Dio dio;

  DioInterceptor({
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String authToken = await Get.find<SecureStorageManager>().getToken();
    if (authToken.isNotEmpty) {
      options.headers.addAll(
        {
          "Authorization": authToken,
        },
      );
    }
    if (isProxymanEnabled) {
      try {
        dio.httpClientAdapter = IOHttpClientAdapter(
          createHttpClient: () {
            final HttpClient client =
                HttpClient(context: SecurityContext(withTrustedRoots: false));
            client.badCertificateCallback =
                ((X509Certificate cert, String host, int port) => true);
            return client;
          },
        );
      } catch (error) {
        logError(error: error, tag: "PROXY");
      }
    }
    super.onRequest(options, handler);
  }
}
