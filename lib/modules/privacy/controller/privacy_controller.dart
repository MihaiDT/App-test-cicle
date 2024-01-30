import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';

class PrivacyController extends GetxController {
  final RxBool firstAccepted = false.obs;
  final RxBool isAcceptedAll = false.obs;
  RxBool buttonIsPending = false.obs;


  void acceptAll() {
    isAcceptedAll.value = !isAcceptedAll.value;
    firstAccepted.value = isAcceptedAll.value;
  }

  void accept() {
    firstAccepted.value = !firstAccepted.value;
  }

  @override
  void onInit() {
    ever(
      appController.user.rxValue,
          (callback) {
        if (callback.isPending) {
          buttonIsPending = true.obs;
        }
        if (callback.isSuccessful) {
          Get.offAllNamed(Routes.confirmEmailPage);
        }
      },
    );
    super.onInit();
  }
}
