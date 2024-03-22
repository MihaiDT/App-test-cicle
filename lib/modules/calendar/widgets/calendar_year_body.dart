import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_months_grid.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_title_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarYearBody extends GetView<CalendarController> {
  const CalendarYearBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StickyHeader(
          controller: controller.calendarYearController.stickyHeaderController,
          child: ScrollablePositionedList.builder(
            initialScrollIndex:
                controller.calendarYearController.indexOfYear(DateTime.now()) *
                    2,
            itemScrollController:
                controller.calendarYearController.itemScrollController,
            scrollOffsetController:
                controller.calendarYearController.scrollOffsetController,
            itemCount: controller.calendarYearController.years.length * 2,
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            itemBuilder: (context, index) {
              if (index.isEven) {
                final yearIndex = index ~/ 2;
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: StickyContainerBuilder(
                    builder: (context, stuckAmount) {
                      return CalendarYearTitleWidget(
                        year: controller
                            .calendarYearController.years[yearIndex].year,
                        isAttached: stuckAmount == 1,
                      );
                    },
                    index: index,
                  ),
                );
              } else {
                final yearIndex = (index - 1) ~/ 2;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CalendarYearMonthsGrid(
                    months: controller.getMonthsDataForYearCalendar(
                      controller.calendarYearController.years[yearIndex],
                    ),
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
