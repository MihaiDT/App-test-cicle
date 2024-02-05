import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/models/calendar_day_view_model.dart';
import 'package:lines/modules/calendar/symptoms_categories_controller.dart';
import 'package:lines/repository/db_services/db_calendar_services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/utils/singletons.dart';
import '../../data/models/calendar_day_dto.dart';
import '../../data/models/symptom.dart';
import '../../repository/calendar_service.dart';
import 'calendar_scroll_controller.dart';
import 'calendar_store.dart';
import 'calendar_year_controller.dart';
import 'symptoms_controller.dart';

class CalendarController extends GetxController {
  late CalendarStore calendarStore;

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

  final RxBool _rxShowBarButton = true.obs;

  bool get showBarButton => _rxShowBarButton.value;

  set showBarButton(bool newValue) {
    _rxShowBarButton.value = newValue;
  }

  final RxBool _rxShowBottomMenu = true.obs;

  bool get showBottomMenu => _rxShowBottomMenu.value;

  set showBottomMenu(bool newValue) {
    _rxShowBottomMenu.value = newValue;
  }

  final RxBool _rxShowSaveButton = false.obs;

  bool get showSaveButton => _rxShowSaveButton.value;

  set showSaveButton(bool newValue) {
    _rxShowSaveButton.value = newValue;
  }

  final RxBool _rxShowSaveButtonSymptoms = false.obs;

  bool get showSaveButtonSymptoms => _rxShowSaveButtonSymptoms.value;

  set showSaveButtonSymptoms(bool newValue) {
    _rxShowSaveButtonSymptoms.value = newValue;
  }

  final RxBool _rxShowSaveButtonSymptomCategories = false.obs;

  bool get showSaveButtonSymptomCategories =>
      _rxShowSaveButtonSymptomCategories.value;

  set showSaveButtonSymptomCategories(bool newValue) {
    _rxShowSaveButtonSymptomCategories.value = newValue;
  }

  final RxBool _rxShowRecapMenuSizeCondition = false.obs;

  bool get _showRecapMenuSizeCondition => _rxShowRecapMenuSizeCondition.value;

  set _showRecapMenuSizeCondition(bool newValue) {
    _rxShowRecapMenuSizeCondition.value = newValue;
  }

  final RxDouble _rxSheetVSize = 0.5.obs;

  double get sheetVSize => _rxSheetVSize.value;

  set sheetVSize(double newSize) {
    _rxSheetVSize.value = newSize;
  }

  final Rx<CalendarTabs> rxSelectedTab = Rx(CalendarTabs.monthTab);

  CalendarTabs get selectedTab => rxSelectedTab.value;

  set selectedTab(CalendarTabs newTab) {
    rxSelectedTab.value = newTab;
  }

  final RxBool _rxModifyPeriodMode = false.obs;

  bool get modifyPeriodMode => _rxModifyPeriodMode.value;

  set modifyPeriodMode(bool newValue) {
    _rxModifyPeriodMode.value = newValue;
  }

  final GlobalKey bottomSheetTitleKey = GlobalKey();
  final GlobalKey bottomSheetContainerKey = GlobalKey();

  List<Symptom> oldList = [];

  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  bool get showRecapMenu =>
      symptomsController.getActiveSymptoms.isNotEmpty &&
      _showRecapMenuSizeCondition;

  bool get pageShouldRefresh {
    return appController.calendarDayViewModel.responseHandler.isSuccessful;
  }

  final RxMap<String, bool> _rxDatesToAdd = <String, bool>{}.obs;

  Map<String, bool> get datesToAdd => _rxDatesToAdd;

  final RxMap<String, bool> _rxDatesToRemove = <String, bool>{}.obs;

  RxMap<String, bool> get datesToRemove => _rxDatesToRemove;

  final Map<String, bool> _prevSavedDates = {};

  // final Map<String,bool> _prevDeletedDates = {};

