// ignore_for_file: invalid_use_of_protected_member, avoid_single_cascade_in_expression_statements

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/isar/symptom_calendar.dart';
import 'package:lines/data/models/period_status.dart';
import 'package:lines/modules/calendar/calendar_year_controller.dart';
import 'package:lines/modules/calendar/month_calendar_mixin.dart';
import 'package:lines/modules/calendar/symptom_mixin.dart';
import 'package:lines/modules/calendar/symptoms_categories_controller.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/db_services/db_calendar_services.dart';
import 'package:lines/routes/routes.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarController extends GetxController
    with MonthCalendarMixin, SymptomsMixin {
  /// Current date selected by the user.
  final Rx<DateTime> rxSelectedDate = Rx(DateTime.now());

  /// DraggableScrollableController for calendarBottomSheet
  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  /// Whether or not the bottom sheet must stay hidden
  final RxBool rxShowBottomMenu = true.obs;

  /// Show save button on top of the bottom sheet
  RxBool showSaveButton = true.obs;

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

  bool get showRecapMenu =>
      rxSavedSymptoms.value.isNotEmpty && rxCurrentSymptoms.value.isNotEmpty;

  bool get pageShouldRefresh =>
      appController.periodStatusCalendar.responseHandler.isSuccessful &&
      appController.symptomsCalendar.responseHandler.isSuccessful;

  CalendarYearController get calendarYearController {
    return Get.find<CalendarYearController>();
  }

  SymptomCategoriesController get symptomCategoryController {
    return Get.find<SymptomCategoriesController>();
  }

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
          calendarYearController.jumpToYear(rxSelectedDate.value);
        } else {
          jumpToMonth(date: rxSelectedDate.value);
          rxShowBottomMenu.value = true;
          expandBottomSheetTorxSheetVSize();
        }
      },
    );

    _initCalendarYearController();
    _initSymptomCategoryController();
  }

  @override
  void onReady() async {
    super.onReady();
    draggableScrollableController.addListener(() {
      draggableScrollableController.size == bottomSheetMaxHeight
          ? showSaveButton.value = false
          : showSaveButton.value = true;
    });
    await fetchPeriodAndSymptoms();

    _initDatesToAdd();

    jumpToMonth(date: DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    draggableScrollableController.dispose();
  }

  void saveSymptoms() async {
    final dateString = dateFormatYMD.format(rxSelectedDate.value);
    SymptomCalendar.save(
      date: dateString,
      symptoms: rxCurrentSymptoms.value,
    );

    draggableScrollableController.reset();
    await fetchPeriodAndSymptoms();
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
        itemScrollController: ItemScrollController(),
        minDate: DateTime(2020),
        maxDate: DateTime(2030),
      ),
    );
  }

  void _initSymptomCategoryController() {
    Get.lazyPut(
      () => SymptomCategoriesController(
        onSaveButtonValueChanged: _categoriesValueChanged,
      ),
    );
  }

  /// MonthCalendarMixin
  @override
  void onDayTapped(DateTime day) => rxSelectedDate.value = day;

  /// Update save button visibility because some categories have been added/removed from home
  void _categoriesValueChanged(bool newValue) {}

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

  void _onDayChanged(DateTime? day) {
    if (day != null && selectedTab.value == CalendarTabs.monthTab) {
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
}
