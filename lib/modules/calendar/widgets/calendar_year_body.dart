import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_months_grid.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_title_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CalendarYearBody extends GetView<CalendarController> {
  const CalendarYearBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.calendarYearController.scrollController,
      itemCount: controller.calendarYearController.years.length,
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: StickyHeaderBuilder(
            builder: (context, stuckAmount) => CalendarYearTitleWidget(
              year: controller.calendarYearController.years[index].year,
              isAttached: stuckAmount == 1,
            ),
            content: CalendarYearMonthsGrid(
              months: controller.getMonthsDataForYearCalendar(
                controller.calendarYearController.years[index],
              ),
              onMonthTapped: controller.goBackToMonthCalendar,
            ),
          ),
        );
      },
    );
  }
}
