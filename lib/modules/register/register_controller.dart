import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';

class RegisterAndLoginController extends AppScaffoldController {
  final RxBool _isLoginPage = RxBool(false);

  bool get isLoginPage => _isLoginPage.value;

  set isLoginPage(bool value) {
    _isLoginPage.value = value;
  }

  final RxBool _hidePassword = RxBool(true);

  bool get hidePassword => _hidePassword.value;

  set hidePassword(bool value) {
    _hidePassword.value = value;
  }

  @override
  void onInit() {
    isLoginPage = Get.arguments.isLoginPage;

    super.onInit();
  }

  Future<void> loginUser(String email, String password) async {
    await AuthenticationService.loginUser(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
  }
}
