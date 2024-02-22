import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/home/widgets/circular_period/home_circular_period_calendar_shimmer.dart';
import 'package:lines/modules/home/widgets/header_section.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info_shimmer.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar_shimmer.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/welcome_quiz_section.dart';

import '../../core/app_theme.dart';
import 'home_controller.dart';
import 'widgets/circular_period/home_circular_period_calendar.dart';
import 'widgets/horizontal_calendar/home_horizontal_calendar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const HeaderSection(),
        ThemeSizedBox.height16,
        Obx(
          () => appController.currentPeriod.responseHandler.isPending
              ? const HomeHorizontalCalendarShimmer()
              : const HomeHorizontalCalendar(),
        ),
        Obx(
          () => appController.currentPeriod.responseHandler.isPending
              ? const HomeCircularPeriodCalendarShimmer()
              : const HomeCircularPeriodCalendar(),
        ),
        ThemeSizedBox.height32,
        Obx(
          () => appController.currentPeriod.responseHandler.isPending
              ? const HomePeriodInfoShimmer()
              : const HomePeriodInfo(),
        ),
        ThemeSizedBox.height32,
        const WelcomeQuizSection(),
        ThemeSizedBox.height90,
      ],
    );
  }
}
