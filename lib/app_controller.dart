import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/user.dart';
import 'package:lines/repository/authentication_service.dart';

/// Just a wrapper in order to simplify getter access
class EasyGetter<T> {
  Rx<ResponseHandler<T>> rxValue;

  EasyGetter() : rxValue = ResponseHandler<T>.initial().obs;

  T? get value => rxValue.value.content;

  ResponseHandler<T> get responseHandler => rxValue.value;

  set responseHandler(ResponseHandler<T> newResponseHandler) {
    rxValue.value = newResponseHandler;
  }
}

/// The app state
class AppController extends GetxController {
  /// The response of log in and register api
  final EasyGetter<User> user;

  /// The parameter used to register the user
  final RegisterParameter registerParameter;

  /// Determine if the user is trying to log in or sign up
  final RxBool isLoginFlow;

  AppController._({
    required this.user,
    required this.registerParameter,
    required this.isLoginFlow,
  });

  factory AppController.initial() {
    return AppController._(
      user: EasyGetter<User>(),
      registerParameter: RegisterParameter.initial(),
      isLoginFlow: false.obs,
    );
  }
}
