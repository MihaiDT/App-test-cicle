import 'package:get/get.dart';

import 'package:lines/modules/calendar/calendar_controller.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarController());
  }
}
