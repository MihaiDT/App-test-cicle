import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';

class ConfirmConditionController extends GetxController {
  String get email => appController.user.value?.email ?? '';

  Future<void> sendNewEmail() async {
    await AuthenticationService.sendConsentsEmail();
  }
}
