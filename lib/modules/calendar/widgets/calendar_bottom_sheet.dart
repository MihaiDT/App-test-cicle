// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/data/enums/calendar_tabs.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_recap.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_row.dart';
import 'package:lines/widgets/bottom_sheets/bottom_sheet_dragger.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';

class CalendarBottomSheet extends GetView<CalendarController> {
  const CalendarBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: controller.draggableScrollableController,
      initialChildSize: controller.rxSheetVSize.value,
      maxChildSize: controller.bottomSheetMaxHeight,
      minChildSize: 0.1,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) {
        return Column(
          children: [
            Obx(
              () {
                return AnimatedOpacity(
                  opacity: controller.showSaveButton.value ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: topButtons(context),
                );
              },
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
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
                  shrinkWrap: true,
                  controller: scrollController,
                  padding: EdgeInsets.zero,
                  children: [
                    ThemeSizedBox.height8,
                    const BottomSheetDragger(),
                    ThemeSizedBox.height12,
                    _selectedDateLabel(),
                    ThemeSizedBox.height16,
                    Visibility(
                      visible: controller.showRecapMenu,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ThemeSize.paddingSmall,
                        ),
                        child: CalendarBottomSheetRecap(),
                      ),
                    ),
                    const DisplayMedium(
                      'Aggiungi sintomi e attività',
                      textAlign: TextAlign.center,
                    ).applyShaders(context),
                    ThemeSizedBox.height24,
                    ...calendarBottomsheetBody(context),
                    ThemeSizedBox.height48,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Return the text for day inside the bottom sheet , add OGGI label if the date selected is today
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
    return GestureDetector(
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

  List<SymptomCategory> get _categories => SymptomCategory.findAll();

  List<Widget> calendarBottomsheetBody(BuildContext context) {
    return List.generate(
      _categories.length,
      (categoryIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    _categories[categoryIndex].iconPath,
                  ),
                  ThemeSizedBox.width16,
                  TitleMedium(
                    _categories[categoryIndex].name.toUpperCase(),
                    color: ThemeColor.brightPink,
                  ),
                ],
              ),
            ),
            ThemeSizedBox.height8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DividerWithGradient(gradient: ThemeGradient.primary),
            ),
            ThemeSizedBox.height16,
            CalendarBottomSheetRow(
              categoryIndex: categoryIndex,
              category: _categories[categoryIndex],
            ),
            ThemeSizedBox.height48,
          ],
        );
      },
    );
  }

  Widget topButtons(BuildContext context) {
    return Padding(
      padding: ThemeEdgeInsets.horizontalSmall,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _jumpToMonthButton(context),
          Visibility(
            visible: controller.selectedTab.value == CalendarTabs.monthTab,
            child: IntrinsicWidth(
              child: PrimaryButton(
                buttonSize: ButtonSize.h31,
                onPressed: () async {
                  if (controller.modifyPeriodMode.value) {
                    await controller.saveDates();
                    controller.expandBottomSheetTorxSheetVSize();
                    controller.rxSelectedDate.refresh();
                  } else {
                    controller.collapseBottomSheet();
                  }
                  controller.modifyPeriodMode.value =
                      !controller.modifyPeriodMode.value;
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
    );
  }
}
