import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/user.dart';

class YourInformationSectionController extends GetxController {
  User? get user {
    return appController.user.value;
  }
}
