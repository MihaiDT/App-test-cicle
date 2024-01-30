import 'package:get/get.dart';

class PrivacyController extends GetxController {
  final RxBool firstAccepted = false.obs;
  final RxBool isAcceptedAll = false.obs;

  void acceptAll() {
    isAcceptedAll.value = !isAcceptedAll.value;
    firstAccepted.value = isAcceptedAll.value;
  }

  void accept() {
    firstAccepted.value = !firstAccepted.value;
  }
}
