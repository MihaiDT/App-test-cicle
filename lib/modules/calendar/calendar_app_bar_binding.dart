import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_app_bar_controller.dart';

class CalendarAppBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarAppBarController>(() => CalendarAppBarController());
  }
}
