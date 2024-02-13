import 'package:dio/dio.dart';
import 'package:get/get.dart';
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
    super.onRequest(options, handler);
  }
}
