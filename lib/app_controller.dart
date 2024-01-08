import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/user.dart';

/// Just a wrapper in order to simplify getter access
class EasyGetter<T> {
  final Rx<ResponseHandler<T>> rxValue;

  EasyGetter({
    required this.rxValue,
  });

  T? get value => rxValue.value.content;

  ResponseHandler<T> get responseHandler => rxValue.value;

  set responseHandler(ResponseHandler<T> newResponseHandler) {
    rxValue.value = newResponseHandler;
  }
}

/// The app state
class AppController extends GetxController {
  final EasyGetter<User> user;

  AppController._({
    required this.user,
  });

  factory AppController.initial() {
    return AppController._(
      user: EasyGetter<User>(
        rxValue: ResponseHandler<User>.initial().obs,
      ),
    );
  }
}
