import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/badge.dart';
import 'package:lines/repository/badges_service.dart';

class MyBadgesController extends GetxController {
  final RxBool isLoading = false.obs;

  @override
  Future<dynamic> onReady() async {
    if (!appController.badges.responseHandler.isSuccessful) {
      await BadgesService.fetchBadges();
    }

    ever(
      appController.badges.rxValue,
      (badges) {
        if (badges.isPending) {
          isLoading.value = true;
        }
        if (badges.isSuccessful || badges.isFailed) {
          isLoading.value = false;
        }
      },
    );
    super.onReady();
  }

  RxBool get showBadgesSection {
    return (badges.isNotEmpty && !isLoading.value).obs;
  }

  List<Badge> get badges =>
      appController.badges.value
          ?.where((element) => !element.isCompleted)
          .toList() ??
      [];
}
