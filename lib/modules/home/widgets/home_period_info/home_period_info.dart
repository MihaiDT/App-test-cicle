import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_menstruation_card.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_ovulation_card.dart';

class HomePeriodInfo extends GetView<HomeController> {
  const HomePeriodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.hasSavedPeriodInfo) {
      return const SizedBox.shrink();
    }
    initializeDateFormatting();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleMedium(
                  _label(controller.selectedDate.value),
                  color: ThemeColor.darkBlue,
                  letterSpacing: 2,
                ),
              ],
            ),
            ThemeSizedBox.height8,
            Row(
              children: [
                Expanded(
                  child: HomePeriodMenstruationCard(
                    textRow1:
                        appController.currentPeriod.value?.menstruationInfo[0],
                    textRow2:
                        appController.currentPeriod.value?.menstruationInfo[1],
                    textRow3:
                        appController.currentPeriod.value?.menstruationInfo[2],
                  ),
                ),
                ThemeSizedBox.width8,
                Expanded(
                  child: HomePeriodOvulationCard(
                    textRow1:
                        appController.currentPeriod.value?.ovulationInfo[0],
                    textRow2:
                        appController.currentPeriod.value?.ovulationInfo[1],
                    textRow3:
                        appController.currentPeriod.value?.ovulationInfo[2],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Private method

  String _label(DateTime date) {
    final formattedDateYMD = dateFormatYMD.format(date);

    if (formattedNowYMD == formattedDateYMD) {
      return 'OGGI - ${DateFormat('dd MMMM', 'it').format(date).toUpperCase()}';
    }
    return DateFormat('EEE - dd MMMM', 'it').format(date).toUpperCase();
  }

  String get formattedNowYMD => dateFormatYMD.format(DateTime.now());
}
