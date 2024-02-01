import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/utils/date_time_extension.dart';

import '../../../core/utils/custom_date_utils.dart';
import '../../../data/enums/calendar_tabs.dart';
import '../calendar_controller.dart';
import 'calendar_day_select_multiple_widget.dart';
import 'calendar_day_widget.dart';

class CalendarGridWidget extends StatelessWidget {
  final int year;
  final int month;
  final double circleRadius;
  final Function(DateTime) onDayTapped;
  final bool multipleSelectedMode;
  final bool isAnnualCalendar;

  CalendarGridWidget({
    super.key,
    required this.year,
    required this.month,
    required this.circleRadius,
    required this.onDayTapped,
    this.multipleSelectedMode = false,
    this.isAnnualCalendar = false,
  });

  final CalendarController controller = Get.find<CalendarController>();

  @override
  Widget build(BuildContext context) {
    int startDayOfWeek = CustomDateUtils.calculateStartDayOfWeek(year, month);
    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        DateTime(year, month + 1, 0).day + startDayOfWeek,
        (index) {
          final dayOfMonth = CustomDateUtils.getDayOfMonthFromIndex(
              year, month, index, startDayOfWeek);

          return Visibility(
            visible: index >= startDayOfWeek,
            child: LayoutBuilder(
              builder: (context, constraints) => InkWell(
                onTap: () {
                  onDayTapped(dayOfMonth);
                },
                child: _dayWidget(
                  dayOfMonth,
                  constraints,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dayWidget(DateTime dayOfMonth, BoxConstraints constraints) {
    String dayText = '${dayOfMonth.day}';
    String formattedDate = DateFormat('yyyy-MM-dd').format(dayOfMonth);

    return Obx(
      () {
        if (controller.selectedTab == CalendarTabs.monthTab &&
            multipleSelectedMode) {
          bool isSelected = controller.datesToAdd.containsKey(formattedDate);
          return CalendarDaySelectMultipleWidget(
            isSelected: isSelected,
            text: dayText,
            isToday: dayOfMonth.isToday,
            onDayTapped: () {
              DateTime tomorrow = DateTime.now().add(
                const Duration(days: 1),
              );
              String tomorrowFormatted =
                  DateFormat('yyyy-MM-dd').format(tomorrow);

              if (formattedDate.compareTo(tomorrowFormatted) < 0) {
                if (isSelected) {
                  controller.removeDate(formattedDate);
                } else {
                  controller.addDate(formattedDate);
                }
              }
            },
          );
        }
        return CalendarDayWidget(
          calendarDayDTO: controller.getDTOForDay(formattedDate),
          isToday: dayOfMonth.isToday,
          isSelected: controller.calendarStore.selectedDate != null
              ? controller.calendarStore.selectedDate!.isSameDay(dayOfMonth)
              : false,
          parentConstraints: constraints,
          text: dayText,
          isAnnualCalendar: isAnnualCalendar,
        );
      },
    );
  }
}
