import 'package:dio/dio.dart';

class ApiResult {
  final int statusCode;
  final Response? response;
  final String? errorMessage;

  ApiResult({required this.statusCode, this.response}) : errorMessage = null;

  ApiResult.error({required this.statusCode, this.errorMessage})
      : response = null;

  // Returns true if the response has an error associated with it
  bool get hasError =>
      (errorMessage != null && errorMessage!.isNotEmpty) || statusCode > 299;
}
