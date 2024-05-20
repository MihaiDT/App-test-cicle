import 'package:dio/dio.dart';
import 'package:lines/core/helpers/logger/logger.dart';
import 'package:logger/logger.dart';

class DioLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CustomLogger().log(
      Level.info,
      'REQUEST ${options.method}\n '
      'HEADERS: ${options.headers}\n'
      'PATH: ${options.path}\n'
      'DATA: ${options.data}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    CustomLogger().log(
      Level.info,
      'RESPONSE ${response.statusCode}\n'
      'PATH: ${response.requestOptions.path}\n'
      'RESPONSE: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    CustomLogger().log(
      Level.error,
      'ERROR ${err.response?.statusCode}\n'
      'PATH: ${err.requestOptions.path}\n'
      'RESPONSE: ${err.response?.data}',
    );
    return super.onError(err, handler);
  }
}
