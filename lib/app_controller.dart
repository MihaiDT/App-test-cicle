import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/user.dart';

class AppController extends GetxController {
  EasyGetter<User>? user;
}

class EasyGetter<T> {
  final Rx<ResponseHandler<T>> rxValue = ResponseHandler<T>.initial().obs;

  T? get value => rxValue.value.content;

  ResponseHandler<T> get responseHandler => rxValue.value;

  set responseHandler(ResponseHandler<T> newResponseHandler) {
    rxValue.value = newResponseHandler;
  }
}
