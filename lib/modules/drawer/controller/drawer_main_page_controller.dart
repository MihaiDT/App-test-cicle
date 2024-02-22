import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class DrawerMainPageController extends GetxController {
  String get name => appController.user.value?.firstName ?? "";
}
