import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/routes/routes.dart';

class AccountPageController extends GetxController {
  String get email => appController.user.value?.email ?? '';

  Future<void> performLogout() async {
    await AuthenticationService.logout();
    HiveManager.removeIsPastDateCalculated();
    Get.offAllNamed(Routes.welcome);
  }

  bool get showPasswordSection =>
      appController.user.value?.provider == RegistrationProvider.email;
}
