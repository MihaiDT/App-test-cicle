import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/data/models/user.dart';

class AppController extends GetxController {
  Rx<ResponseHandler<User>> rxUser = ResponseHandler<User>.initial().obs;

  User? get user => rxUser.value.isSuccessful ? rxUser.value.content : null;
}
