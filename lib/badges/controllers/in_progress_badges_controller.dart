import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/badge.dart';

class InProgressBadgesController extends GetxController {
  List<Badge> get badges => appController.badges.value ?? [];
}
