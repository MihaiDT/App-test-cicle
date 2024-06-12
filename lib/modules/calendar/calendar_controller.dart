// ignore_for_file: invalid_use_of_protected_member, avoid_single_cascade_in_expression_statements

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/data/models/symptom_diaries.dart';
import 'package:lines/modules/calendar/calendar_year_controller.dart';
import 'package:lines/modules/calendar/month_calendar_mixin.dart';
import 'package:lines/modules/calendar/widgets/calendar_consent_dialog.dart';
import 'package:lines/modules/calendar/widgets/diary_consent_dialog%20copy.dart';
import 'package:lines/modules/calendar/widgets/too_many_categories_dialog.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class CalendarController extends GetxController with MonthCalendarMixin {
  /// Current date selected by the user.
  final Rx<DateTime> rxSelectedDate = Rx(DateTime.now());

  final pageViewController = PageController();

  RxList<String> symptomIds = <String>[].obs;
  RxList<String> savedCategoryIds = <String>[].obs;
  RxList<String> addedMensesDates = <String>[].obs;
  RxList<String> removeMensesDates = <String>[].obs;

  RxBool diaryConsentsUpdated = true.obs;

  /// DraggableScrollableController for calendarBottomSheet
  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  bool get showSaveButtonSymptoms {
    if (pageShouldRefresh &&
        selectedTab.value == CalendarTabs.monthTab &&
        (symptomsHasChanged.value ||
            textInputHasChanged.value ||
            savedCategoryHasChanged)) {}
    return pageShouldRefresh &&
        selectedTab.value == CalendarTabs.monthTab &&
        (symptomsHasChanged.value ||
            textInputHasChanged.value ||
            savedCategoryHasChanged);
  }

  bool get showBottomSheet {
    return selectedTab.value == CalendarTabs.monthTab;
  }

  bool get userIsAdult {
    return appController.user.value?.hasMoreThan18Years == true;
  }

  RxBool get symptomsHasChanged {
    final symptomsIDsSet = symptomIds.toSet();
    final symptomsIDsSetFromDiaries =
        appController.symptomsDiaries.value?.symptomsIDs?.toSet();
    if (appController.symptomsDiaries.value?.symptomsIDs == null) {
      return RxBool(false);
    }
    if (symptomsIDsSet.length != symptomsIDsSetFromDiaries?.length) {
      return RxBool(true);
    }

    for (final symptomId in symptomsIDsSet) {
      if (symptomsIDsSetFromDiaries?.contains(symptomId) == false) {
        return RxBool(true);
      }
    }

    return RxBool(false);
  }

  /// Whether or not the bottom sheet must stay hidden
  final RxBool rxShowBottomMenu = true.obs;

  /// Show save button on top of the bottom sheet
  RxBool showTopButton = true.obs;

  /// Maximum height of the bottom sheet
  final bottomSheetMaxHeight = 0.96;

  /// Size of the bottom sheet
  RxDouble get rxSheetVSize {
    /// The bottomsheet should be 0.1 of the screen height if the user is not an adult+
    /// because the bottom sheet is not shown in this case but only the top buttons
    if (!userIsAdult) {
      return 0.1.obs;
    }
    return 0.25.obs;
  }

  /// Currently selected tab , by default the monthly calendar is shown
  final Rx<CalendarTabs> selectedTab = Rx(CalendarTabs.monthTab);

  /// The mode for the calendar grid
  final RxBool modifyPeriodMode = false.obs;

  List<SymptomCategory> get symptomCategories =>
      appController.symptomCategory.value ?? [];

  RxBool get showRecapMenu => symptomIds.isNotEmpty.obs;

  bool get pageShouldRefresh =>
      diaryConsentsUpdated.value &&
      (appController.symptomCategory.responseHandler.isSuccessful &&
          appController.calendarData.responseHandler.isSuccessful &&
          appController.categoriesSavedInHome.responseHandler.isSuccessful);

  CalendarYearController get calendarYearController {
    return Get.find<CalendarYearController>();
  }

  RxBool bottomSheetIsPending = false.obs;

  RxString oreDiSonnoValue = "".obs;

  RxList<String> oreDiSonnoValues = List.generate(17, (index) {
    final hour = (index / 2 + 4).floor();
    final minute = index % 2 == 0 ? '00' : '30';
    return '$hour:$minute Ore';
  }).obs;

  RxString quantitaAcquaValue = "".obs;

  RxList<String> quantitaAcquaValues =
      List.generate(10, (index) => '${(index + 1) * 0.5} litri').obs;

  RxString pesoValue = "".obs;
  RxList<String> pesoValues =
      List.generate(291, (index) => '${index + 40} kg').obs;

  RxString notesInitialValue = ''.obs;

  CalendarController() {
    ever(
      rxSelectedDate,
      condition: () => Get.currentRoute == Routes.calendar,
      (newDayValue) {
        _onDayChanged(newDayValue);
      },
    );

    ever(
      appController.symptomsDiaries.rxValue,
      (callback) {
        if (callback.isSuccessful) {
          initSymptomForDate();
          bottomSheetIsPending.value = true;
        } else {
          bottomSheetIsPending.value = false;
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    initMonthCalendar();
    _initCalendarYearController();
  }

  @override
  void onReady() async {
    super.onReady();
    AppLifecycleListener(
      onResume: () {
        selectedTab.value = CalendarTabs.monthTab;
        wait(milliseconds: 100).then(
          (_) {
            jumpToToday();
          },
        );
      },
    );
    ever(
      selectedTab,
      condition: () => Get.currentRoute == Routes.calendar,
      (newTab) {
        if (newTab == CalendarTabs.yearTab) {
          collapseBottomSheet();
        } else {
          jumpToToday();
          rxShowBottomMenu.value = true;
          expandBottomSheetTorxSheetVSize();
        }
      },
    );
    draggableScrollableController.addListener(() {
      draggableScrollableController.size == bottomSheetMaxHeight
          ? showTopButton.value = false
          : showTopButton.value = true;
    });
    if (!appController.symptomCategory.responseHandler.isSuccessful) {
      await CalendarService.symptomCategories;
    }
    if (!appController.symptomsDiaries.responseHandler.isSuccessful) {
      await CalendarService.fetchSymptomsForSpecificDate(rxSelectedDate.value);
    }
    if (!appController.categoriesSavedInHome.responseHandler.isSuccessful) {
      await CalendarService.homePageSymptomCategories;
    }

    _initSavedCategory();

    addedMensesDates.addAll(
      appController.calendarData.value!.calendarDays
          .where((element) => element.isMensesDay)
          .map((e) => e.date),
    );
    jumpToToday();

    bool calendarConsent = appController.user.value!.calendarConsent ?? false;
    bool diaryConsent = appController.user.value!.diaryConsent ?? false;

    if (!calendarConsent) {
      calendarConsent = await showErrorDialog(
        context: Get.context!,
        builder: (_) => const CalendarConsentDialog(),
        dismissible: true,
      );
    }

    if (calendarConsent != appController.user.value!.calendarConsent ||
        diaryConsent != appController.user.value!.diaryConsent) {
      _updateConsents(
        diaryConsent,
        calendarConsent,
      );
    }

    if (!calendarConsent) {
      Get.back();
    }

    // Se è la prima volta che accedo al calendario
    if (!HiveManager.isPastDateCalculated &&
        appController.calendarData.value!.calendarDays.isNotEmpty) {
      HiveManager.isPastDateCalculated = true;

      await wait(milliseconds: 600);

      FlushBar(
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: HeadlineSmall(
            "Abbiamo fatto una stima dei tuoi cicli precedenti. Conferma o modifica questi dati per includerli nel report del tuo ciclo.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
        ),
      ).show(
        Get.context!,
      );
    }

    jumpToToday();
  }

  void _updateConsents(bool diaryConsent, bool calendarConsent) async {
    onDayTapped(rxSelectedDate.value); // Force

    diaryConsentsUpdated.value = false;
    diaryConsentsUpdated.refresh();

    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        calendarConsent: calendarConsent,
        diaryConsent: diaryConsent,
      ),
    );

    diaryConsentsUpdated.value = true;
    diaryConsentsUpdated.refresh();

    // Force the view refreshing
    selectedTab.refresh();
    jumpToToday();
  }

  void initSymptomForDate() {
    if (appController.symptomsDiaries.value?.date ==
        dateFormatYMD.format(rxSelectedDate.value)) {
      symptomIds.value.clear();
      symptomIds.value
          .addAll(appController.symptomsDiaries.value?.symptomsIDs ?? []);
      oreDiSonnoValue.value =
          appController.symptomsDiaries.value?.hoursOfSleep ?? "";
      quantitaAcquaValue.value =
          appController.symptomsDiaries.value?.waterLiters ?? "";
      pesoValue.value = appController.symptomsDiaries.value?.weight ?? "";
      notesInitialValue.value =
          appController.symptomsDiaries.value?.notes ?? "";
    } else {
      symptomIds.value = [];
      oreDiSonnoValue.value = "";
    }
    symptomIds.refresh();
  }

  /// Initialize the list of categories saved in home
  void _initSavedCategory() {
    savedCategoryIds.value.clear();
    savedCategoryIds.value.addAll(
      appController.categoriesSavedInHome.value?.map((e) => e.id) ?? [],
    );
    savedCategoryIds.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    draggableScrollableController.dispose();
  }

  void updateSymptomList(String symptomId) {
    _updateFlowMensesSymptomList(symptomId);
    if (symptomIds.contains(symptomId)) {
      symptomIds.remove(symptomId);
    } else {
      symptomIds.add(symptomId);
    }

    symptomIds.refresh();
  }

  /// Check if the symptom is in the category
  bool _isSymptomInCategory(SymptomCategory? category, String symptomId) {
    if (category == null) return false;
    return category.symptoms.any((element) => element.id == symptomId);
  }

  /// Managed exception for the symptoms of the "Perdite" and "Flusso mestruale" categories that can select only one symptom at a time.
  void _updateFlowMensesSymptomList(String symptomId) {
    final perditeCategory = appController.symptomCategory.value
        ?.firstWhere((element) => element.name == "Perdite");
    final flowMensesCategory = appController.symptomCategory.value
        ?.firstWhere((element) => element.name == "Flusso mestruale");

    bool isSymptomInList = _isSymptomInCategory(perditeCategory, symptomId) ||
        _isSymptomInCategory(flowMensesCategory, symptomId);

    if (isSymptomInList) {
      perditeCategory?.symptoms
          .forEach((element) => symptomIds.remove(element.id));
      flowMensesCategory?.symptoms
          .forEach((element) => symptomIds.remove(element.id));
    }
  }

  void saveSymptoms() async {
    bool calendarConsent = appController.user.value!.calendarConsent ?? false;
    bool diaryConsent = appController.user.value!.diaryConsent ?? false;

    PiwikManager.trackEvent(
      PiwikEventType.profile,
      action: 'update daily status',
    );

    if (calendarConsent &&
        !diaryConsent &&
        appController.user.value!.hasMoreThan18Years) {
      diaryConsent = await showErrorDialog(
        context: Get.context!,
        builder: (_) => const DiaryConsentDialog(),
        dismissible: false,
      );

      if (diaryConsent) {
        _updateConsents(true, true);
      }
    } else {
      draggableScrollableController.reset();
      final dateString = dateFormatYMD.format(rxSelectedDate.value);
      if (savedCategoryHasChanged) {
        await CalendarService.setHomePageSymptomCategories(savedCategoryIds);
      }

      await CalendarService.saveSymptomsForSpecificDate(
        SymptomDiaries(
          date: dateString,
          symptomsIDs: symptomIds,
          hoursOfSleep: oreDiSonnoValue.value,
          waterLiters: quantitaAcquaValue.value,
          weight: pesoValue.value,
          notes: notesInitialValue.value,
        ),
      );

      await CalendarService.fetchCalendarData();

      await wait(milliseconds: 800);
      jumpToToday();
    }
  }

  void _initCalendarYearController() {
    Get.lazyPut<CalendarYearController>(
      () => CalendarYearController(
        minDate: DateTime(2020),
        maxDate: DateTime(2030),
      ),
    );
  }

  void onDayTapped(DateTime day) {
    PiwikManager.trackEvent(
      PiwikEventType.profile,
      action: 'select date',
    );

    rxSelectedDate.value = day;
    rxSelectedDate.refresh();
  }

  /// Jump to today in both month and year calendars
  void jumpToToday() {
    DateTime today = DateTime.now();
    rxSelectedDate.value = today;
    if (selectedTab.value == CalendarTabs.monthTab) {
      jumpToMonth(date: today);
    } else {
      calendarYearController.jumpToYear(today);
    }
  }

  /// Change to year or month calendar view
  void changeTab(CalendarTabs newTab) {
    selectedTab.value = newTab;
    if (newTab == CalendarTabs.yearTab) {
      pageViewController.jumpToPage(1);
    } else {
      pageViewController.jumpToPage(0);
    }
  }

  /// Method called when a month is tapped inside the year calendar
  void goBackToMonthCalendar(DateTime month) {
    rxSelectedDate.value = month;
    changeTab(CalendarTabs.monthTab);
  }

  Future<void> _onDayChanged(DateTime? day) async {
    if (day != null && selectedTab.value == CalendarTabs.monthTab) {
      await CalendarService.fetchSymptomsForSpecificDate(day);
      rxShowBottomMenu.value = true;
      expandBottomSheetTorxSheetVSize();
    } else {
      rxShowBottomMenu.value = false;
    }
  }

  void expandBottomSheetTorxSheetVSize() {
    try {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          if (draggableScrollableController.isAttached) {
            await draggableScrollableController.animateTo(
              rxSheetVSize.value,
              duration: const Duration(
                milliseconds: 200,
              ),
              curve: Curves.linear,
            );
            rxShowBottomMenu.value = true;
          }
        },
      );
    } catch (e) {
      logError(error: e);
    }
  }

  void collapseBottomSheet() {
    if (draggableScrollableController.isAttached) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await draggableScrollableController.animateTo(
            0.1,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.linear,
          );
          rxShowBottomMenu.value = false;
        },
      );
    }
  }

  void updateMensesDay(String formattedDate) {
    if (addedMensesDates.contains(formattedDate)) {
      addedMensesDates.remove(formattedDate);
      removeMensesDates.add(formattedDate);
    } else {
      addedMensesDates.add(formattedDate);
      newAddExtraDates(formattedDate);
    }
    addedMensesDates.refresh();
  }

  void newAddExtraDates(String dateString) {
    final int periodDays = appController.user.value?.periodDays ?? 5;
    final DateTime date = dateFormatYMD.parse(dateString);

    for (int i = 1; i < periodDays; i++) {
      final DateTime nextDate = date.add(Duration(days: i));
      bool isDateBeforeOrToday = nextDate.isSameDayOrBefore(DateTime.now());
      if (isDateBeforeOrToday) {
        final String formattedDate = dateFormatYMD.format(nextDate);

        if (!addedMensesDates.contains(formattedDate)) {
          addedMensesDates.add(formattedDate);
        }
      }
    }
  }

  Future<void> newSaveDates() async {
    await CalendarService.updateCalendarData(
      addedMensesDates,
      removeMensesDates,
    );
  }

  /// Generates a matrix of months for a given year, suitable for display in a calendar with 4 rows and 3 months per row.
  /// [year]: The year for which to generate the months data.
  /// Returns: A list of lists of [DateTime] objects, where each inner list represents a row of months for the calendar.
  List<List<DateTime>> getMonthsDataForYearCalendar(DateTime year) {
    List<DateTime> months = calendarYearController.getMonthsForYear(year);
    const int numberOfRows = 4;
    const int numberOfMonthsPerRow = 3;

    List<List<DateTime>> monthMatrix = List.generate(
      // Define the number of rows in the matrix
      numberOfRows,
      (i) {
        // Calculate the starting index for the current row
        int startIndex = i * numberOfMonthsPerRow;
        // Calculate the ending index for the current row, ensuring it stays within the bounds of the months list
        int endIndex =
            min(i * numberOfMonthsPerRow + numberOfMonthsPerRow, months.length);
        // Extract a sublist of months for the current row from the original months list
        return months.sublist(startIndex, endIndex);
      },
    );
    return monthMatrix;
  }

  Symptom getSymptomFromId(String id) {
    return symptomCategories
        .expand((category) => category.symptoms)
        .firstWhere((symptom) => symptom.id == id);
  }

  RxBool get textInputHasChanged {
    if (appController.symptomsDiaries.value == null) {
      return false.obs;
    }
    return (oreDiSonnoValue.value !=
                appController.symptomsDiaries.value?.hoursOfSleep ||
            quantitaAcquaValue.value !=
                appController.symptomsDiaries.value?.waterLiters ||
            pesoValue.value != appController.symptomsDiaries.value?.weight ||
            notesInitialValue.value !=
                appController.symptomsDiaries.value?.notes)
        .obs;
  }

  bool get isMensesDay {
    return appController.calendarData.value?.calendarDays
            .firstWhereOrNull((element) {
          return element.date == dateFormatYMD.format(rxSelectedDate.value);
        })?.isMensesDay ??
        false;
  }

  bool isCategorySavedInHome(
    SymptomCategory category,
    List<String> categoryIds,
  ) {
    return savedCategoryIds.contains(category.id);
  }

  Future<void> saveCategoryInHome(
    SymptomCategory category,
    List<String> categoryIds,
  ) async {
    if (isCategorySavedInHome(category, categoryIds)) {
      categoryIds.remove(category.id);
    } else {
      final initialList = List<String>.from(categoryIds);
      initialList.add(category.id);

      if (initialList.length > 3) {
        final filteredCategories =
            await _showTooMuchCategoriesDialog(initialList);
        categoryIds.clear();
        categoryIds.addAll(filteredCategories.map((e) => e.id).toList());
      } else {
        categoryIds.add(category.id);
      }
    }
  }

  Future<List<SymptomCategory>> _showTooMuchCategoriesDialog(
    List<String> savedCategoryIds,
  ) async {
    List<SymptomCategory> selectedCategories = await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => TooManyCategoriesDialog(
        onConfirmTap: (list) {
          savedCategoryIds.clear();
          savedCategoryIds.addAll(
            list.map(
              (e) => e.id,
            ),
          );
        },
        initialList: List.generate(
          savedCategoryIds.length,
          (index) {
            return getSymptomCategoryFromId(savedCategoryIds[index]);
          },
        ),
      ),
    );
    return selectedCategories;
  }

  /// Return the [SymptomCategory] from the list of categories based on the id.
  SymptomCategory getSymptomCategoryFromId(String id) {
    return symptomCategories.firstWhere((element) => element.id == id);
  }

  /// Returns true if the list of saved categories has changed after the last save
  bool get savedCategoryHasChanged {
    if (savedCategoryIds.length !=
        appController.categoriesSavedInHome.value?.length) {
      return true;
    } else {
      for (final categoryId in savedCategoryIds) {
        if (!appController.categoriesSavedInHome.value!
            .any((element) => element.id == categoryId)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Returns true if the feature "Symptoms in home" is active
  bool get isSymptomInHomeActive {
    return appController.settings.value?.symptomsInHomeActive ?? false;
  }
}
