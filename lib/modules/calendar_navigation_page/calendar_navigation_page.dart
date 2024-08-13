import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/calendar_navigation_page/calendar_navigation_controller.dart';
import 'package:lines/modules/your_diary/widgets/category_symptom_tile.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class CalendarNavigationPage extends GetView<CalendarNavigationController> {
  const CalendarNavigationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "GRAFICI E STATISTICHE",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Divider(),
          CategorySymptomTile(
            title: "Mestruazioni",
            onTap: () => Get.toNamed(
              Routes.yourMensesStatsPage,
            ),
            imagePath: 'assets/icons/symptoms/flusso_mestruale.svg',
          ),
          const Divider(),
          CategorySymptomTile(
            title: "Sintomi e attività",
            onTap: () => Get.toNamed(Routes.yourDiaryPage),
            imagePath: "assets/icons/symptoms/sintomi.svg",
          ),
          const Divider(),
        ],
      ),
    );
  }
}
