// ignore_for_file: invalid_use_of_protected_member, avoid_single_cascade_in_expression_statements

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/isar/symptom_calendar.dart';
import 'package:lines/data/models/new_symptom.dart';
import 'package:lines/data/models/new_symptom_category.dart';
import 'package:lines/data/models/period_status.dart';
import 'package:lines/data/models/symptom_diaries.dart';
import 'package:lines/modules/calendar/calendar_year_controller.dart';
import 'package:lines/modules/calendar/month_calendar_mixin.dart';
import 'package:lines/modules/calendar/symptom_mixin.dart';
import 'package:lines/modules/calendar/widgets/too_much_categories_dialog.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/db_services/db_calendar_services.dart';
import 'package:lines/routes/routes.dart';

class CalendarController extends GetxController
    with MonthCalendarMixin, SymptomsMixin {
  /// Current date selected by the user.
  final Rx<DateTime> rxSelectedDate = Rx(DateTime.now());

  RxList<String> symptomIds = <String>[].obs;
  RxList<String> savedCategoryIds = <String>[].obs;

  /// DraggableScrollableController for calendarBottomSheet
  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  bool get newShowSaveButtonSymptoms {
    return pageShouldRefresh &&
        selectedTab.value == CalendarTabs.monthTab &&
        symptomIds.isNotEmpty &&
        (symptomsHasChanged.value ||
            textInputHasChanged.value ||
            savedCategoryHasChanged);
  }

  RxBool get symptomsHasChanged {
    final symptomsIDsSet = symptomIds.toSet();
    final symptomsIDsSetFromDiaries =
        appController.symptomsDiaries.value?.symptomsIDs?.toSet();
    if (symptomsIDsSet.isEmpty || symptomsIDsSetFromDiaries?.isEmpty == true) {
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
  final RxDouble rxSheetVSize = 0.21.obs;

  /// Currently selected tab , by default the monthly calendar is shown
  final Rx<CalendarTabs> selectedTab = Rx(CalendarTabs.monthTab);

  /// The mode for the calendar grid
  final RxBool modifyPeriodMode = false.obs;

  /// New list of dates marked as period to be added
  final RxMap<String, bool> rxPeriodDatesToAdd = <String, bool>{}.obs;

  /// New list of dates marked as period to be removed
  final RxMap<String, bool> rxPeriodDatesToRemove = <String, bool>{}.obs;

  /// Old list of dates marked as period , this will be compared with rxPeriodDatesToAdd and rxPeriodDatesToRemove to avoid useless api calls
  final Map<String, bool> _prevSavedDatesToHome = {};

  List<NewSymptomCategory> get symptomCategories =>
      appController.symptomCategory.value ?? [];

  RxBool get showRecapMenu => symptomIds.isNotEmpty.obs;

  bool get pageShouldRefresh =>
      appController.periodStatusCalendar.responseHandler.isSuccessful &&
      appController.symptomsCalendar.responseHandler.isSuccessful &&
      appController.symptomCategory.responseHandler.isSuccessful;

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

  @override
  void onInit() {
    super.onInit();

    initMonthCalendar();

    ever(
      rxSelectedDate,
      condition: () => Get.currentRoute == Routes.calendar,
      (newDayValue) {
        _onDayChanged(newDayValue);

        // Symptoms
        fillSavedSymptoms(dateFormatYMD.format(newDayValue));
      },
    );

    ever(
      selectedTab,
      condition: () => Get.currentRoute == Routes.calendar,
      (newTab) {
        if (newTab == CalendarTabs.yearTab) {
          collapseBottomSheet();
        } else {
          jumpToMonth(date: rxSelectedDate.value);
          rxShowBottomMenu.value = true;
          expandBottomSheetTorxSheetVSize();
        }
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

    _initCalendarYearController();
  }

  @override
  void onReady() async {
    super.onReady();
    draggableScrollableController.addListener(() {
      draggableScrollableController.size == bottomSheetMaxHeight
          ? showTopButton.value = false
          : showTopButton.value = true;
    });
    await CalendarService.symptomCategories;
    await CalendarService.fetchSymptomsForSpecificDate(rxSelectedDate.value);
    await CalendarService.homePageSymptomCategories;

    await fetchPeriodAndSymptoms();

    _initDatesToAdd();
    _initSavedCategory();
    jumpToMonth(date: DateTime.now());
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
        appController.categoriesSavedInHome.value?.map((e) => e.id) ?? []);
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
  bool _isSymptomInCategory(NewSymptomCategory? category, String symptomId) {
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

    draggableScrollableController.reset();
  }

  Future<void> fetchPeriodAndSymptoms() async {
    // Fetch period data calling the API
    appController.periodStatusCalendar.responseHandler =
        ResponseHandler.pending();
    appController.periodStatusCalendar.responseHandler =
        ResponseHandler.successful(
      content: RxMap<String, PeriodStatus>.from(
        await CalendarService.fetchPeriods(),
      ),
    );

    // Fetch data stored on device
    appController.symptomsCalendar.responseHandler = ResponseHandler.pending();
    appController.symptomsCalendar.responseHandler = ResponseHandler.successful(
      content: RxMap<String, SymptomCalendar>.from(
        DBCalendarServices.fetchSymptoms(),
      ),
    );

    rxSelectedDate.refresh();
  }

  void _initCalendarYearController() {
    Get.lazyPut<CalendarYearController>(
      () => CalendarYearController(
        minDate: DateTime(2020),
        maxDate: DateTime(2030),
      ),
    );
  }

  /// MonthCalendarMixin
  @override
  void onDayTapped(DateTime day) => rxSelectedDate.value = day;

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

  /// Initialize the list of dates to add based on the current state of the calendarDayViewModel.
  void _initDatesToAdd() {
    rxPeriodDatesToRemove.clear();
    rxPeriodDatesToAdd.clear();
    _prevSavedDatesToHome.clear();

    List<String> dates = [...?appController.periodStatusCalendar.value?.keys];
    // Initialize datesToAdd and _prevSavedDates with the retrieved dates.
    for (String date in dates) {
      if (appController.periodStatusCalendar.value?[date]?.isReal ?? false) {
        rxPeriodDatesToAdd[date] = true;
        _prevSavedDatesToHome[date] = true;
      }
    }
  }

  List<String> _extraDatesToAdd(String dateString) {
    final List<String> result = [];
    String nextDate = dateString;
    for (int i = 0; i < (appController.user.value?.periodDays ?? 5); i++) {
      nextDate = dateFormatYMD.format(
        dateFormatYMD.parse(nextDate).subtract(
              const Duration(days: 1),
            ),
      );

      if (rxPeriodDatesToAdd.containsKey(nextDate)) {
        return [];
      }
    }

    nextDate = dateString;
    for (int i = 1; i < (appController.user.value?.periodDays ?? 5); i++) {
      nextDate = dateFormatYMD.format(
        dateFormatYMD.parse(nextDate).add(
              const Duration(days: 1),
            ),
      );

      if (rxPeriodDatesToAdd.containsKey(nextDate)) {
        return [];
      }
      result.add(nextDate);
    }

    return result;
  }

  /// Add a date to the list of dates to be added. If the date is already marked for removal, it is removed from that list.
  void addDate(String dateString) {
    final extraDatesToAdd = _extraDatesToAdd(dateString);

    for (String extraDate in extraDatesToAdd) {
      rxPeriodDatesToRemove.remove(extraDate);
      rxPeriodDatesToAdd[extraDate] = true;
    }

    removeDate(dateString);
    rxPeriodDatesToAdd[dateString] = true;

    rxPeriodDatesToRemove.refresh();
    rxPeriodDatesToAdd.refresh();
  }

  /// Remove a date from the list of dates to be added. If the date is not already in the removal list and was previously saved, mark it for removal.
  void removeDate(String dateString) {
    rxPeriodDatesToAdd.remove(dateString);
    // If the date is not already in the removal list and was previously saved, mark it for removal.
    if (!rxPeriodDatesToRemove.containsKey(dateString) &&
        _prevSavedDatesToHome.containsKey(dateString)) {
      rxPeriodDatesToRemove[dateString] = true;
    }
  }

  /// Save the changes made to the dates. It checks if datesToAdd or datesToRemove have changes, and if so, it calls the CalendarService to save the changes.
  Future<void> saveDates() async {
    bool twoMapsAreEquals = true;
    // Check if each key in datesToAdd is already present in _prevSavedDates.
    for (String key in rxPeriodDatesToAdd.keys) {
      if (!_prevSavedDatesToHome.containsKey(key)) {
        twoMapsAreEquals = false;
        break;
      }
    }

    // If there are dates to remove, set the flag to false.
    if (rxPeriodDatesToRemove.isNotEmpty) {
      twoMapsAreEquals = false;
    }

    // If there are changes in datesToAdd or datesToRemove, save the changes using CalendarService.
    if (!twoMapsAreEquals) {
      SaveDatesParameter saveDatesParameter = SaveDatesParameter(
        dates: rxPeriodDatesToAdd.keys.toList(),
        deletedDates: rxPeriodDatesToRemove.keys.toList(),
      );

      try {
        await CalendarService.saveDates(saveDatesParameter);
        await fetchPeriodAndSymptoms();

        // Clear the lists and reinitialize the datesToAdd and _prevSavedDates.
        _initDatesToAdd();
      } catch (e) {
        logError(error: e);
      }
    }
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

  NewSymptom getSymptomFromId(String id) {
    return symptomCategories
        .expand((category) => category.symptoms)
        .firstWhere((symptom) => symptom.id == id);
  }

  RxBool get textInputHasChanged {
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
    NewSymptomCategory category,
    List<String> categoryIds,
  ) {
    return savedCategoryIds.contains(category.id);
  }

  void saveCategoryInHome(
    NewSymptomCategory category,
    List<String> categoryIds,
  ) {
    if (isCategorySavedInHome(category, categoryIds)) {
      categoryIds.remove(category.id);
    } else {
      if (categoryIds.length >= 3) {
        _showTooMuchCategoriesDialog({});
      }
      categoryIds.add(category.id);
    }
  }

  void _showTooMuchCategoriesDialog(Map<int, dynamic> filteredMap) {
    showDialog(
      //disable outside tap
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => TooMuchCategoriesDialog(
        onConfirmTap: (list) {
          savedCategoryIds.clear();
          savedCategoryIds.addAll(list.map((e) => e.id));
          savedCategoryIds.refresh();
        },
        onCancelTap: () {},
        initialList: List.generate(
          savedCategoryIds.length,
          (index) {
            return getSymptomCategoryFromId(savedCategoryIds[index]);
          },
        ),
      ),
    );
  }

  /// Return the [NewSymptomCategory] from the list of categories based on the id.
  NewSymptomCategory getSymptomCategoryFromId(String id) {
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
}
