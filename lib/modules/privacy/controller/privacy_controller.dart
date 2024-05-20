import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/privacy/privacy_arguments.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class PrivacyController extends GetxController {
  final PrivacyArguments? arguments = Get.arguments;
  final RxBool firstAccepted = false.obs;
  final RxBool secondAccepted = false.obs;
  final RxBool thirdAccepted = false.obs;
  final RxBool isAcceptedAll = false.obs;
  RxBool buttonIsPending = false.obs;

  @override
  void onInit() {
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.privacy,
      (callback) {
        if (callback.isPending) {
          buttonIsPending.value = true;
        }
        if (callback.isSuccessful) {
          buttonIsPending.value = false;
          arguments?.userIsAdult == true
              ? Get.offAllNamed(Routes.confirmEmailPage)
              : Get.offAllNamed(Routes.confirmTutorEmail);
        }
      },
    );
    super.onInit();
  }

  /// This method takes the registerParameter and pass this data to the registration method
  Future<void> registerUser() async {
    appController.registerParameter.privacyBrandMarketing = firstAccepted.value;
    appController.registerParameter.privacyMarketing = secondAccepted.value;
    appController.registerParameter.privacyProfiling = thirdAccepted.value;
    await AuthenticationService.registration(
      appController.registerParameter,
    );
  }
}
