import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class ProfileCompletionPercentageController extends GetxController {
  int get completionPercentage =>
      appController.user.value?.profileCompletionPercentage ?? 0;

  bool get profileIsCompleted => completionPercentage == 100;
}
