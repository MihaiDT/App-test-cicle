import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/badge.dart';

class CompletedBadgesController extends GetxController {
  /// Returns all completed badges
  List<Badge> get badges =>
      appController.badges.value
          ?.where((element) => element.isCompleted)
          .toList() ??
      [];
}
