import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/menses_statistics.dart';
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
  List<ScrollController> _scrollControllers = [];

  @override
  void initState() {
    super.initState();

    _scrollControllers = List.generate(10, (index) {
      return ScrollController();
    });
  }

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
        final double constraints = widget
                .mensesStatistics[currentMensesStatisticIndex].symptom.length *
            singleDotSize.width;

        return Column(
          children: [
            _buildSingleHeader(
              currentMensesStatistic.periodsStats.startingDate,
              currentMensesStatistic.periodsStats.endingDate,
            ),
            ThemeSizedBox.height16,
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  _syncScrolling(
                    _scrollControllers.last,
                    scrollNotification.metrics.pixels,
                  );
                }
                return true;
              },
              child: Column(
                children: [
                  _buildPhasesRow(
                    mensesDuration: constraints *
                        currentMensesStatistic.periodsStats.periodDays,
                    follicularDuration: constraints *
                        currentMensesStatistic.periodsStats.periodDays,
                    ovulationDuration: constraints *
                        currentMensesStatistic
                            .periodsStats.ovulationDays.length,
                    lutealDuration: 50,
                  ),
                  ThemeSizedBox.height16,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          buildSingleRow(
                            widget.mensesStatistics[currentMensesStatisticIndex]
                                .periodsStats.periodDuration,
                            _scrollControllers[currentMensesStatisticIndex],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              color: Colors.white,
                              child: BodySmall(
                                widget
                                    .mensesStatistics[
                                        currentMensesStatisticIndex]
                                    .symptom[index]
                                    .name,
                                color: ThemeColor.darkBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return ThemeSizedBox.height20;
                    },
                    itemCount: widget
                        .mensesStatistics[currentMensesStatisticIndex]
                        .symptom
                        .length,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _syncScrolling(ScrollController controller, double offset) {
    if (controller.hasClients) {
      for (int i = 0; i < _scrollControllers.length; i++) {
        if (_scrollControllers[i] != controller &&
            _scrollControllers[i].position.pixels != offset) {
          _scrollControllers[i].jumpTo(offset);
        }
      }
    }
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
      controller: _scrollControllers.last,
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
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ],
      ),
    );
  }

  Widget buildSingleRow(int length, ScrollController controller) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          length,
          (index) => CircleAvatar(
            radius: singleDotSize.width / 2,
            backgroundColor: ThemeColor.lightGrey,
          ),
        ),
      ),
    );
  }
}
