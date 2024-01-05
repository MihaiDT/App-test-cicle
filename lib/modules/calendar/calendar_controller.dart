import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/calendar_scroll_controller.dart';

class CalendarController extends GetxController {
  late CalendarScrollController scrollableCalendarController;

  DateTime? get selectedDate => scrollableCalendarController.selectedDate;

  set selectedDate(DateTime? newDate) {
    scrollableCalendarController.selectedDate = newDate;
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

  final RxDouble _rxSheetVSize = 0.5.obs;

  double get sheetVSize => _rxSheetVSize.value;

  set sheetVSize(double newSize) {
    _rxSheetVSize.value = newSize;
  }

  final GlobalKey bottomSheetTitleKey = GlobalKey();
  final GlobalKey bottomSheetContainerKey = GlobalKey();

  final DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initCleanCalendarController();
    _resizeBottomSheet();
    draggableScrollableController.addListener(() {
      if (draggableScrollableController.size >= 0.9) {
        showBarButton = false;
      } else {
        showBarButton = true;
      }
      if (draggableScrollableController.size > 0.1) {
        showBottomMenu = true;
      } else {
        showBottomMenu = false;
        scrollableCalendarController.selectedDate = null;
      }
    });
  }

  void jumpToToday() {
    DateTime today = DateTime.now();
    scrollableCalendarController.jumpToMonth(date: today);
    _onDayChanged(today);
  }

  //TODO : for now the calendar starts at 4 months before today and ends in 4 months , later it will be dynamic according to API
  void _initCleanCalendarController() {
    scrollableCalendarController = Get.put(CalendarScrollController(
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
        onDayChanged: _onDayChanged));
  }

  void _onDayChanged(DateTime day) {
    showBottomMenu = true;
    selectedDate = day;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      draggableScrollableController.animateTo(
        sheetVSize,
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.linear,
      );
    });
  }

  ///change the bottom sheet dimension based on its content + some bottom padding
  void _resizeBottomSheet() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    });
  }
}
