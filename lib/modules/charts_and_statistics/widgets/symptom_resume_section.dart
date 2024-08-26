import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/menses_statistics.dart';
import 'package:lines/data/models/single_symptom_statistics.dart';
import 'package:lines/modules/charts_and_statistics/widgets/follicular_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/luteal_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/menses_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/ovulation_line_widget.dart';

class SymptomResumeSection extends StatefulWidget {
  final List<MensesStatistics> mensesStatistics;

  const SymptomResumeSection({
    this.mensesStatistics = const [],
    super.key,
  });

  @override
  State<SymptomResumeSection> createState() => _SymptomResumeSectionState();
}

class _SymptomResumeSectionState extends State<SymptomResumeSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return ThemeSizedBox.height8;
      },
      itemCount: widget.mensesStatistics.length,
      itemBuilder: (context, currentMensesStatisticIndex) {
        final currentMensesStatistic =
            widget.mensesStatistics[currentMensesStatisticIndex];
        final double constraints =
            currentMensesStatistic.periodsStats.periodDuration *
                (singleDotSize.width + 4);
        return Column(
          children: [
            _buildSingleHeader(
              currentMensesStatistic.periodsStats.startingDate,
              currentMensesStatistic.periodsStats.endingDate,
            ),
            ThemeSizedBox.height16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildPhasesRow(
                  mensesDuration: _calculateLineWidth(
                    constraints,
                    currentMensesStatistic
                        .periodsStats.phasesCounter?.totalMensesDays,
                    currentMensesStatistic.periodsStats.periodDuration,
                  ),
                  follicularDuration: _calculateLineWidth(
                    constraints,
                    currentMensesStatistic
                        .periodsStats.phasesCounter?.totalFollicularDays,
                    currentMensesStatistic.periodsStats.periodDuration,
                  ),
                  ovulationDuration: _calculateLineWidth(
                    constraints,
                    currentMensesStatistic
                        .periodsStats.phasesCounter?.totalOvulationDays,
                    currentMensesStatistic.periodsStats.periodDuration,
                  ),
                  lutealDuration: _calculateLineWidth(
                    constraints,
                    currentMensesStatistic
                        .periodsStats.phasesCounter?.totalLutealDays,
                    currentMensesStatistic.periodsStats.periodDuration,
                  ),
                ),
                ThemeSizedBox.height16,
                currentMensesStatistic.symptomPeriodStatistics.isEmpty
                    ? const BodyMedium(
                        "Nessun dato registrato per questo ciclo",
                        color: ThemeColor.darkBlue,
                      )
                    : ListView.separated(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return ThemeSizedBox.height20;
                        },
                        itemCount: currentMensesStatistic
                            .symptomPeriodStatistics.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              buildSingleRow(
                                length: currentMensesStatistic
                                    .periodsStats.periodDuration,
                                singleSymptomStatistic: currentMensesStatistic
                                    .symptomPeriodStatistics[index]
                                    .singleSymptomStatistic,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.white,
                                  child: BodySmall(
                                    currentMensesStatistic
                                        .symptomPeriodStatistics[index]
                                        .symptom
                                        .name,
                                    color: ThemeColor.darkBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ],
        );
      },
    );
  }

  Size get singleDotSize => const Size(8, 8);

  Widget _buildSingleHeader(String startingDate, String? endingDate) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeadlineMedium(
          parseDate(startingDate),
          color: ThemeColor.darkBlue,
        ),
        endingDate?.isNotEmpty == true
            ? HeadlineMedium(
                " - ${parseDate(endingDate!)}",
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
    );
  }

  /// Return parsed date as DD/mm
  String parseDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat.d('it_IT').format(dateTime);
    String monthAbbreviation = DateFormat.MMM('it_IT').format(dateTime);
    return '$formattedDate $monthAbbreviation';
  }

  Widget _buildPhasesRow({
    required double mensesDuration,
    required double follicularDuration,
    required double ovulationDuration,
    required double lutealDuration,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      child: Row(
        children: [
          MensesLineWidget(
            indicatorWidth: mensesDuration,
          ),
          const SizedBox(width: 2),
          FollicularLineWidget(
            indicatorWidth: follicularDuration,
          ),
          const SizedBox(width: 2),
          OvulationLineWidget(
            indicatorWidth: ovulationDuration,
          ),
          const SizedBox(width: 2),
          LutealLineWidget(
            indicatorWidth: lutealDuration,
          ),
          SizedBox(
            width: Get.width * 0.5,
          ),
        ],
      ),
    );
  }

  Widget buildSingleRow({
    required int length,
    required List<SingleSymptomStatistic> singleSymptomStatistic,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            length,
            (index) {
              Color color = ThemeColor.lightGrey;

              /// Check if the current day is has a phase and change the color
              for (var element in singleSymptomStatistic) {
                if (element.day == index) {
                  switch (element.periodPhase) {
                    case PeriodPhase.menstruation:
                      color = ThemeColor.menstruationColor;
                      break;
                    case PeriodPhase.follicular:
                      color = ThemeColor.follicularColor;
                      break;
                    case PeriodPhase.ovulation:
                      color = ThemeColor.ovulationColor;
                      break;
                    case PeriodPhase.luteal:
                      color = ThemeColor.lutealColor;
                      break;
                  }
                }
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: singleDotSize.width / 2,
                  backgroundColor: color,
                ),
              );
            },
          ),
          SizedBox(
            width: Get.width * 0.5,
          ),
        ],
      ),
    );
  }

  double _calculateLineWidth(
    double constraint,
    int? phaseTotalDays,
    int totalDays,
  ) {
    if (phaseTotalDays == null || phaseTotalDays <= 0) {
      return 0;
    }
    final result = constraint * phaseTotalDays / totalDays;
    return result;
  }
}
