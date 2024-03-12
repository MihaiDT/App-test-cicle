import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet.dart';
import 'package:lines/modules/calendar/widgets/calendar_month_year_switch.dart';
import 'package:lines/modules/calendar/widgets/calendar_week_row.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_body.dart';
import 'package:lines/modules/calendar/widgets/scrollable_calendar.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/loaders/dark_loader.dart';

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
              SizedBox(
                height:
                    ThemeSize.heightSafeAreaTop + AppBar().preferredSize.height,
              ),
              Obx(
                () => CalendarMonthYearSwitch(
                  onTabChanged: controller.changeTab,
                  currentSelectedTab: controller.selectedTab.value,
                ),
              ),
              ThemeSizedBox.height24,
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
                        child: const ScrollableCalendar(
                          spaceBetweenCalendars: 70.0,
                        ),
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
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: Get.width * 0.4,
                            width: Get.width * 0.4,
                            child: const DarkLoader(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CalendarBottomSheet(),
        ],
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