  @override
  void onInit() {
    super.onInit();
    calendarStore = Get.put(CalendarStore());
    ever(calendarStore.rxSelectedDate, (newDayValue) {
      _onDayChanged(newDayValue);
    });
    ever(
      rxSelectedTab,
      (newTab) {
        if (newTab == CalendarTabs.yearTab) {
          _collapseBottomSheet();
          calendarYearController
              .jumpToYear(calendarStore.selectedDate ?? DateTime.now());
        } else {
          scrollableCalendarController.jumpToMonth(
              date: calendarStore.selectedDate ?? DateTime.now());
          showBottomMenu = true;
          _expandBottomSheetToSheetVSize();
        }
      },
    );

    _initScrollableCalendarController();
    _initCalendarYearController();
    _initSymptomController();
    _initSymptomCategoryController();
    //this two listeners will controll whether or not the save button will be shown
    ever(
      _rxShowSaveButtonSymptoms,
      (callback) {
        showSaveButton =
            showSaveButtonSymptoms || showSaveButtonSymptomCategories;
      },
    );

    ever(_rxShowSaveButtonSymptomCategories, (callback) {
      showSaveButton =
          showSaveButtonSymptoms || showSaveButtonSymptomCategories;
    });
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
      () => SymptomsController(
        onSymptomChanged: _onSymptomChanged,
      ),
    );
    oldList.addAll(symptomsController.getActiveSymptoms);
  }

  void _initSymptomCategoryController() {
    Get.lazyPut(
      () => SymptomCategoriesController(
        onSaveButtonValueChanged: (bool value) {
          showSaveButtonSymptomCategories = value;
        },
      ),
    );
  }

  //TODO: move symptom logic inside symptomsController and use callback
  void _onSymptomChanged() {
    showSaveButtonSymptoms = true;
    List<Symptom> symptoms = symptomsController.getActiveSymptoms;
    if (oldList.length == symptoms.length) {
      for (int i = 0; i < oldList.length; i++) {
        if (symptoms[i] != oldList[i]) {
          return;
        }
      }
      oldList.clear();
      oldList.addAll(symptoms);
      showSaveButtonSymptoms = false;
    }
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

  void _listenForBottomSheetSizeChanges() {
    draggableScrollableController.addListener(
      () {
        if (draggableScrollableController.size >= 0.9) {
          showBarButton = false;
        } else {
          showBarButton = true;
        }
        if (draggableScrollableController.size > 0.1) {
          showBottomMenu = true;
        } else {
          showBottomMenu = false;
          showSaveButton = false;
        }
        if (draggableScrollableController.size > 0.3) {
          _showRecapMenuSizeCondition = true;
        } else {
          _showRecapMenuSizeCondition = false;
        }
      },
    );
  }

  void jumpToToday() {
    DateTime today = DateTime.now();
    calendarStore.selectedDate = today;
    if (selectedTab == CalendarTabs.monthTab) {
      scrollableCalendarController.jumpToMonth(date: today);
    } else {
      calendarYearController.jumpToYear(today);
    }
  }

  void changeTab(CalendarTabs newTab) {
    selectedTab = newTab;
  }

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
    if (day != null && selectedTab == CalendarTabs.monthTab) {
      showBottomMenu = true;
      _expandBottomSheetToSheetVSize();
    }
  }

  void _expandBottomSheetToSheetVSize() {
    try {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (draggableScrollableController.isAttached) {
            draggableScrollableController.animateTo(
              sheetVSize,
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

  ///OnSaved callback when the save button is pressed
  ///if both showSaveButtonSymptoms and showSaveButtonSymptomCategories are active that mean we need to
  ///save date for both , otherwise only one has some changes that need to be saved
  void onSaved() {
    if (showSaveButtonSymptoms && showSaveButtonSymptomCategories) {
      _saveSymptoms();
      _saveCategories();
      return;
    }
    if (showSaveButtonSymptoms) {
      _saveSymptoms();
      return;
    }
    if (showSaveButtonSymptomCategories) {
      _saveCategories();
      return;
    }
  }

  ///Only save data for symptoms
  void _saveSymptoms() {
    symptomsController.onSelectedDateChanged();
    oldList = symptomsController.getActiveSymptoms;
    showSaveButtonSymptoms = false;

    symptomsController.updateSymptomsList(oldList);
    symptomsController.saveSymptomsInDB(oldList);
  }

  ///Only save data for categories
  void _saveCategories() {
    symptomCategoryController.onSaved();
    showSaveButtonSymptomCategories = false;
  }

  ///change the bottom sheet dimension based on its content + some bottom padding
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

    sheetVSize = (size.height + 20.0 + delta) / Get.height;
  }

  /// Initialize the list of dates to add based on the current state of the calendarDayViewModel.
  void _initDatesToAdd() {
    List<String> dates = [
      ...?appController.calendarDayViewModel.value?.symptomsDtoMap.keys
    ];
    // Initialize datesToAdd and _prevSavedDates with the retrieved dates.
    for (String date in dates) {
      datesToAdd[date] = true;
      _prevSavedDates[date] = true;
    }
  }

  /// Add a date to the list of dates to be added. If the date is already marked for removal, it is removed from that list.
  void addDate(String date) {
    datesToRemove.remove(date);
    // If the date is not already in the addition list, mark it to be added.
    if (!datesToAdd.containsKey(date)) {
      datesToAdd[date] = true;
    }
  }

  /// Remove a date from the list of dates to be added. If the date is not already in the removal list and was previously saved, mark it for removal.
  void removeDate(String date) {
    datesToAdd.remove(date);
    // If the date is not already in the removal list and was previously saved, mark it for removal.
    if (!datesToRemove.containsKey(date) && _prevSavedDates.containsKey(date)) {
      datesToRemove[date] = true;
    }
  }

  /// Save the changes made to the dates. It checks if datesToAdd or datesToRemove have changes, and if so, it calls the CalendarService to save the changes.
  void saveDates() async {
    bool twoMapsAreEquals = true;
    // Check if each key in datesToAdd is already present in _prevSavedDates.
    for (String key in datesToAdd.keys) {
      if (!_prevSavedDates.containsKey(key)) {
        twoMapsAreEquals = false;
        break;
      }
    }

    // If there are dates to remove, set the flag to false.
    if (datesToRemove.isNotEmpty) {
      twoMapsAreEquals = false;
    }

    // If there are changes in datesToAdd or datesToRemove, save the changes using CalendarService.
    if (!twoMapsAreEquals) {
      SaveDatesParameter saveDatesParameter = SaveDatesParameter(
        dates: datesToAdd.keys.toList(),
        deletedDates: datesToRemove.keys.toList(),
      );
      try {
        await CalendarService.saveDates(saveDatesParameter);
        await DBCalendarServices.retrieveSymptoms();
        CalendarDayViewModel.fromDBAndApi(
          dbCalendarDayDtoMap: appController.dbCalendarDayDtoMap.value,
          calendarDayDTOMap: appController.calendarDayDTOMap.value,
        );
        // Clear the lists and reinitialize the datesToAdd and _prevSavedDates.
        datesToRemove.clear();
        datesToAdd.clear();
        _prevSavedDates.clear();
        _initDatesToAdd();
      } catch (e) {
        logError(error: e);
      }
    }
  }

  CalendarDayDTO? getDTOForDay(String date) =>
      appController.calendarDayViewModel.value?.symptomsDtoMap[date];
}
