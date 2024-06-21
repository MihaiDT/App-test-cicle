import 'package:get/get.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';

class CookiesFingerprintingController extends GetxController {
  late final bool isEditing = Get.arguments as bool? ?? false;

  Rx<bool?>? hasAcceptedCookieStats;

  Rx<bool?>? hasAcceptedCookieProfiling;

  @override
  void onInit() {
    hasAcceptedCookieStats = HiveManager.hasAcceptedCookieStats.obs;
    hasAcceptedCookieProfiling = HiveManager.hasAcceptedCookieProfiling.obs;
    super.onInit();
  }

  bool get hasChanged =>
      (hasAcceptedCookieStats?.value != null &&
          hasAcceptedCookieProfiling?.value != null) &&
      (hasAcceptedCookieStats?.value != HiveManager.hasAcceptedCookieStats ||
          hasAcceptedCookieProfiling?.value !=
              HiveManager.hasAcceptedCookieProfiling);

  void navigateToNextPage() {
    HiveManager.hasAcceptedCookieProfiling = hasAcceptedCookieProfiling?.value;
    HiveManager.hasAcceptedCookieStats = hasAcceptedCookieStats?.value;
    if (isEditing) {
      _updateConsents();
      Get.back();
      showFullScreenLoader();
    } else {
      Get.offAndToNamed(
        appController.isLoginFlow.value == true
            ? Routes.login
            : Routes.register,
      );
    }
  }

  Future<void> _updateConsents() async {
    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        hasConsentCookieProfiling: hasAcceptedCookieProfiling?.value,
        hasConsentCookieStats: hasAcceptedCookieStats?.value,
      ),
    );
  }
}
