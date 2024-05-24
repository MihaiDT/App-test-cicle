import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/uploaded_product.dart';

class LoadCodeResultController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;
  final UploadedProduct argument = Get.arguments;
}
