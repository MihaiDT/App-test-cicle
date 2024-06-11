import 'package:get/get.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/consents/widgets/confirm_remove_calendar_consent.dart';
import 'package:lines/modules/consents/widgets/confirm_remove_diary_consent.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';

class ConsentsController extends GetxController {
  final isMarketingEnabled = false.obs;
  final isProfilingEnabled = false.obs;
  final isBrandMarketingEnabled = false.obs;
  final isCalendarConsentEnabled = false.obs;
  final isDiaryConsentEnabled = false.obs;

  bool isChanged = false;

  ConsentsController() {
    isMarketingEnabled.value =
        appController.user.value?.privacyMarketing ?? false;
    isProfilingEnabled.value =
        appController.user.value?.privacyProfiling ?? false;
    isBrandMarketingEnabled.value =
        appController.user.value?.privacyBrandMarketing ?? false;
    isCalendarConsentEnabled.value =
        appController.user.value?.calendarConsent ?? false;
    isDiaryConsentEnabled.value =
        appController.user.value?.diaryConsent ?? false;

    isChanged = false;
  }

  void toggleMarketingEnabled(bool value) {
    isMarketingEnabled.value = value;
    isChanged = true;
  }

  void toggleProfilingEnabled(bool value) {
    isProfilingEnabled.value = value;
    isChanged = true;
  }

  void toggleBrandMarketingEnabled(bool value) {
    isBrandMarketingEnabled.value = value;
    isChanged = true;
  }

  void toggleCalendarConsentEnabled(bool value) async {
    bool updateCalendar = false;

    if (value) {
      updateCalendar = true;
    } else {
      updateCalendar = await showErrorDialog(
        context: Get.context!,
        builder: (_) => const ConfirmRemoveCalendarConsentDialog(),
        dismissible: false,
      );
    }

    if (updateCalendar) {
      isCalendarConsentEnabled.value = value;
      isChanged = true;
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
        dismissible: false,
      );
    }

    if (updateDiary) {
      isDiaryConsentEnabled.value = value;
      isChanged = true;
    }
  }

  Future<void> updateConsents() async {
    showFullScreenLoader();

    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        privacyMarketing: isMarketingEnabled.value,
        privacyProfiling: isProfilingEnabled.value,
        privacyBrandMarketing: isBrandMarketingEnabled.value,
        calendarConsent: isCalendarConsentEnabled.value,
        diaryConsent: isDiaryConsentEnabled.value,
      ),
    );

    await CalendarService.fetchCurrentPeriod();
    await CalendarService.fetchCalendarData();
  }
}
