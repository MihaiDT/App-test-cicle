import 'package:get/get.dart';
import 'package:lines/modules/birth_date/birth_date_controller.dart';

class BirthDateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BirthDateController());
  }
}
