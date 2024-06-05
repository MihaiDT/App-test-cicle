import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class MyMensesSectionController extends GetxController {
  bool get hasSavedMensesInfo =>
      hasCalendarPermission && periodDays != null && periodDuration != null;

  int? get periodDays => appController.user.value?.periodDays;

  int? get periodDuration => appController.user.value?.periodDuration;

  bool get hasCalendarPermission =>
      appController.user.value?.calendarConsent ?? false;
}
