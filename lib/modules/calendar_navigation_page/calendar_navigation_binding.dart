import 'package:get/get.dart';
import 'package:lines/modules/calendar_navigation_page/calendar_navigation_controller.dart';

class CalendarNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarNavigationController>(
      () => CalendarNavigationController(),
    );
  }
}
