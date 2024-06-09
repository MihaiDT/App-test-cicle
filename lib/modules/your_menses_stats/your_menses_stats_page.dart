import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/your_menses_stats/widgets/info_card_section.dart';
import 'package:lines/modules/your_menses_stats/widgets/single_menses_section.dart';
import 'package:lines/modules/your_menses_stats/your_menses_stats_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class YourMensesStatsPage extends GetView<YourMensesStatsController> {
  const YourMensesStatsPage({
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: ThemeSize.paddingS,
        child: ListView(
          children: [
            ThemeSizedBox.height16,
            const DisplayMedium(
              "Il tuo ciclo",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height4,
            const BodyMedium(
              "Storico di tutti i dati registrati",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height24,
            InfoCardSection(
              periodDuration: controller.periodDuration,
              periodDays: controller.periodDays,
            ),
            ThemeSizedBox.height16,
            Container(
              decoration: BoxDecoration(
                color: ThemeColor.lightGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: ThemeColor.menstruationColor,
                        ),
                        ThemeSizedBox.width4,
                        const BodySmall(
                          "Mestruazioni",
                          color: ThemeColor.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor:
                              ThemeColor.ovulationColor.withOpacity(0.5),
                        ),
                        ThemeSizedBox.width4,
                        const BodySmall(
                          "Periodo fertile",
                          color: ThemeColor.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: ThemeColor.ovulationColor,
                        ),
                        ThemeSizedBox.width4,
                        const BodySmall(
                          "Ovulazione",
                          color: ThemeColor.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ThemeSizedBox.height32,
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.periodsStats.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.specificMensesStats,
                      arguments: controller.periodsStats[index],
                    );
                  },
                  child: SingleMensesSection(
                    startingDate: controller.periodsStats[index].startingDate,
                    endingDate: controller.periodsStats[index].endingDate,
                    periodDuration:
                        controller.periodsStats[index].periodDuration,
                    mensesDays: controller.periodsStats[index].menstruationDays,
                    ovulationDays: controller.periodsStats[index].ovulationDays,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
            ThemeSizedBox.height32,
          ],
        ),
      ),
    );
  }
}
