import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_grid_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollableCalendar extends GetView<CalendarController> {
  final double spaceBetweenCalendars;

  const ScrollableCalendar({
    required this.spaceBetweenCalendars,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ScrollablePositionedList.separated(
        itemScrollController: controller.monthCalendarItemScrollController,
        separatorBuilder: (_, __) => SizedBox(height: spaceBetweenCalendars),
        itemCount: controller.months.length,
        itemBuilder: (context, index) {
          final DateTime month = controller.months[index];

          if (index == 0) {
            return Column(
              children: [
                ThemeSizedBox.height32,
                _childColumn(month, context),
              ],
            );
          }

          //if you reached the end then add some space after the last month
          if (index >= controller.months.length - 1) {
            return Column(
              children: [
                _childColumn(month, context),
                SizedBox(height: Get.height * 0.3),
              ],
            );
          }
          return _childColumn(month, context);
        },
      ),
    );
  }

  Widget _childColumn(DateTime month, context) {
    final String monthText = DateFormat('MMMM yyyy', 'it')
        .format(
          DateTime(
            month.year,
            month.month,
          ),
        )
        .toUpperCase();

    return Column(
      children: [
        TitleMedium(monthText).applyShaders(context),
        Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.1),
        ),
        Obx(
          () => CalendarGridWidget(
            year: month.year,
            month: month.month,
            onDayTapped: controller.onDayTapped,
            multipleSelectedMode: controller.modifyPeriodMode.value,
          ),
        ),
      ],
    );
  }
}
