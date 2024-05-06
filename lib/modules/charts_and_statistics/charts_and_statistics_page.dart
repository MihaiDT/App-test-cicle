import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/charts_and_statistics/charts_and_statistics_controller.dart';
import 'package:lines/modules/charts_and_statistics/widgets/chart_legend_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/filter_section_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/symptom_resume_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class ChartsAndStaticsPage extends GetView<ChartsAndStatisticsController> {
  const ChartsAndStaticsPage({
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height16,
            const DisplayMedium(
              "MOOD",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height4,
            const BodyMedium(
              "Storico di tutti i dati registrati",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height24,
            FilterSectionWidget(
              onTap: () {
                controller.onFilterSectionTapped();
              },
            ),
            ThemeSizedBox.height24,
            const ChartLegendWidget(),
            ThemeSizedBox.height32,
            const SymptomResumeSection(),
          ],
        ),
      ),
    );
  }
}
