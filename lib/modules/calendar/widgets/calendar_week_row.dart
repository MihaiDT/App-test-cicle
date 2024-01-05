import 'package:flutter/material.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_decoration.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../widgets/appbar/transparent_app_bar.dart';
import '../../../widgets/dividers/divider_with_gradient.dart';
import '../../../widgets/layouts/app_scaffold_padding.dart';
import 'calendar_month_year_switch.dart';

class CalendarWeekRow extends StatelessWidget {
  final CalendarController controller;

  CalendarWeekRow({
    required this.controller,
    super.key,
  });
  double appBarHeight = const TransparentAppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: ThemeDecoration.images.bgCalendar,
      ),
      child: AppScaffoldPadding(
        top: appBarHeight + 16,
        sidePaddingLarge: false,
        bottom: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: CalendarMonthYearSwitch(),
            ),
            GridView.count(
              crossAxisCount: DateTime.daysPerWeek,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: List.generate(DateTime.daysPerWeek, (index) {
                final weekDay = controller.scrollableCalendarController
                    .getDaysOfWeek()[index];
                return Center(
                  child: TitleLarge(
                    weekDay,
                    color: ThemeColor.primary,
                  ),
                );
              }),
            ),
            DividerWithGradient(gradient: ThemeGradient.primary)
          ],
        ),
      ),
    );
  }
}
