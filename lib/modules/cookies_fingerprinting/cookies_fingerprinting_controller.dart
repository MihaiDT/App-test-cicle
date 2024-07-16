import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
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

  String get privacyUrl => appController.settings.value?.privacyUrl ?? '';

  @override
  void onInit() {
    hasAcceptedCookieStats = HiveManager.hasAcceptedCookieStats.obs;
    hasAcceptedCookieProfiling = HiveManager.hasAcceptedCookieProfiling.obs;
    super.onInit();
  }

  bool get enableConfirmButton =>
      hasAcceptedCookieStats?.value != null &&
      hasAcceptedCookieProfiling?.value != null;

  void navigateToNextPage() async {
    HiveManager.hasAcceptedCookieProfiling =
        (await _isAppTrackingTransparencyPermissionAccepted()) &&
            (hasAcceptedCookieProfiling?.value ?? false);
    HiveManager.hasAcceptedCookieStats =
        (await _isAppTrackingTransparencyPermissionAccepted()) &&
            (hasAcceptedCookieStats?.value ?? false);
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

  Future<bool> _isAppTrackingTransparencyPermissionAccepted() async {
    if (Platform.isIOS) {
      return await AppTrackingTransparency.requestTrackingAuthorization() ==
          TrackingStatus.authorized;
    }
    return true;
  }
}
