import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/charts_and_statistics/widgets/follicular_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/luteal_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/menses_line_widget.dart';
import 'package:lines/modules/charts_and_statistics/widgets/ovulation_line_widget.dart';

class ChartLegendWidget extends StatelessWidget {
  const ChartLegendWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.whiteDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ...singleLegendTopPart("Mestruale"),
                MensesLineWidget(
                  indicatorWidth: indicatorWidth,
                ),
              ],
            ),
            Column(
              children: [
                ...singleLegendTopPart("Follicolare"),
                FollicularLineWidget(
                  indicatorWidth: indicatorWidth,
                ),
              ],
            ),
            Column(
              children: [
                ...singleLegendTopPart("Ovulatoria"),
                OvulationLineWidget(
                  indicatorWidth: indicatorWidth,
                ),
              ],
            ),
            Column(
              children: [
                ...singleLegendTopPart("Luteale"),
                LutealLineWidget(
                  indicatorWidth: indicatorWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double get indicatorWidth => 70;

  List<Widget> singleLegendTopPart(String phaseName) {
    return [
      const LabelSmall(
        "FASE",
        color: ThemeColor.darkBlue,
      ),
      BodySmall(
        phaseName,
        fontWeight: FontWeight.w500,
        color: ThemeColor.darkBlue,
      ),
      ThemeSizedBox.height8,
    ];
  }
}
