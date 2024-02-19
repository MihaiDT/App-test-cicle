import 'package:dio/dio.dart';

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
