import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_body.dart';

import '../../core/theme/text_wrapper.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_decoration.dart';
import '../../core/theme/theme_icon.dart';
import '../../core/theme/theme_sized_box.dart';
import '../../data/enums/calendar_tabs.dart';
import '../../widgets/appbar/transparent_app_bar.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import 'calendar_controller.dart';
import 'widgets/calendar_month_year_switch.dart';
import 'widgets/calendar_scrollable_calendar.dart';
import 'widgets/calendar_week_row.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: _appBar,
      backgroundImage: ThemeDecoration.images.bgCalendar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              Visibility.maintain(
                visible: false,
                child: _appBar,
              ),
              ThemeSizedBox.height12,
              Obx(
                () => CalendarMonthYearSwitch(
                  onTabChanged: controller.changeTab,
                  currentSelectedTab: controller.selectedTab,
                ),
              ),
              ThemeSizedBox.height32,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Obx(
                  () => Visibility(
                    visible: controller.selectedTab == CalendarTabs.monthTab,
                    child: CalendarWeekRow(controller: controller),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Obx(
                      () => Offstage(
                        offstage:
                            !(controller.selectedTab == CalendarTabs.monthTab),
                        child: _scrollableCalendar,
                      ),
                    ),
                    Obx(
                      () => Offstage(
                        offstage:
                            !(controller.selectedTab == CalendarTabs.yearTab),
                        child: const CalendarYearBody(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          CalendarBottomSheet(),
        ],
      ),
    );
  }

  Widget get _scrollableCalendar {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ScrollableCalendar(
        calendarScrollableCalendarController:
            controller.scrollableCalendarController,
        spaceBetweenCalendars: 70.0,
      ),
    );
  }

  PreferredSizeWidget get _appBar {
    return TransparentAppBar(
      actions: [
        InkWell(
          //TODO: add onTap
          onTap: () {},
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
    );
  }
}
