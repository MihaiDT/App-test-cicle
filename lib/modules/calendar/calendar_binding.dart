import 'package:get/get.dart';

import 'calendar_controller.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}
