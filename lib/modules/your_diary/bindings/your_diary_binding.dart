import 'package:get/get.dart';
import 'package:lines/modules/your_diary/your_diary_controller.dart';

class YourDiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YourDiaryController>(() => YourDiaryController());
  }
}
