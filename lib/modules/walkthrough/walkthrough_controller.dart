import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../widgets/layouts/app_scaffold_controller.dart';

class WalkthroughController extends AppScaffoldController {
  final PageController pageViewController = PageController(
    initialPage: 0,
  );

  final bottomAreaKey = GlobalKey();

  final int lastStep = 4;

  final RxDouble rxHBottomArea = 0.0.obs;
  final RxInt rxCurrentStepIndex = 0.obs;

  int get currentStepIndex => rxCurrentStepIndex.value;
  set currentStepIndex(int newValue) => rxCurrentStepIndex.value = newValue;

  double get hBottomArea => rxHBottomArea.value;
  set hBottomArea(double newValue) => rxHBottomArea.value = newValue;

  bool get isLastStep => currentStepIndex == lastStep;

  onPageChanged(int newIndex) {
    currentStepIndex = newIndex;
  }

  onTapLetsStart() {
    Get.offNamed(Routes.main);
    // FIXME: Get.toNamed(Routes.signin);
  }

  onTapSkip() {
    Get.offNamed(Routes.main);
    // FIXME: Get.toNamed(Routes.signin);
  }

  onTapNext() {
    currentStepIndex += 1;

    pageViewController.animateToPage(
      currentStepIndex,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
