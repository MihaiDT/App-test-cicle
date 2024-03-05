import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/models/calendar_day_view_model.dart';
import 'package:lines/modules/calendar/symptoms_categories_controller.dart';
import 'package:lines/repository/db_services/db_calendar_services.dart';
import 'package:lines/routes/routes.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/calendar_day_dto.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/modules/calendar/calendar_scroll_controller.dart';
import 'package:lines/modules/calendar/calendar_store.dart';
import 'package:lines/modules/calendar/calendar_year_controller.dart';
import 'package:lines/modules/calendar/symptoms_controller.dart';

class CalendarController extends GetxController {
  late CalendarStore calendarStore;

  /// DraggableScrollableController for calendarBottomSheet
  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  /// Whether or not the bar on top of the bottom sheet must stay hidden
  final RxBool showBarButton = true.obs;

  /// Whether or not the bottom sheet must stay hidden
  final RxBool showBottomMenu = true.obs;

  /// Whether or not the save button must stay hidden ,the results depends on the value of _showSaveButtonSymptoms and _showSaveButtonSymptomCategories
  final RxBool showSaveButton = false.obs;

  /// Show the save button because some symptoms have been selected/deselected
  bool _showSaveButtonSymptoms = false;

  /// Show the save button because some categories have been added/removed from home
  bool _showSaveButtonSymptomCategories = false;

  /// Size of the bottom sheet
  final RxDouble sheetVSize = 0.5.obs;

  /// Currently selected tab , by default the monthly calendar is shown
  final Rx<CalendarTabs> selectedTab = Rx(CalendarTabs.monthTab);

  /// The mode for the calendar grid
  final RxBool modifyPeriodMode = false.obs;

  final GlobalKey bottomSheetTitleKey = GlobalKey();
  final GlobalKey bottomSheetContainerKey = GlobalKey();

  /// New list of dates marked as period to be added
  final RxMap<String, bool> periodDatesToAdd = <String, bool>{}.obs;

  /// New list of dates marked as period to be removed
  final RxMap<String, bool> periodDatesToRemove = <String, bool>{}.obs;

  /// Old list of dates marked as period , this will be compared with periodDatesToAdd and periodDatesToRemove to avoid useless api calls
  final Map<String, bool> _prevSavedDatesToHome = {};

  /// Show/hide symptoms recap menu depending on the size of the bottom sheet or if the list of selected symptoms for a particular day is empty
  final RxBool _showRecapMenuSizeCondition = false.obs;

  bool get showRecapMenu =>
      symptomsController.selectedSymptoms.isNotEmpty &&
      _showRecapMenuSizeCondition.value;

  bool get pageShouldRefresh {
    return appController.calendarDayViewModel.responseHandler.isSuccessful;
  }

  CalendarScrollController get scrollableCalendarController {
    return Get.find<CalendarScrollController>();
  }

  CalendarYearController get calendarYearController {
    return Get.find<CalendarYearController>();
  }

  SymptomsController get symptomsController {
    return Get.find<SymptomsController>();
  }

  SymptomCategoriesController get symptomCategoryController {
    return Get.find<SymptomCategoriesController>();
  }

  @override
  void onInit() {
    super.onInit();
    calendarStore = Get.put(CalendarStore());
    ever(
      calendarStore.rxSelectedDate,
      condition: () => Get.currentRoute == Routes.calendar,
      (newDayValue) {
        _showSaveButtonSymptoms = false;
        _showSaveButtonSymptomCategories = false;
        _onDayChanged(newDayValue);
      },
    );
    ever(
      selectedTab,
      condition: () => Get.currentRoute == Routes.calendar,
      (newTab) {
        if (newTab == CalendarTabs.yearTab) {
          _collapseBottomSheet();
          calendarYearController
              .jumpToYear(calendarStore.selectedDate ?? DateTime.now());
        } else {
          scrollableCalendarController.jumpToMonth(
            date: calendarStore.selectedDate ?? DateTime.now(),
          );
          showBottomMenu.value = true;
          _expandBottomSheetToSheetVSize();
        }
      },
    );
    _initScrollableCalendarController();
    _initCalendarYearController();
    _initSymptomController();
    _initSymptomCategoryController();
  }

