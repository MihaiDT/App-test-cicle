import 'package:get/get.dart';

class MensesDurationCounterController extends GetxController {
  Rx<int> counter = 3.obs;

  void decrementCounter() {
    if (counter.value > 3) {
      counter.value--;
    }

    update();
  }

  void incrementCounter() {
    if (counter.value < 10) {
      counter.value++;
    }

    update();
  }
}
