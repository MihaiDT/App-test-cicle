import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class DrawerMainPageController extends GetxController {
  int get coinTotal => appController.user.value?.coinsCollected ?? 0;

  String get name => appController.user.value?.firstName ?? "";
}
