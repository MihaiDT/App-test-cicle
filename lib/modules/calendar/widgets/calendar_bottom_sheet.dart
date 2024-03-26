// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_recap.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottomsheet_top_buttons.dart';
import 'package:lines/modules/calendar/widgets/new_calendar_bottom_sheet_row.dart';
import 'package:lines/widgets/bottom_sheets/bottom_sheet_dragger.dart';
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
                  child: const CalendarBottomsheetTopButtons(),
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
                    calendarBottomsheetBody(context),
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

  Widget _selectedDateLabel() {
    return Obx(
      () => LabelLarge(
        _bottomSheetDayText,
        color: ThemeColor.primary,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget calendarBottomsheetBody(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemCount: controller.symptomCategories.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  controller.symptomCategories[index].iconPath,
                ),
                ThemeSizedBox.width16,
                TitleMedium(
                  controller.symptomCategories[index].name.toUpperCase(),
                  color: ThemeColor.brightPink,
                ),
              ],
            ),
            ThemeSizedBox.height8,
            DividerWithGradient(
              gradient: ThemeGradient.primary,
            ),
            ThemeSizedBox.height16,
            NewCalendarBottomSheetRow(
              category: controller.symptomCategories[index],
            ),
            ThemeSizedBox.height48,
          ],
        );
      },
    );
  }
}
