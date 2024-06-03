import 'package:get/get.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/consents/widgets/confirm_remove_calendar_consent.dart';
import 'package:lines/modules/consents/widgets/confirm_remove_diary_consent.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

class ConsentsController extends GetxController {
  final isMarketingEnabled = false.obs;
  final isProfilingEnabled = false.obs;
  final isBrandMarketingEnabled = false.obs;
  final isCalendarConsentEnabled = false.obs;
  final isDiaryConsentEnabled = false.obs;

  ConsentsController() {
    isMarketingEnabled.value = appController.user.value?.privacyMarketingEmail ?? false;
    isProfilingEnabled.value = appController.user.value?.privacyProfiling ?? false;
    isBrandMarketingEnabled.value = appController.user.value?.privacyBrandMarketing ?? false;
    isCalendarConsentEnabled.value = appController.user.value?.calendarConsent ?? false;
    isDiaryConsentEnabled.value = appController.user.value?.diaryConsent ?? false;
  }

  void toggleMarketingEnabled(bool value) {
    isMarketingEnabled.value = value;
    _updateConsents();
  }

  void toggleProfilingEnabled(bool value) {
    isProfilingEnabled.value = value;
    _updateConsents();
  }

  void toggleBrandMarketingEnabled(bool value) {
    isBrandMarketingEnabled.value = value;
    _updateConsents();
  }

  void toggleCalendarConsentEnabled(bool value) async {
    bool updateCalendar = false;

    if (value) {
      updateCalendar = true;
    } else {
      updateCalendar = await showErrorDialog(
        context: Get.context!,
        builder: (_) => const ConfirmRemoveCalendarConsentDialog(),
      );
    }

    if (updateCalendar) {
      isCalendarConsentEnabled.value = value;
      _updateConsents();
    }
  }

  void toggleDiaryConsentEnabled(bool value) async {
    bool updateDiary = false;

    if (value) {
      updateDiary = true;
    } else {
      updateDiary = await showErrorDialog(
        context: Get.context!,
        builder: (_) => const ConfirmRemoveDiaryConsentDialog(),
      );
    }

    if (updateDiary) {
      isDiaryConsentEnabled.value = value;
      _updateConsents();
    }
  }

  void _updateConsents() {
    AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        privacyMarketingEmail: isMarketingEnabled.value,
        privacyProfiling: isProfilingEnabled.value,
        privacyBrandMarketing: isBrandMarketingEnabled.value,
        calendarConsent: isCalendarConsentEnabled.value,
        diaryConsent: isDiaryConsentEnabled.value,
      ),
    );
  }
}
