// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_recap.dart';
import 'package:lines/widgets/bottom_sheets/bottom_sheet_dragger.dart';

import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_body.dart';

class CalendarBottomSheet extends GetView<CalendarController> {
  const CalendarBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => DraggableScrollableSheet(
            controller: controller.draggableScrollableController,
            initialChildSize: controller.rxSheetVSize.value,
            maxChildSize: 0.96,
            minChildSize: 0.1,
            shouldCloseOnMinExtent: true,
            builder: (context, scrollController) {
              return Stack(
                children: [
                  Obx(
                    () => Visibility(
                      visible: controller.rxShowBottomMenu.value,
                      child: Container(
                        key: controller.bottomSheetContainerKey,
                        margin: const EdgeInsets.only(top: 75),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 50,
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, -10),
                              spreadRadius: 10,
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              ThemeImage.bgCalendarBottomSheet,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          children: [
                            ThemeSizedBox.height12,
                            const BottomSheetDragger(),
                            ThemeSizedBox.height16,
                            _selectedDateLabel(),
                            ThemeSizedBox.height16,
                            _recapMenu(),
                            DisplayMedium(
                              key: controller.bottomSheetTitleKey,
                              'Aggiungi sintomi e attività',
                              textAlign: TextAlign.center,
                            ).applyShaders(context),
                            ThemeSizedBox.height24,
                            const CalendarBottomSheetBody(),
                            ThemeSizedBox.height48,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        Flexible(
                          child: Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: controller.rxShowBarButton.value,
                            child: Padding(
                              padding: ThemeEdgeInsets.horizontalSmall,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _jumpToMonthButton(context),
                                  Visibility(
                                    visible: controller.selectedTab.value ==
                                        CalendarTabs.monthTab,
                                    child: IntrinsicWidth(
                                      child: PrimaryButton(
                                        buttonSize: ButtonSize.h31,
                                        onPressed: () async {
                                          if (controller
                                              .modifyPeriodMode.value) {
                                            await controller.saveDates();
                                            controller
                                                .expandBottomSheetTorxSheetVSize();
                                            controller.rxSelectedDate.refresh();
                                          } else {
                                            controller.collapseBottomSheet();
                                          }
                                          controller.modifyPeriodMode.value =
                                              !controller
                                                  .modifyPeriodMode.value;
                                        },
                                        child: TitleLarge(
                                          controller.modifyPeriodMode.value
                                              ? 'Salva mestruazione'
                                              : 'Modifica mestruazioni',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const IgnorePointer(
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.showSaveButtonSymptoms,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
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
    );
  }

  //return the text for day inside the bottom sheet , add OGGI label if the date selected is today
  String get _bottomSheetDayText {
    String text = DateFormat('dd MMMM', 'it')
        .format(controller.rxSelectedDate.value)
        .toUpperCase();
    if (controller.rxSelectedDate.value.isToday) {
      return 'OGGI - $text';
    } else {
      return text;
    }
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

  Widget _selectedDateLabel() {
    return Obx(
      () => LabelLarge(
        _bottomSheetDayText,
        color: ThemeColor.primary,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _recapMenu() {
    return Obx(
      () => Visibility(
        visible: controller.showRecapMenu,
        child: const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: CalendarBottomSheetRecap(),
        ),
      ),
    );
  }
}
