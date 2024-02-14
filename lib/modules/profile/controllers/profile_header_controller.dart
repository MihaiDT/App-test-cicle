import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class ProfileHeaderController extends GetxController {
  String get userName => appController.user.value?.firstName ?? '';
}
