import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lines/core/helpers/log.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/symptoms_categories_controller.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


import '../../data/models/symptom.dart';
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

  @override
  void onInit() {
    super.onInit();
    calendarStore = Get.put(CalendarStore());

    _initScrollableCalendarController();
    _initCalendarYearController();
    _initSymptomController();
    _initSymptomCategoryController();

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
  void onReady() {
    super.onReady();
    _resizeBottomSheet();
    _listenForBottomSheetSizeChanges();
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

  @override
  void onClose() {
    super.onClose();
    symptomsController.dispose();
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
      debugPrint('errore qua');
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

  Future<void> executeAfterBuild(String title) async {
    await Future.delayed(Duration.zero);
    debugPrint(title);
    // this code will get executed after the build method
    // because of the way async functions are scheduled
  }
}
