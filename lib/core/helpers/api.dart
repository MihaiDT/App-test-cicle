import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// import '../../data/models/auth_headers.dart';
// import '../../storages/auth_storage.dart';
import '../utils/singletons.dart';

get apiEndpoint => env.env['API_ENDPOINT'];
get proxyEndpoint => "${env.env['PROXY']}:9090";
// bool get authTokenPresent => authHeaders.accessToken != null;
get isProxymanEnabled => kDebugMode ? env.env['ENABLE_PROXYMAN'] == 'true' : false;

// Dio interceptor: se false non vengono intercettati gli errori ma viene lasciata la gestione all'utente
bool disableDioInterceptor = false;

// Converte un errore DioError in stringa secondo lo standard API Tandù
String apiErrorMessage(DioError err) {
  String errorMessage = '';

  if (err.response != null && err.response!.data != null && err.response!.data is Map) {
    final Map<String, dynamic> responseData = err.response!.data;
    for (final error in (responseData['errors'] as Map<String, dynamic>).values) {
      errorMessage = error;
    }
  } else {
    errorMessage = err.response!.data.toString();
  }

  return errorMessage;
}

clearAuthHeaders() async {
  // authHeaders.accessToken = null;
  // authHeaders.uid = null;
  // authHeaders.tokenType = null;
  // authHeaders.client = null;

  dio.options.headers = {};
}

storeAuthHeaders(Headers headers) async {
  // authHeaders = AuthHeaders(
  //   accessToken: headers.value('access-token') as String,
  //   client: headers.value('client') as String,
  //   tokenType: headers.value('token-type') as String,
  //   uid: headers.value('uid') as String,
  // );

  // // Salvo i dati nelle SharedPrefs, così da usarli alla prossima apertura di app
  // await AuthStorage.store(authHeaders);
}

storeCurrentUserId(String id) async {
  // Salvo i dati nelle SharedPrefs, così da usarli alla prossima apertura di app
  // await AuthStorage.storeUserId(id);
}
