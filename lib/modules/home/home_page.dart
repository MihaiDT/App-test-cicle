import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/welcome_quiz_section.dart';

import '../../core/app_theme.dart';
import 'home_controller.dart';
import 'widgets/home_circular_period_calendar.dart';
import 'widgets/home_horizontal_period_calendar.dart';
import 'widgets/home_period_info.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HomeHorizontalPeriodCalendar(),
        ThemeSizedBox.height24,
        HomeCircularPeriodCalendar(),
        ThemeSizedBox.height32,
        const HomePeriodInfo(),
        ThemeSizedBox.height32,
        const WelcomeQuizSection(),
      ],
    );
  }
}
