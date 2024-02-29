import 'dart:async';

import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/interest.dart';

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
  void checkForChanges() {
    if (rxSelectedInterestsId != previousInterestsId) {
      /// Update previous state if there are changes.
      previousInterestsId = List.from(rxSelectedInterestsId);
    }
  }

  /// Toggles the selection of an interest.
  void toggleInterest(String interest) {
    if (rxSelectedInterestsId.contains(interest)) {
      /// Remove interest if it's already selected.
      rxSelectedInterestsId.remove(interest);
    } else if (rxSelectedInterestsId.length < 3) {
      /// Add interest if less than 3 are selected.
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
