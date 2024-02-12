import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class AccountPageController extends GetxController {
  String get email => appController.user.value?.email ?? '';
}
