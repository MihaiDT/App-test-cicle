import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class YourMensesSectionController extends GetxController {
  RxInt get periodDays => (appController.user.value?.periodDays ?? 0).obs;

  RxInt get periodDuration =>
      (appController.user.value?.periodDuration ?? 0).obs;
}
