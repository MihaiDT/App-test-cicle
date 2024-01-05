import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/modules/calendar/widgets/calendar_week_row.dart';

import '../../core/theme/text_wrapper.dart';
import '../../core/theme/theme_button_size.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_decoration.dart';
import '../../core/theme/theme_edge_insets.dart';

import '../../core/theme/theme_icon.dart';
import '../../core/theme/theme_image.dart';
import '../../core/theme/theme_sized_box.dart';
import '../../widgets/appbar/transparent_app_bar.dart';
import '../../widgets/buttons/primary_button.dart';

import '../../widgets/layouts/app_scaffold_padding.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import 'calendar_controller.dart';

import 'widgets/calendar_scrollable_calendar.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          GestureDetector(
            //TODO: add onTap
            child: SvgPicture.asset(
              ThemeIcon.threeDots,
              color: ThemeColor.darkBlue,
            ),
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleLarge(
          'CALENDARIO',
          color: ThemeColor.darkBlue,
        ),
      ),
      backgroundImage: ThemeDecoration.images.bgCalendar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _scrollableCalendar,
          CalendarWeekRow(controller: controller),
          Obx(() => DraggableScrollableSheet(
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
                                    offset: const Offset(0, -10),
                                  )
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
                                  DisplayMedium(
                                    key: controller.bottomSheetTitleKey,
                                    'Aggiungi sintomi e attività',
                                    textAlign: TextAlign.center,
                                  ).applyShaders(
                                    context,
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
                                      IntrinsicWidth(
                                        child: PrimaryButton(
                                          text: 'Modifica mestruazioni',
                                          buttonSize: ButtonSize.h31,
                                          onPressed: () {},
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                      )
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }

  //return the text for day inside the bottom sheet , add OGGI label if the date selected is today
  String get _bottomSheetDayText {
    if (controller.selectedDate != null) {
      String text = DateFormat('dd MMMM', 'it')
          .format(controller.selectedDate!)
          .toUpperCase();
      if (controller.selectedDate!.isToday) {
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
            SvgPicture.asset(
              ThemeIcon.calendarJumpToMonth,
            ),
            const LabelLarge(
              'OGGI',
              height: 0.77,
            ).applyShaders(context)
          ],
        ),
      ),
    );
  }

  Widget get _scrollableCalendar {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: AppScaffoldPadding(
        bottom: 0,
        sidePaddingLarge: false,
        child: ScrollableCalendar(
          calendarScrollableCalendarController:
              controller.scrollableCalendarController,
          spaceBetweenCalendars: 70.0,
        ),
      ),
    );
  }
}
