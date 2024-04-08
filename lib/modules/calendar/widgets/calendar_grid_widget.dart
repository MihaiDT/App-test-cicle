import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/custom_date_utils.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_day_select_multiple_widget.dart';
import 'package:lines/modules/calendar/widgets/calendar_day_widget.dart';

class CalendarGridWidget extends GetView<CalendarController> {
  final int year;
  final int month;
  final Function(DateTime) onDayTapped;
  final bool multipleSelectedMode;
  final bool isAnnualCalendar;

  const CalendarGridWidget({
    super.key,
    required this.year,
    required this.month,
    required this.onDayTapped,
    this.multipleSelectedMode = false,
    this.isAnnualCalendar = false,
  });

  @override
  Widget build(BuildContext context) {
    int startDayOfWeek = CustomDateUtils.calculateStartDayOfWeek(year, month);
    return GridView.builder(
      itemCount: DateTime(year, month + 1, 0).day + startDayOfWeek,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DateTime.daysPerWeek,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final dayOfMonth = CustomDateUtils.getDayOfMonthFromIndex(
          year,
          month,
          index,
          startDayOfWeek,
        );
        return Visibility(
          visible: index >= startDayOfWeek,
          child: GestureDetector(
            onTap: () {
              onDayTapped(dayOfMonth);
            },
            child: Obx(
              () {
                return _dayWidget(dayOfMonth);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _dayWidget(DateTime dayOfMonth) {
    String dayText = '${dayOfMonth.day}';
    String formattedDate = dateFormatYMD.format(dayOfMonth);
    if (controller.selectedTab.value == CalendarTabs.monthTab &&
        multipleSelectedMode) {
      final isSelected = controller.addedMensesDates.contains(formattedDate);
      return CalendarDaySelectMultipleWidget(
        isSelected: isSelected,
        text: dayText,
        isToday: dayOfMonth.isToday,
        onDayTapped: () {
          if (dayOfMonth.isSameDayOrBefore(DateTime.now())) {
            controller.updateMensesDay(formattedDate);
          }
        },
      );
    }

    return CalendarDayWidget(
      singleDayData: appController.calendarData.value?.calendarDays
          .firstWhereOrNull((element) {
        return element.date == formattedDate;
      }),
      formattedDate: formattedDate,
      isAnnualCalendar: isAnnualCalendar,
      isSelected: controller.rxSelectedDate.value.isSameDay(dayOfMonth),
    );
  }
}
