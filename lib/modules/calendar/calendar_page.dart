import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_app_bar.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet.dart';
import 'package:lines/modules/calendar/widgets/calendar_month_year_switch.dart';
import 'package:lines/modules/calendar/widgets/calendar_week_row.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_body.dart';
import 'package:lines/modules/calendar/widgets/scrollable_calendar.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/loaders/dark_loader.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appBar = CalendarAppBar();
    return AppScaffoldPage(
      appBar: appBar,
      backgroundImage: ThemeDecoration.images.bgCalendar,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              SizedBox(
                height:
                    ThemeSize.heightSafeAreaTop + appBar.preferredSize.height,
              ),
              Obx(
                () => CalendarMonthYearSwitch(
                  onTabChanged: controller.changeTab,
                  currentSelectedTab: controller.selectedTab.value,
                ),
              ),
              ThemeSizedBox.height24,
              Obx(
                () {
                  if (!controller.pageShouldRefresh) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: (Get.height * 0.1),
                      ),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: const DarkLoader(),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Obx(
                              () => Visibility(
                                visible: controller.selectedTab.value ==
                                    CalendarTabs.monthTab,
                                child: CalendarWeekRow(controller: controller),
                              ),
                            ),
                          ),
                          pageView,
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          Obx(
            () => !controller.showTooltip.value
                ? const SizedBox.shrink()
                : Positioned(
                    top: ThemeSize.heightSafeAreaTop +
                        ThemeSize.heightAppBarDefault -
                        8,
                    right: 24,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          ThemeShadow.flushShadow,
                          ThemeShadow.flushShadow,
                          ThemeShadow.flushShadow,
                        ],
                        image: ThemeDecoration.images.bgCalendar,
                      ),
                      width: 180,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.showTooltip.value = false;
                              Get.toNamed(Routes.historyPage);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const HeadlineSmall(
                                  "Cronologia del diario",
                                  color: ThemeColor.darkBlue,
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  ThemeIcon.arrowRight,
                                  color: ThemeColor.primary,
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              controller.showTooltip.value = false;
                              Get.toNamed(
                                Routes.yourDiaryPage,
                                arguments: {'showTitle': false},
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const HeadlineSmall(
                                  "Grafici e statistiche",
                                  color: ThemeColor.darkBlue,
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  ThemeIcon.arrowRight,
                                  color: ThemeColor.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          Obx(
            () {
              return Visibility(
                visible: controller.showBottomSheet,
                child: const CalendarBottomSheet(),
              );
            },
          ),

          /// Save button that appear only when the user is modifying the symptoms
          /// for the selected date
          Obx(
            () => Visibility(
              visible: controller.showSaveButtonSymptoms,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  child: PrimaryButton(
                    child: const TitleLarge(
                      'SALVA',
                    ),
                    onPressed: () {
                      controller.saveSymptoms();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get pageView {
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageViewController,
        itemBuilder: (context, index) {
          return index == 0
              ? const ScrollableCalendar(
                  spaceBetweenCalendars: 70.0,
                )
              : const CalendarYearBody();
        },
      ),
    );
  }
}