  @override
  void onReady() async {
    super.onReady();
    _resizeBottomSheet();
    _listenForBottomSheetSizeChanges();
    await CalendarService.fetchPeriods();
    await DBCalendarServices.retrieveSymptoms();
    CalendarDayViewModel.fromDBAndApi(
      dbCalendarDayDtoMap: appController.dbCalendarDayDtoMap.value,
      calendarDayDTOMap: appController.calendarDayDTOMap.value,
    );
    _initDatesToAdd();
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

  void _initSymptomController() {
    Get.lazyPut(
      () => SymptomsController(onSaveButtonValueChanged: _symptomsValueChanged),
    );
  }

  void _initSymptomCategoryController() {
    Get.lazyPut(
      () => SymptomCategoriesController(
        onSaveButtonValueChanged: _categoriesValueChanged,
      ),
    );
  }

  /// Update save button visibility because some symptoms have been selected/removed
  void _symptomsValueChanged(bool newValue) {
    _showSaveButtonSymptoms = newValue;
    showSaveButton.value =
        _showSaveButtonSymptoms || _showSaveButtonSymptomCategories;
  }

  /// Update save button visibility because some categories have been added/removed from home
  void _categoriesValueChanged(bool newValue) {
    _showSaveButtonSymptomCategories = newValue;
    showSaveButton.value =
        _showSaveButtonSymptoms || _showSaveButtonSymptomCategories;
  }

  void _listenForBottomSheetSizeChanges() {
    draggableScrollableController.addListener(
      () {
        if (draggableScrollableController.size >= 0.9) {
          showBarButton.value = false;
        } else {
          showBarButton.value = true;
        }
        if (draggableScrollableController.size > 0.1) {
          showBottomMenu.value = true;
        } else {
          showBottomMenu.value = false;
          showSaveButton.value = false;
        }
        if (draggableScrollableController.size > 0.3) {
          _showRecapMenuSizeCondition.value = true;
        } else {
          _showRecapMenuSizeCondition.value = false;
        }
      },
    );
  }

  /// Jump to today in both month and year calendars
  void jumpToToday() {
    DateTime today = DateTime.now();
    calendarStore.selectedDate = today;
    if (selectedTab.value == CalendarTabs.monthTab) {
      scrollableCalendarController.jumpToMonth(date: today);
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
    calendarStore.selectedDate = month;
    changeTab(CalendarTabs.monthTab);
  }

  //TODO : for now the calendar starts at 4 months before today and ends in 4 months , later it will be dynamic according to API
  void _initScrollableCalendarController() {
    Get.lazyPut<CalendarScrollController>(
      () => CalendarScrollController(
        itemScrollController: ItemScrollController(),
        minDate: DateTime.now().subtract(
          const Duration(
            days: 120,
          ),
        ),
        maxDate: DateTime.now().add(
          const Duration(
            days: 120,
          ),
        ),
      ),
    );
  }

  void _onDayChanged(DateTime? day) {
    if (day != null && selectedTab.value == CalendarTabs.monthTab) {
      showBottomMenu.value = true;
      _expandBottomSheetToSheetVSize();
    } else {
      showBottomMenu.value = false;
    }
  }

  void _expandBottomSheetToSheetVSize() {
    try {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (draggableScrollableController.isAttached) {
            draggableScrollableController.animateTo(
              sheetVSize.value,
              duration: const Duration(
                milliseconds: 200,
              ),
              curve: Curves.linear,
            );
          }
        },
      );
    } catch (e) {
      logError(error: e);
    }
  }

