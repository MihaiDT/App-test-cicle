import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_months_grid.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_title_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarYearBody extends GetView<CalendarController> {
  const CalendarYearBody({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarYearController = controller.calendarYearController;
    final years = calendarYearController.years;
    final itemCount = years.length * 2;
    final initialScrollIndex =
        calendarYearController.indexOfYear(DateTime.now()) * 2;

    return Stack(
      children: [
        StickyHeader(
          controller: calendarYearController.stickyHeaderController,
          child: ScrollablePositionedList.builder(
            initialScrollIndex: initialScrollIndex,
            itemScrollController: calendarYearController.itemScrollController,
            scrollOffsetController:
                calendarYearController.scrollOffsetController,
            itemCount: itemCount,
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: (context, index) {
              final yearIndex = index ~/ 2;
              if (index.isEven) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: StickyContainerBuilder(
                    builder: (context, stuckAmount) {
                      return CalendarYearTitleWidget(
                        year: years[yearIndex].year,
                        isAttached: stuckAmount == 1,
                      );
                    },
                    index: index,
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CalendarYearMonthsGrid(
                    months: controller
                        .getMonthsDataForYearCalendar(years[yearIndex]),
                    onMonthTapped: controller.goBackToMonthCalendar,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
