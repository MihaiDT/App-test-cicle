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
  final EasyGetter<User> user;
  final RegisterParameter registerParameter;

  AppController._({
    required this.user,
    required this.registerParameter,
  });

  factory AppController.initial() {
    return AppController._(
      user: EasyGetter<User>(),
      registerParameter: RegisterParameter.initial(),
    );
  }
}
