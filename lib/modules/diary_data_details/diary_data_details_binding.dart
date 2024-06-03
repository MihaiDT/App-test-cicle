import 'package:get/get.dart';
import 'package:lines/modules/diary_data_details/diary_data_details_controller.dart';

class DiaryDataDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DiaryDataDetailsController());
  }
}
