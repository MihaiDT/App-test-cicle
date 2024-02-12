import 'package:get/get.dart';
import 'package:lines/modules/drawer/controller/account_page_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountPageController>(() => AccountPageController());
  }
}
