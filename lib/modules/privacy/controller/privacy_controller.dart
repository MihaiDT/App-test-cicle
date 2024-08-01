import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/privacy/privacy_arguments.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';

class PrivacyController extends GetxController {
  final PrivacyArguments? arguments = Get.arguments;
  final RxBool firstAccepted = false.obs;
  final RxBool secondAccepted = false.obs;
  final RxBool thirdAccepted = false.obs;
  final RxBool isAcceptedAll = false.obs;
  RxBool buttonIsPending = false.obs;

  PrivacyController() {
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.privacyOldRegistration,
      (callback) {
        if (callback.isPending) {
          buttonIsPending.value = true;
        }
        if (callback.isSuccessful) {
          buttonIsPending.value = false;

          AuthenticationService.sendConsentsEmail();
          Get.toNamed(Routes.confirmCondition);
        }
      },
    );

    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.privacy,
      (callback) {
        if (callback.isPending) {
          buttonIsPending.value = true;
        }
        if (callback.isSuccessful) {
          buttonIsPending.value = false;
          if (arguments?.userIsAdult == true) {
            if (appController.user.value?.provider ==
                RegistrationProvider.email) {
              Get.offAllNamed(Routes.confirmEmailPage);
            } else {
              Get.offAllNamed(Routes.confirmCondition);
            }
          } else {
            Get.offAllNamed(Routes.confirmTutorEmail);
          }
        }
      },
    );
  }

  Future<void> savePrivacy() async {
    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        privacyMarketing: firstAccepted.value,
        privacyProfiling: secondAccepted.value,
        privacyBrandMarketing: thirdAccepted.value,
      ),
    );
  }

  /// This method takes the registerParameter and pass this data to the registration method
  Future<void> registerUser() async {
    appController.registerParameter.privacyMarketing = firstAccepted.value;
    appController.registerParameter.privacyProfiling = secondAccepted.value;
    appController.registerParameter.privacyBrandMarketing = thirdAccepted.value;

    AdjustManager.trackEvent(AjustEventType.privacyPolicy);

    PiwikManager.trackEvent(
      PiwikEventType.registration,
      action: 'step 5 - registration completed',
      privacyData: {
        'privacyMarketing': firstAccepted.value,
        'privacyProfiling': secondAccepted.value,
        'privacyBrandMarketing': thirdAccepted.value,
      },
    );

    await AuthenticationService.registration(
      appController.registerParameter,
    );
  }
}
