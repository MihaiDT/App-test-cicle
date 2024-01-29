import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:lines/modules/calendar/calendar_store.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarYearController extends GetxController {
  /// The minimum date to show
  final DateTime minDate;

  /// The maximum date to show
  final DateTime maxDate;

  final ItemScrollController itemScrollController;

  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ScrollController scrollController = ScrollController();
  CalendarStore calendarStore = Get.put(CalendarStore());

  Rxn<DateTime> topElem = Rxn<DateTime>();

  CalendarYearController({
    required this.minDate,
    required this.maxDate,
    required this.itemScrollController,
  });

  final List<DateTime> years = [];

  final GlobalKey listKey = GlobalKey();
  final GlobalKey headerKey = GlobalKey();
  final LinkedHashMap<int, GlobalKey> keys = LinkedHashMap(
    equals: (p0, p1) => p0 == p1,
  );

  final GlobalKey yearContainerKey = GlobalKey();
  late Size? yearContainerSize;

  int topElementIndex = 0;

  @override
  void onInit() {
    super.onInit();
    _generateYears();
    DateTime today = DateTime.now();
    topElem.value = today;
    topElementIndex = _indexOfYear(today);
  }

  int _indexOfYear(DateTime date) {
    for (int i = 0; i < years.length; i++) {
      if (years[i].year == date.year) {
        return i;
      }
    }
    return -1;
  }

  DateTime? prevDate;

  @override
  void onReady() {
    super.onReady();
    yearContainerSize = yearContainerKey.currentContext?.size;
    jumpToYear(calendarStore.selectedDate ?? DateTime.now());
    prevDate = calendarStore.selectedDate;
    scrollController.addListener(() {
      _scrollListener();
    });
  }

  ///this function will trigger every time the page is scrolled, it will check what's the closest year header to the
  ///top head and changed its value when it will overlap
  void _scrollListener() {
    RenderBox? headerBox =
        headerKey.currentContext?.findRenderObject() as RenderBox?;
    //vertical position of the top header container inside the view
    double headerPosition = headerBox?.localToGlobal(Offset.zero).dy ?? 0;

    Map<int, GlobalKey> currentRenderedKeys = _getCurrentRenderedHeadersKeys;

    //get the closest header key index to the top header
    int closestKeyIndex = _getClosestKey(currentRenderedKeys);

    //end of list reached , get the previous year
    if (closestKeyIndex == -1) {
      closestKeyIndex = years.length - 1;
    }
    if (currentRenderedKeys[closestKeyIndex] != null) {
      //get the closest key
      GlobalKey targetKey = currentRenderedKeys[closestKeyIndex]!;
      //vertical position of the target header
      RenderBox? headerBox =
          targetKey.currentContext?.findRenderObject() as RenderBox?;
      double targetHeaderPosition =
          headerBox?.localToGlobal(Offset.zero).dy ?? 0;

      //vertical distance between targetted header(closest to top header)
      double delta = targetHeaderPosition - headerPosition;
      _handleOverLap(delta, closestKeyIndex);
    }
  }

  ///change the value of the top header , if the distance is less or equals to 0 that means the the container overlaps
  ///otherwise get the value of the previous year inside the list
  void _handleOverLap(double distance, int closestKeyIndex) {
    if (distance <= 0) {
      topElem.value = years[closestKeyIndex];
      prevDate = topElem.value;
    } else {
      //reached the top , get the first year
      if (closestKeyIndex - 1 < 0) {
        topElem.value = years[0];
      } else {
        topElem.value = years[closestKeyIndex - 1];
      }
    }
  }

  ///returns a map of globalkeys where each key correspond to a header container that is currently rendered inside the listview
  Map<int, GlobalKey> get _getCurrentRenderedHeadersKeys {
    Map<int, GlobalKey> currentRenderKeys = {};
    for (MapEntry<int, GlobalKey<State<StatefulWidget>>> entry
        in keys.entries) {
      GlobalKey<State<StatefulWidget>> key = entry.value;
      if (_isListItemRendered(key)) {
        currentRenderKeys[entry.key] = entry.value;
      }
    }
    return currentRenderKeys;
  }

  ///returns the index of the closest header of the list to top header
  int _getClosestKey(Map<int, GlobalKey> map) {
    int closestKey = -1;
    double x = double.maxFinite;

    for (MapEntry<int, GlobalKey<State<StatefulWidget>>> entry in map.entries) {
      RenderBox? headerBox =
          headerKey.currentContext?.findRenderObject() as RenderBox?;
      double headerPosition = headerBox?.localToGlobal(Offset.zero).dy ?? 0;

      GlobalKey currentKey = entry.value;
      RenderBox? targetHeaderBox = currentKey.currentContext?.findRenderObject() as RenderBox?;
      double targetHeaderPosition = targetHeaderBox?.localToGlobal(Offset.zero).dy ?? 0;

      double delta = targetHeaderPosition - headerPosition;
      if (delta > 0) {
        if (delta < x) {
          closestKey = entry.key;
          x = delta;
        }
      }
    }
    return closestKey;
  }

  ///return true if the container(based on its global key) is rendered,
  ///else false
  bool _isListItemRendered(GlobalKey<State<StatefulWidget>> key) {
    return key.currentContext != null &&
        key.currentContext!.findRenderObject() != null;
  }

  void _generateYears() {
    DateTime currentYear = DateTime(minDate.year);
    years.add(currentYear);
    while (currentYear.year != maxDate.year) {
      currentYear = DateTime(currentYear.year + 1);
      years.add(currentYear);
    }
  }

  Widget buildItem(BuildContext context, int index, Widget child) {
    final key = keys.putIfAbsent(index, () => GlobalKey());

    return KeyedSubtree(key: key, child: child);
  }

  List<DateTime> getMonthsForYear(DateTime year) {
    List<DateTime> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(DateTime(year.year, i));
    }
    return months;
  }

  void jumpToYear(DateTime date) async {
    int index = 0;
    //get the index of the year inside years list
    for (int i = 0; i < years.length; i++) {
      if (years[i].year == date.year) {
        index = i;
        break;
      }
    }
    if (yearContainerSize != null) {
      //first jump at the top of the list
      scrollController.jumpTo(0);
      //then scroll to the year inside the list given the container height and index of that year
      scrollController.jumpTo(yearContainerSize!.height * index);
      //this block of code will take care of the wrong position when we first scrolled to the year
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        RenderBox? headerBox =
            headerKey.currentContext?.findRenderObject() as RenderBox?;
        double headerPosition = headerBox?.localToGlobal(Offset.zero).dy ?? 0;
        RenderBox? listBox =
            keys[index]?.currentContext?.findRenderObject() as RenderBox?;
        double listPosition = listBox?.localToGlobal(Offset.zero).dy ?? 0;
        double delta = listPosition - headerPosition;
        scrollController.jumpTo(scrollController.offset + delta);
        await wait(milliseconds: 500);
        listPosition = listBox?.localToGlobal(Offset.zero).dy ?? 0;
        delta = listPosition - headerPosition;
        scrollController.jumpTo(
          scrollController.offset + delta + 1,
        );
      });
    }
  }
}
