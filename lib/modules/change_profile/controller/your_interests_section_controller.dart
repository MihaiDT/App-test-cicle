import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/interest.dart';
import 'package:lines/repository/authentication_service.dart';

class YourInterestsSectionController extends GetxController {
  /// All available interests.
  List<Interest> get allInterests =>
      appController.settings.value?.interests ?? [];

  /// User's selected interests.
  List<Interest>? get userInterests => appController.user.value?.interests;

  /// Observable list of selected interest IDs.
  final rxSelectedInterestsId = <String>[].obs;

  /// Previous state of selected interest IDs.
  List<String> previousInterestsId = [];

  /// Timer for checking changes in selected interests.
  Timer? timer;

  RxString percentageValue =
      (appController.user.value?.hasCompletedInterests == true ? '' : "20%")
          .obs;

  @override
  void onInit() {
    super.onInit();

    /// Initialize timer to check for changes every 3 seconds.
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (Timer t) => checkForChanges(),
    );

    /// Initialize selected interests from user's interests.
    userInterests?.forEach((interest) {
      rxSelectedInterestsId.add(interest.id);
    });
  }

  /// Checks if there are changes in the selected interests.
  Future<void> checkForChanges() async {
    if (!listEquals(rxSelectedInterestsId, previousInterestsId)) {
      /// Update previous state if there are changes.
      previousInterestsId = List.from(rxSelectedInterestsId);
      await AuthenticationService.updateInterests(previousInterestsId);
    }
  }

  /// Toggles the selection of an interest.
  void toggleInterest(String interest) {
    if (rxSelectedInterestsId.contains(interest)) {
      /// Remove interest if it's already selected and total selected interests are more than 3.
      if (rxSelectedInterestsId.length > 3) {
        rxSelectedInterestsId.remove(interest);
      }
    } else {
      /// Add interest.
      rxSelectedInterestsId.add(interest);
    }
  }

  @override
  void onClose() {
    /// Cancel the timer when the controller is disposed.
    timer?.cancel();
    super.onClose();
  }
}