  void _collapseBottomSheet() {
    if (draggableScrollableController.isAttached) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          draggableScrollableController.animateTo(
            0.1,
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.linear,
          );
        },
      );
    }
  }

  /// OnSaved callback when the save button is pressed
  /// if both showSaveButtonSymptoms and showSaveButtonSymptomCategories are active that mean we need to
  /// save date for both , otherwise only one has some changes that need to be saved
  void onSaved() {
    if (_showSaveButtonSymptoms && _showSaveButtonSymptomCategories) {
      _saveSymptoms();
      _saveCategories();
      return;
    }
    if (_showSaveButtonSymptoms) {
      _saveSymptoms();
      return;
    }
    if (_showSaveButtonSymptomCategories) {
      _saveCategories();
      return;
    }
  }

  /// Only save data for symptoms
  void _saveSymptoms() {
    symptomsController.saveSymptoms();
    _showSaveButtonSymptoms = false;
  }

  /// Only save data for categories
  void _saveCategories() {
    symptomCategoryController.onSaved();
    _showSaveButtonSymptomCategories = false;
  }

  /// Change the bottom sheet dimension based on its content + some bottom padding
  void _resizeBottomSheet() {
    RenderBox? titleRenderBox =
        bottomSheetTitleKey.currentContext?.findRenderObject() as RenderBox?;
    RenderBox? containerRenderBox = bottomSheetContainerKey.currentContext
        ?.findRenderObject() as RenderBox?;

    //position of the bottom sheet's title inside the page
    final Offset textPosition = titleRenderBox!.localToGlobal(Offset.zero);
    //size of the bottom sheet's title
    final Size size = titleRenderBox.size;
    //position of the container that wraps the bottom sheet inside the page
    final Offset containerPosition =
        containerRenderBox!.localToGlobal(Offset.zero);

    //vertical distance between the title and the top portion of the bottom sheet container
    final double delta = textPosition.dy - containerPosition.dy;

    sheetVSize.value = (size.height + 20.0 + delta) / Get.height;
  }

  /// Initialize the list of dates to add based on the current state of the calendarDayViewModel.
  void _initDatesToAdd() {
    List<String> dates = [
      ...?appController.calendarDayViewModel.value?.symptomsDtoMap.keys,
    ];
    // Initialize datesToAdd and _prevSavedDates with the retrieved dates.
    for (String date in dates) {
      periodDatesToAdd[date] = true;
      _prevSavedDatesToHome[date] = true;
    }
  }

  /// Add a date to the list of dates to be added. If the date is already marked for removal, it is removed from that list.
  void addDate(String date) {
    periodDatesToRemove.remove(date);
    // If the date is not already in the addition list, mark it to be added.
    if (!periodDatesToAdd.containsKey(date)) {
      periodDatesToAdd[date] = true;
    }
  }

  /// Remove a date from the list of dates to be added. If the date is not already in the removal list and was previously saved, mark it for removal.
  void removeDate(String date) {
    periodDatesToAdd.remove(date);
    // If the date is not already in the removal list and was previously saved, mark it for removal.
    if (!periodDatesToRemove.containsKey(date) &&
        _prevSavedDatesToHome.containsKey(date)) {
      periodDatesToRemove[date] = true;
    }
  }

  /// Save the changes made to the dates. It checks if datesToAdd or datesToRemove have changes, and if so, it calls the CalendarService to save the changes.
  void saveDates() async {
    bool twoMapsAreEquals = true;
    // Check if each key in datesToAdd is already present in _prevSavedDates.
    for (String key in periodDatesToAdd.keys) {
      if (!_prevSavedDatesToHome.containsKey(key)) {
        twoMapsAreEquals = false;
        break;
      }
    }

    // If there are dates to remove, set the flag to false.
    if (periodDatesToRemove.isNotEmpty) {
      twoMapsAreEquals = false;
    }

    // If there are changes in datesToAdd or datesToRemove, save the changes using CalendarService.
    if (!twoMapsAreEquals) {
      SaveDatesParameter saveDatesParameter = SaveDatesParameter(
        dates: periodDatesToAdd.keys.toList(),
        deletedDates: periodDatesToRemove.keys.toList(),
      );
      try {
        await CalendarService.saveDates(saveDatesParameter);
        await DBCalendarServices.retrieveSymptoms();
        CalendarDayViewModel.fromDBAndApi(
          dbCalendarDayDtoMap: appController.dbCalendarDayDtoMap.value,
          calendarDayDTOMap: appController.calendarDayDTOMap.value,
        );
        // Clear the lists and reinitialize the datesToAdd and _prevSavedDates.
        periodDatesToRemove.clear();
        periodDatesToAdd.clear();
        _prevSavedDatesToHome.clear();
        _initDatesToAdd();
      } catch (e) {
        logError(error: e);
      }
    }
  }

  CalendarDayDTO? getDTOForDay(String date) =>
      appController.calendarDayViewModel.value?.symptomsDtoMap[date];

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
