// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

import '../../core/helpers/api.dart';
import 'setting.dart';

class Session {
  // // Current user
  // final Rx<User> rxCurrentUser = User.empty().obs;
  // User get currentUser => rxCurrentUser.value;
  // set currentUser(User newValue) => rxCurrentUser.value = newValue;

  // Setting
  Setting? setting;

  // Walkthrough
  bool walkthroughDone = false;

  RxString rxBloodGroup = "".obs;
  String get bloodGroup => rxBloodGroup.value;
  set bloodGroup(String newValue) => rxBloodGroup.value = newValue;

  RxMap<String, bool> rxFoodEvaluations = RxMap.from({});
  Map<String, bool> get foodEvaluations => rxFoodEvaluations.value;
  set foodEvaluations(Map<String, bool> newValue) {
    rxFoodEvaluations.value.clear();
    rxFoodEvaluations.value.addAll(newValue);
    rxFoodEvaluations.refresh();
  }

  /// Methods
  logout() async {
    // currentUser = User.empty();
    clearAuthHeaders();
    // await AuthProvider.logout();
  }
}
