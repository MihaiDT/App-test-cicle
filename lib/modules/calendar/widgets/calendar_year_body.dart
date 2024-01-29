import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_sized_box.dart';
import '../../../widgets/dividers/divider_with_gradient.dart';
import '../calendar_controller.dart';
import 'calendar_grid_widget.dart';

class CalendarYearBody extends StatefulWidget {
  const CalendarYearBody({super.key});

  @override
  State<CalendarYearBody> createState() => _CalendarYearBodyState();
}

class _CalendarYearBodyState extends State<CalendarYearBody> {
  final CalendarController controller = Get.find<CalendarController>();

  // @override
  // void didUpdateWidget(covariant CalendarYearBody oldWidget) {
  //
  //   debugPrint('FINITOOOO');
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: false,
              maintainSize: true,
              maintainInteractivity: false,
              maintainAnimation: true,
              maintainState: true,
              child: Column(
                children: [
                  const HeadlineMedium(
                    'notext',
                    color: ThemeColor.primary,
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height8,
                  DividerWithGradient(gradient: ThemeGradient.primary)
                ],
              ),
            ),
            Flexible(
              key: controller.calendarYearController.listKey,
              child: ListView.builder(
                controller: controller.calendarYearController.scrollController,
                itemCount: controller.calendarYearController.years.length,
                itemBuilder: (context, index) =>
                    controller.calendarYearController.buildItem(
                  context,
                  index,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      key: index == 1
                          ? controller.calendarYearController.yearContainerKey
                          : null,
                      children: [
                        Visibility(
                          visible: index != 0,
                          child: Column(
                            children: [
                              HeadlineMedium(
                                '${controller.calendarYearController.years[index].year}',
                                color: ThemeColor.primary,
                                textAlign: TextAlign.center,
                              ),
                              ThemeSizedBox.height8,
                              DividerWithGradient(
                                gradient: ThemeGradient.primary,
                              )
                            ],
                          ),
                        ),
                        ThemeSizedBox.height16,
                        _isLastIndex(index)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _monthGrid(
                                      controller
                                          .calendarYearController.years[index],
                                      context),
                                  const SizedBox(
                                    height: 300,
                                  ),
                                ],
                              )
                            : _monthGrid(
                                controller.calendarYearController.years[index],
                                context)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.transparent,
              key: controller.calendarYearController.headerKey,
              width: double.maxFinite,
              child: Obx(
                () => Column(
                  children: [
                    HeadlineMedium(
                      '${controller.calendarYearController.topElem.value?.year}',
                      color: ThemeColor.primary,
                      textAlign: TextAlign.center,
                    ),
                    ThemeSizedBox.height8,
                    DividerWithGradient(gradient: ThemeGradient.primary)
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  bool _isLastIndex(index) {
    return index == controller.calendarYearController.years.length - 1;
  }

  ///create a column of rows of month , where each row contains less then 3 months
  Widget _monthGrid(DateTime year, BuildContext context) {
    List<DateTime> months =
        controller.calendarYearController.getMonthsForYear(year);
    //rows from jenuary to december
    List<Widget> rows = [];
    //row of non more then 3 months
    List<Widget> rowOfThreeMonths = [];

    for (DateTime month in months) {
      String monthText = DateFormat('MMMM', 'it')
          .format(DateTime(month.year, month.month))
          .toUpperCase();
      Widget grid =
          _daysGrid(month: month, context: context, monthText: monthText);
      //if the current row contains more then 3 months then push in the list of rows and clear it
      //otherwise push the new month inside the current row
      if (rowOfThreeMonths.length >= 3) {
        rows.add(
          _columnRow(rowOfThreeMonths),
        );
        rowOfThreeMonths.clear();
        rowOfThreeMonths.add(grid);
      } else {
        rowOfThreeMonths.add(grid);
      }
    }

    //push the last row inside the rows list
    //here rows must contains exactly 4 rows
    rows.add(
      _columnRow(rowOfThreeMonths),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }

  //returns a grid of days for the specified month
  Widget _daysGrid(
      {required DateTime month,
      required BuildContext context,
      required String monthText}) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleMedium(monthText).applyShaders(context),
            ThemeSizedBox.height12,
            InkWell(
              onTap: () {
                controller.goBackToMonthCalendar(month);
              },
              child: IgnorePointer(
                child: CalendarGridWidget(
                  year: month.year,
                  month: month.month,
                  circleRadius: 7,
                  onDayTapped: (DateTime day) {},
                  calendarStore: controller.calendarStore,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _columnRow(List<Widget> row) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.from(row),
    );
  }
}
