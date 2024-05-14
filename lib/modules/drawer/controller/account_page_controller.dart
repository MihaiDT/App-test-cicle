import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';

class AccountPageController extends GetxController {
  String get email => appController.user.value?.email ?? '';

  void performLogout() {
    AuthenticationService.logout();
  }

  bool get showPasswordSection =>
      appController.user.value?.provider == RegistrationProvider.email;
}
