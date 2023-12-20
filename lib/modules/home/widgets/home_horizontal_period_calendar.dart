import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../core/app_theme.dart';
import '../../../core/utils/helpers.dart';
import '../home_controller.dart';

class HomeHorizontalPeriodCalendar extends GetView<HomeController> {
  const HomeHorizontalPeriodCalendar({super.key});

  String get _selectedDateFormatYMD => dateFormatYMD
      .format(controller.dates[controller.periodSelectedDateIndex]);

  double get _cellWidth => Get.width / 7;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: Get.width,
      child: ScrollSnapList(
        key: controller.scrollSnapListKey,
        dynamicItemSize: false,
        focusOnItemTap: true,
        initialIndex: (7 * 3) + 2,
        itemBuilder: _buildListItem,
        itemCount: 7 * 7,
        // 7 days * 7 weeks
        itemSize: Get.width / 7,
        // Dimensione singolo giorno del calendario
        onItemFocus: controller.horizontalCalendarOnItemFocus,
        updateOnScroll: false,
        shrinkWrap: true,
      ),
    );
  }

  /// Private methods

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
      width: _cellWidth,
      child: Center(
        child: Obx(
          () => _dayFromDate(date: controller.dates[index], index: index),
        ),
      ),
    );
  }

  Widget _dayFromDate({required DateTime date, required int index}) {
    final formattedDateYMD = dateFormatYMD.format(date);

    final DateTime now = DateTime.now();
    final formattedNowYMD = dateFormatYMD.format(now);

    final List<Widget> children = [];

    if (formattedDateYMD == _selectedDateFormatYMD) {
      // È la data selezionata
      children.addAll(
        [
          Text(
            formattedNowYMD == formattedDateYMD
                ? 'OGGI'
                : _weekDayFromDate(date),
            style: const TextStyle(
              color: Color(0xffB438B2),
              fontSize: 15,
              fontWeight: FontWeight.w900,
              height: 1.4,
            ),
          ),
          ThemeSizedBox.height4,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: ThemeGradient.primary,
            ),
            height: 32,
            width: 32,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: HeadlineMedium(
                  "${date.day}",
                  fontWeight: NewThemeTextStyle.weightExtraBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      children.addAll(
        [
          BodyLarge(
            formattedNowYMD == formattedDateYMD
                ? 'OGGI'
                : _weekDayFromDate(date),
            color: const Color(0xffB438B2),
            fontWeight: NewThemeTextStyle.weightMedium,
          ),
          BodyLarge(
            "${date.day}",
            color: ThemeColor.primary,
            fontWeight: NewThemeTextStyle.weightMedium,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  String _weekDayFromDate(DateTime date) {
    switch (date.weekday) {
      case 0:
        return 'D';
      case 1:
        return 'L';
      case 2:
        return 'M';
      case 3:
        return 'M';
      case 4:
        return 'G';
      case 5:
        return 'V';
      case 6:
        return 'S';
    }

    return 'D';
  }
}
