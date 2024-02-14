import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class YourMensesSectionController extends GetxController {
  int get periodDays => appController.user.value?.periodDays ?? 0;

  int get periodDuration => appController.user.value?.periodDuration ?? 0;
}
