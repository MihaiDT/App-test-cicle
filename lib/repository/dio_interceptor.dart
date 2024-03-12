import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:dio/io.dart';
import 'package:lines/core/utils/helpers.dart';

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
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.findProxy = (uri) => "PROXY $proxyEndpoint";
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return null;
        };
      } catch (error) {
        logError(error: error, tag: "PROXY");
      }
    }
    super.onRequest(options, handler);
  }
}
