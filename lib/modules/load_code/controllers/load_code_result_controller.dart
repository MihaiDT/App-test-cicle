import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/uploaded_product.dart';

class LoadCodeResultController extends GetxController {
  UploadedProduct? uploadedProduct;

  LoadCodeResultController() {
    uploadedProduct = Get.arguments['uploadedProduct'] as UploadedProduct?;
  }

  @override
  void onReady() {
    super.onReady();

    appController.selectedMissionId.refresh();
  }
}
