import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class MyMensesSectionController extends GetxController {
  bool get hasSavedMensesInfo => periodDays != null && periodDuration != null;

  int? get periodDays => appController.user.value?.periodDays;

  int? get periodDuration => appController.user.value?.periodDuration;
}
