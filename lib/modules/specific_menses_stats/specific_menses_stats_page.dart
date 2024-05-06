import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/specific_menses_stats/specific_menses_stats_controller.dart';
import 'package:lines/modules/your_menses_stats/widgets/menses_chart_widget.dart';
import 'package:lines/modules/your_menses_stats/widgets/menses_dotted_tile_widget.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class SpecificMensesStatsPage extends GetView<SpecificMensesStatsController> {
  const SpecificMensesStatsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "DATI DEL CICLO",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: Obx(
        () {
          if (controller.isPageLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ThemeColor.lightGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            HeadlineMedium(
                              formatDate(controller.arguments.startingDate),
                              color: ThemeColor.darkBlue,
                            ),
                            controller.arguments.endingDate != null
                                ? HeadlineMedium(
                                    " - ${formatDate(controller.arguments.endingDate!)}",
                                    color: ThemeColor.darkBlue,
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                      color: ThemeColor.darkBlue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 1,
                                        horizontal: 6,
                                      ),
                                      child: LabelSmall(
                                        "IN CORSO",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        ThemeSizedBox.height8,
                        MensesDottedTileWidget(
                          periodDuration: controller.arguments.periodDuration,
                          mensesDays: controller.arguments.menstruationDays,
                          ovulationDays: controller.arguments.ovulationDays,
                        ),
                      ],
                    ),
                  ),
                ),
                ThemeSizedBox.height8,
                SizedBox(
                  height: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _card(
                        "Mestruazioni",
                        ThemeColor.menstruationColor,
                        RichText(
                          text: const TextSpan(
                            text: "Le tue mestruazioni sono durate ",
                            style: TextStyle(
                              color: ThemeColor.darkBlue,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "dal 20 al 25 set",
                                style: TextStyle(
                                  color: ThemeColor.darkBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ThemeSizedBox.width8,
                      _card(
                        "Periodo fertile",
                        const Color(0xFFB6D6E8),
                        RichText(
                          text: const TextSpan(
                            text:
                                "Probabilmente il tuo periodo fertile è stato ",
                            style: TextStyle(
                              color: ThemeColor.darkBlue,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "dal 1 al 6 ott",
                                style: TextStyle(
                                  color: ThemeColor.darkBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ThemeSizedBox.width8,
                      _card(
                        "Periodo fertile",
                        ThemeColor.ovulationColor,
                        RichText(
                          text: const TextSpan(
                            text: "Probabilmente hai ovulato il ",
                            style: TextStyle(
                              color: ThemeColor.darkBlue,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "dal 1 al 6 ott",
                                style: TextStyle(
                                  color: ThemeColor.darkBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ThemeSizedBox.height8,
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: ThemeColor.lightGrey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ThemeSizedBox.height8,
                              Align(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                  ThemeIcon.dropRoundedIcon,
                                ),
                              ),
                              DisplaySmall(
                                "${controller.specificDatePeriodsStats?.periodDays} giorni",
                                color: ThemeColor.primary,
                              ),
                              const BodySmall(
                                "Durata mestruazioni",
                                color: ThemeColor.darkBlue,
                              ),
                              ThemeSizedBox.height12,
                              Divider(
                                color: ThemeColor.primary.withOpacity(0.03),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ThemeSizedBox.width8,
                    Flexible(
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: ThemeColor.lightGrey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ThemeSizedBox.height8,
                              Align(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                  ThemeIcon.circleRoundedIcon,
                                ),
                              ),
                              DisplaySmall(
                                "${controller.specificDatePeriodsStats?.periodDuration} giorni",
                                color: ThemeColor.primary,
                              ),
                              const BodySmall(
                                "Durata del ciclo",
                                color: ThemeColor.darkBlue,
                              ),
                              ThemeSizedBox.height12,
                              Divider(
                                color: ThemeColor.primary.withOpacity(0.03),
                              ),
                              if (controller.specificDatePeriodsStats
                                      ?.periodDurationLabel.isNotEmpty ==
                                  true) ...[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ThemeIcon.orangeWarning,
                                      width: 16,
                                      height: 16,
                                      color: Colors.orange,
                                    ),
                                    ThemeSizedBox.width12,
                                    TitleSmall(
                                      controller.specificDatePeriodsStats
                                              ?.periodDurationLabel ??
                                          '',
                                      color: ThemeColor.primary,
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      ThemeIcon.info,
                                      width: 16,
                                      height: 16,
                                      color: ThemeColor.primary,
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ThemeSizedBox.height8,
                MensesChartWidget(
                  spots: controller.chartSpots,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM').format(parsedDate);
  }

  Widget _card(
    String title,
    Color circleAvatarColor,
    Widget content,
  ) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.lightGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ThemeSizedBox.height8,
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: circleAvatarColor,
                  ),
                ),
              ),
              ThemeSizedBox.height12,
              BodySmall(
                title,
                color: ThemeColor.darkBlue,
                fontWeight: FontWeight.w600,
              ),
              ThemeSizedBox.height4,
              content,
            ],
          ),
        ),
      ),
    );
  }
}
