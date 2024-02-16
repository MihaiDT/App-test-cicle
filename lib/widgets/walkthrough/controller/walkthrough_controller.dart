import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalkthroughController extends GetxController {
  final RxInt currentStepIndex = 0.obs;
  final PageController pageController = PageController();

  ///increase the currentPageIndex by 1 when the continue button is pressed
  void onTapNext() {
    currentStepIndex.value++;
    pageController.animateToPage(
      currentStepIndex.value,
      curve: Curves.easeOut,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
  }

  ///skip to last page
  void goToLastPage(int lastPageIndex) {
    currentStepIndex.value = lastPageIndex;
    pageController.animateToPage(
      currentStepIndex.value,
      curve: Curves.easeOut,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
