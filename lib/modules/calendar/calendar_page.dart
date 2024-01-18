import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/theme/text_wrapper.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_decoration.dart';
import '../../core/theme/theme_icon.dart';
import '../../widgets/appbar/transparent_app_bar.dart';
import '../../widgets/layouts/app_scaffold_padding.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import 'calendar_controller.dart';
import 'widgets/calendar_bottom_sheet.dart';
import 'widgets/calendar_scrollable_calendar.dart';
import 'widgets/calendar_week_row.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          GestureDetector(
            //TODO: add onTap
            child: SvgPicture.asset(
              ThemeIcon.threeDots,
              color: ThemeColor.darkBlue,
            ),
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleLarge(
          'CALENDARIO',
          color: ThemeColor.darkBlue,
        ),
      ),
      backgroundImage: ThemeDecoration.images.bgCalendar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _scrollableCalendar,
          CalendarWeekRow(controller: controller),
          CalendarBottomSheet(),
        ],
      ),
    );
  }

  Widget get _scrollableCalendar {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: AppScaffoldPadding(
        bottom: 0,
        sidePaddingLarge: false,
        child: ScrollableCalendar(
          calendarScrollableCalendarController:
              controller.scrollableCalendarController,
          spaceBetweenCalendars: 70.0,
        ),
      ),
    );
  }
}
