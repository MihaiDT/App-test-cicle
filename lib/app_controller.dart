import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/user.dart';

/// Just a wrapper in order to simplify getter access
class EasyGetter<T> {
  ResponseHandler<T> handler;

  EasyGetter({
    required this.handler,
  });

  T? get value => handler.content;

  ResponseHandler<T> get responseHandler => handler;

  set responseHandler(ResponseHandler<T> newResponseHandler) {
    handler = newResponseHandler;
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
        handler: ResponseHandler.initial(),
      ),
    );
  }
}
