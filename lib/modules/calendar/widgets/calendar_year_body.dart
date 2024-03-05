import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_months_grid.dart';

import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';

class CalendarYearBody extends GetView<CalendarController> {
  const CalendarYearBody({super.key});

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
                  DividerWithGradient(gradient: ThemeGradient.primary),
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
                              ),
                            ],
                          ),
                        ),
                        ThemeSizedBox.height16,
                        _isLastIndex(index)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CalendarYearMonthsGrid(
                                    months:
                                        controller.getMonthsDataForYearCalendar(
                                      controller
                                          .calendarYearController.years[index],
                                    ),
                                    onMonthTapped:
                                        controller.goBackToMonthCalendar,
                                  ),
                                  const SizedBox(
                                    height: 300,
                                  ),
                                ],
                              )
                            : CalendarYearMonthsGrid(
                                months: controller.getMonthsDataForYearCalendar(
                                  controller
                                      .calendarYearController.years[index],
                                ),
                                onMonthTapped: controller.goBackToMonthCalendar,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                    DividerWithGradient(gradient: ThemeGradient.primary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isLastIndex(index) {
    return index == controller.calendarYearController.years.length - 1;
  }
}
