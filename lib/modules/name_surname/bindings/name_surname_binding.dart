import 'package:get/get.dart';
import 'package:lines/modules/name_surname/controller/name_surname_controller.dart';

class NameSurnameBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NameSurnameController());
  }
}
