import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeHorizontalCalendar extends GetView<HomeController> {
  const HomeHorizontalCalendar({
    super.key,
  });

  String get _selectedDateFormatYMD => controller.currentPeriodDatesMap.keys
      .toList()[controller.periodSelectedDateIndex.value];

  double get _cellWidth => Get.width / 7;

  @override
  Widget build(BuildContext context) {
    final dateKeys = controller.currentPeriodDatesMap.keys.toList();

    return Container(
      clipBehavior: Clip.none,
      height: 90,
      width: Get.width,
      child: Stack(
        children: [
          dateKeys.isNotEmpty
              ? ScrollSnapList(
                  key: controller.scrollSnapListKey,
                  dynamicItemSize: false,
                  focusOnItemTap: true,
                  initialIndex: controller.periodSelectedDateIndex.toDouble(),
                  itemBuilder: _buildListItem,
                  itemCount: dateKeys.length,
                  // 7 days * 7 weeks
                  itemSize: Get.width / 7,
                  // Dimensione singolo giorno del calendario
                  onItemFocus: (index) {
                    PiwikManager.trackEvent(
                      PiwikEventType.profile,
                      action: 'select date',
                    );
                    controller.periodSelectedDateIndex.value = index;
                  },

                  updateOnScroll: false,
                  shrinkWrap: true,
                )
              : _buildFakeCalendar(context),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                height: 90,
                width: Get.width / 7,
                child: SvgPicture.asset(
                  ThemeIcon.horizontalCalendarMagnifier,
                  fit: BoxFit.contain,
                  height: 90,
                  width: Get.width / 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// When the user hasn't inserted any period, we show a fake calendar
  Widget _buildFakeCalendar(BuildContext context) {
    return Row(
      children: List.generate(
        generateDateList().length,
        (index) {
          return SizedBox(
            width: _cellWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  generateDateList()[index].isToday
                      ? 'OGGI'
                      : _weekDayFromDate(generateDateList()[index]),
                  style: ThemeTextStyle.horizontalCalendarWDayToday,
                  textAlign: TextAlign.center,
                ),
                Text(
                  generateDateList()[index].day.toString(),
                  style: ThemeTextStyle.horizontalCalendarDate,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
      width: _cellWidth,
      child: Center(
        child: Obx(
          () => _dayFromDate(
            formattedDateYMD:
                controller.currentPeriodDatesMap.keys.toList()[index],
            index: index,
          ),
        ),
      ),
    );
  }

  List<DateTime> generateDateList() {
    DateTime today = DateTime.now();

    List<DateTime> dateList = [];

    for (int i = -3; i <= 3; i++) {
      DateTime date = today.add(Duration(days: i));
      dateList.add(date);
    }

    return dateList;
  }

  Widget _dayFromDate({required String formattedDateYMD, required int index}) {
    final DateTime date = dateFormatYMD.parse(formattedDateYMD);
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
            style: ThemeTextStyle.horizontalCalendarWDayToday,
            textAlign: TextAlign.center,
          ),
          Text(
            "${date.day}",
            style: ThemeTextStyle.horizontalCalendarDateToday,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else {
      children.addAll(
        [
          Text(
            formattedNowYMD == formattedDateYMD
                ? 'OGGI'
                : _weekDayFromDate(date),
            style: ThemeTextStyle.horizontalCalendarWDay,
            textAlign: TextAlign.center,
          ),
          Text(
            "${date.day}",
            style: ThemeTextStyle.horizontalCalendarDate,
            textAlign: TextAlign.center,
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
