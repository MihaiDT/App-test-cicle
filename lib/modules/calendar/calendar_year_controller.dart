import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/helpers/log.dart';

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

  Rxn<DateTime> topElem = Rxn<DateTime>();

  CalendarYearController({
    required this.minDate,
    required this.maxDate,
    required this.itemScrollController,
  });

  final List<DateTime> years = [];
  final ScrollController scrollController = ScrollController();
  final GlobalKey listKey = GlobalKey();
  final GlobalKey headerKey = GlobalKey();
  final LinkedHashMap<int, GlobalKey> keys = LinkedHashMap();

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

  @override
  void onReady() {
    scrollOffsetListener.changes.listen((event) {
      _scrollListener();
    });
    jumpToYear(DateTime.now());
    super.onReady();
  }

  void _scrollListener() {
    RenderBox? listBox =
        listKey.currentContext?.findRenderObject() as RenderBox?;
    double listPos = listBox?.localToGlobal(Offset.zero).dy ?? 0;
    RenderBox? headerBox =
        headerKey.currentContext?.findRenderObject() as RenderBox?;
    double headerHeight = headerBox?.size.height ?? 0;
    double max = double.negativeInfinity;
    int topItemKey = 0;
    for (var entry in keys.entries) {
      GlobalKey<State<StatefulWidget>> key = entry.value;
      if (_isListItemRendered(key)) {
        RenderBox itemBox = key.currentContext!.findRenderObject() as RenderBox;
        double y = itemBox
            .localToGlobal(
              Offset(
                0,
                headerHeight - listPos,
              ),
            )
            .dy;
        if (y <= headerHeight && y > max) {
          topItemKey = entry.key;
          max = y;
        }
      }
    }
    int index = math.max(topItemKey, 0);

    if (index != topElementIndex) {
      DateTime curr = years[index];
      DateTime prev;
      try {
        prev = years[topElementIndex];
      } on RangeError catch (_) {
        prev = years[0];
      }
      if (prev != curr) {
        topElementIndex = index;
        topElem.value = years[index];
      }
    }
  }

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

  void jumpToYear(DateTime date) {
    //date must be minDate <= data <= maxDate
    if (date.year < minDate.year || date.year > maxDate.year) {
      return;
    }

    int index = date.year - minDate.year;
    try {
      itemScrollController.jumpTo(index: index);
      scrollOffsetController.animateScroll(
        offset: 30,
        duration: const Duration(milliseconds: 200),
      );

      topElem.value = date;
      topElementIndex = _indexOfYear(date);
    } catch (e) {
      logError(error: e);
    }
    wait(milliseconds: 200);
  }
}
