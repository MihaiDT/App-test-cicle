import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/widgets/buttons/primary_button.dart';

class CalendarBottomsheetTopButtons extends GetView<CalendarController> {
  const CalendarBottomsheetTopButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ThemeEdgeInsets.horizontalSmall,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _jumpToMonthButton(context),
          Obx(
            () {
              return Visibility(
                visible: controller.selectedTab.value == CalendarTabs.monthTab,
                child: IntrinsicWidth(
                  child: PrimaryButton(
                    buttonSize: ButtonSize.h31,
                    onPressed: () async {
                      if (controller.modifyPeriodMode.value) {
                        await controller.newSaveDates();

                        controller.expandBottomSheetTorxSheetVSize();
                      } else {
                        controller.collapseBottomSheet();
                      }
                      controller.modifyPeriodMode.value =
                          !controller.modifyPeriodMode.value;

                      _updateHomeCalendar();

                      /// Await some time and then scroll the page to today
                      wait(milliseconds: 600).then(
                        (value) {
                          controller.jumpToToday();
                        },
                      );

                      PiwikManager.trackEvent(
                        PiwikEventType.profile,
                        action: 'update period report',
                      );
                    },
                    child: HeadlineSmall(
                      controller.modifyPeriodMode.value
                          ? 'Salva mestruazione'
                          : 'Modifica mestruazioni',
                    ),
                  ),
                ),
              );
            },
          ),
          const IgnorePointer(
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  void _updateHomeCalendar() async {
    await CalendarService.fetchCurrentPeriod();
    final homeController = Get.find<HomeController>();
    homeController.scrollCalendarToToday();
  }

  Widget _jumpToMonthButton(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.jumpToToday();
      },
      child: CircleAvatar(
        backgroundColor: ThemeColor.buttonJumpToMonth,
        radius: 24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ThemeIcon.calendarJumpToMonth,
                ),
              ],
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LabelLarge(
                    'OGGI',
                    height: 0.77,
                  ).applyShaders(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
