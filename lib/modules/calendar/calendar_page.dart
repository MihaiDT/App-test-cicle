import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_body.dart';

import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_icon.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_month_year_switch.dart';
import 'package:lines/modules/calendar/widgets/scrollable_calendar.dart';
import 'package:lines/modules/calendar/widgets/calendar_week_row.dart';

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
                  currentSelectedTab: controller.selectedTab.value,
                ),
              ),
              ThemeSizedBox.height32,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Obx(
                  () => Visibility(
                    visible:
                        controller.selectedTab.value == CalendarTabs.monthTab,
                    child: CalendarWeekRow(controller: controller),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Obx(
                      () => Offstage(
                        offstage: !(controller.selectedTab.value ==
                                CalendarTabs.monthTab &&
                            controller.pageShouldRefresh),
                        child: _scrollableCalendar,
                      ),
                    ),
                    Obx(
                      () => Offstage(
                        offstage: !(controller.selectedTab.value ==
                                CalendarTabs.yearTab &&
                            controller.pageShouldRefresh),
                        child: const CalendarYearBody(),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: !controller.pageShouldRefresh,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
