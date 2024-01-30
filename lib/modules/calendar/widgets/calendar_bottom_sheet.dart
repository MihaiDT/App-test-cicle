import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_recap.dart';

import '../../../widgets/buttons/primary_button.dart';
import '../calendar_controller.dart';
import 'calendar_bottom_sheet_body.dart';

class CalendarBottomSheet extends StatelessWidget {
  final CalendarController controller = Get.find();

  CalendarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          DraggableScrollableSheet(
            controller: controller.draggableScrollableController,
            initialChildSize: controller.sheetVSize,
            maxChildSize: 0.95,
            minChildSize: 0.1,
            shouldCloseOnMinExtent: true,
            builder: (context, scrollController) {
              return Stack(
                children: [
                  Obx(
                    () {
                      return Visibility(
                        visible: controller.showBottomMenu,
                        child: Container(
                          key: controller.bottomSheetContainerKey,
                          margin: const EdgeInsets.only(top: 75),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 10,
                                  blurRadius: 50,
                                  offset: const Offset(0, -10))
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                  ThemeImage.bgCalendarBottomSheet,
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            controller: scrollController,
                            children: [
                              ThemeSizedBox.height24,
                              LabelLarge(
                                _bottomSheetDayText,
                                color: ThemeColor.primary,
                                textAlign: TextAlign.center,
                              ),
                              ThemeSizedBox.height16,
                              Obx(() => Visibility(
                                    visible: controller.showRecapMenu,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: CalendarBottomSheetRecap(
                                          symptomsController:
                                              controller.symptomsController),
                                    ),
                                  )),
                              DisplayMedium(
                                key: controller.bottomSheetTitleKey,
                                'Aggiungi sintomi e attività',
                                textAlign: TextAlign.center,
                              ).applyShaders(context),
                              ThemeSizedBox.height24,
                              Obx(
                                () => Visibility(
                                  visible:
                                      controller.calendarStore.selectedDate !=
                                          null,
                                  child: CalendarBottomSheetBody(
                                    categories: controller.symptomsController
                                        .calendarStore.currentCategories,
                                    onSymptomTap: controller
                                        .symptomsController.changeSelectedValue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Flexible(
                        child: Obx(
                          () => Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: controller.showBarButton,
                            child: Padding(
                              padding: ThemeEdgeInsets.horizontalSmall,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _jumpToMonthButton(context),
                                  Obx(
                                    () => Visibility(
                                      visible: controller.selectedTab ==
                                          CalendarTabs.monthTab,
                                      child: IntrinsicWidth(
                                        child: PrimaryButton(
                                          buttonSize: ButtonSize.h31,
                                          onPressed: () {
                                            controller.modifyPeriodMode =
                                                !controller.modifyPeriodMode;
                                          },
                                          child: TitleLarge(
                                            controller.modifyPeriodMode
                                                ? 'Salva mestruazione'
                                                : 'Modifica mestruazioni',
                                          ),
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
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.showBottomMenu,
                          child: IgnorePointer(
                            child: Column(
                              children: [
                                ThemeSizedBox.height36,
                                Center(
                                  child: Container(
                                    height: 4,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ThemeColor.primaryOpaque,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Obx(
            () => Visibility(
              visible: controller.showSaveButton,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: PrimaryButton(
                    child: const TitleLarge(
                      'SALVA',
                    ),
                    onPressed: () {
                      controller.onSaved();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //return the text for day inside the bottom sheet , add OGGI label if the date selected is today
  String get _bottomSheetDayText {
    if (controller.calendarStore.selectedDate != null) {
      String text = DateFormat('dd MMMM', 'it')
          .format(controller.calendarStore.selectedDate!)
          .toUpperCase();
      if (controller.calendarStore.selectedDate!.isToday) {
        return 'OGGI- $text';
      } else {
        return text;
      }
    } else {
      return 'NO SELECTED DATE';
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
            )
          ],
        ),
      ),
    );
  }
}
