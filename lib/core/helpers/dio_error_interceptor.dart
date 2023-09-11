import 'package:dio/dio.dart';

// import '../../../routes/routes.dart';
// import '../../widgets/alert_error.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // _setAuthHeaders(options.headers);

    handler.next(options);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // Get.context?.loaderOverlay.hide();

  //   if (disableDioInterceptor && err.response?.statusCode == 410) {
  //     // L'utente è in versione free e quindi devo mostrare la view di acquisto Pro
  //     // Get.toNamed(page)
  //   } else if (disableDioInterceptor && err.response?.statusCode == 409) {
  //     super.onError(err, handler);
  //   } else {
  //     if (err.response?.statusCode == 401) {
  //       if (!err.response!.realUri.path.contains('/auth/') && !err.response!.realUri.path.contains('/oauth/')) {
  //         Get.offAllNamed(Routes.welcome);
  //       }

  //       AlertError.show(
  //         errorMessage: apiErrorMessage(err),
  //       );
  //     } else if (err.response?.statusCode == 403) {
  //       AlertError.show(
  //         errorMessage: "Operazione proibita!",
  //       );
  //     } else if (err.response?.statusCode == 502) {
  //       AlertError.show(
  //         errorMessage: "Ci scusiamo per il disagio, ritorneremo tra poco.",
  //       );
  //     } else {
  //       super.onError(err, handler);
  //     }

  //     // else if (err.response?.statusCode == 500) {
  //     //   // FIXME: notificare qualcuno
  //     //   AlertError.show(
  //     //     errorMessage:
  //     //         "Ops! Qualcosa è andato storto!\nI nostri tecnici sono stati notificati dell'inconveniente e risolveranno il problema il più rapidamente possibile.",
  //     //   );
  //     // } else if (err.response?.statusCode == 404) {
  //     //   AlertError.show(
  //     //     errorMessage: "Risorsa non trovata!",
  //     //   );
  //     // } else if (err.response?.statusCode != null &&
  //     //     err.response!.statusCode! > 399 &&
  //     //     err.response!.statusCode! < 500) {
  //     //   try {
  //     //     AlertError.show(
  //     //       errorMessage: apiErrorMessage(err),
  //     //     );
  //     //   } catch (error) {
  //     //     // FIXME: notificare qualcuno
  //     //     logError(error: error);

  //     //     AlertError.show(
  //     //       errorMessage:
  //     //           "Ops! Qualcosa è andato storto!\nI nostri tecnici sono stati notificati dell'inconveniente e risolveranno il problema il più rapidamente possibile.",
  //     //     );
  //     //   }
  //     // } else {
  //     //   AlertError.show(
  //     //     errorMessage:
  //     //         "Ops! Qualcosa è andato storto!\nI nostri tecnici sono stati notificati dell'inconveniente e risolveranno il problema il più rapidamente possibile.",
  //     //   );
  //     // }
  //   }
  // }

  // // _setAppHeaders(Map<String, dynamic> headers) {
  // //   headers['x-device-os'] = Platform.isIOS ? 'ios' : 'android';
  // //   headers['x-language-code'] = session.currentUser.languageCode.name;
  // // }

  // _setAuthHeaders(Map<String, dynamic> headers) {
  //   if (authHeaders.accessToken != null) {
  //     headers['access-token'] = authHeaders.accessToken;
  //   }
  //   if (authHeaders.client != null) {
  //     headers['client'] = authHeaders.client;
  //   }
  //   if (authHeaders.tokenType != null) {
  //     headers['token-type'] = authHeaders.tokenType;
  //   }
  //   if (authHeaders.uid != null) {
  //     headers['uid'] = authHeaders.uid;
  //   }
  // }
}
