import 'package:get/get.dart';

import '../../core/utils/helpers.dart';

class WelcomeController extends GetxController {
  WelcomeController() {
    _startAnimation();
  }

  final RxBool rxStartAnimation = RxBool(false);
  bool get startAnimation => rxStartAnimation.value;
  set startAnimation(bool newValue) => rxStartAnimation.value = newValue;

  _startAnimation() async {
    await wait(milliseconds: 300);
    startAnimation = true;
  }
}
