import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class PrivacyController extends GetxController {
  final RxBool firstAccepted = false.obs;
  final RxBool secondAccepted = false.obs;
  final RxBool thirdAccepted = false.obs;
  final RxBool isAcceptedAll = false.obs;
  RxBool buttonIsPending = false.obs;

  @override
  void onInit() {
    ever(
      appController.user.rxValue,
      (callback) {
        if (callback.isPending) {
          buttonIsPending.value = true;
        }
        if (callback.isSuccessful) {
          buttonIsPending.value = false;
          Get.offAllNamed(Routes.confirmEmailPage);
        }
      },
    );
    super.onInit();
  }

  /// This method takes the registerParameter and pass this data to the registration method
  Future<void> registerUser() async {
    appController.registerParameter.privacyMarketing = true;
    appController.registerParameter.privacyProfiling = true;
    await AuthenticationService.registration(
      appController.registerParameter,
    );
  }

  void acceptAll() {
    firstAccepted.value = true;
    secondAccepted.value = true;
    thirdAccepted.value = true;
  }

  void accept() {}
}
