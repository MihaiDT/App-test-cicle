import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/num_extension.dart';

class MensesChartWidget extends StatelessWidget {
  final List<FlSpot> spots;

  const MensesChartWidget({
    this.spots = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ThemeColor.lightGrey.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ThemeSizedBox.height16,
                const HeadlineMedium(
                  "ANDAMENTO FLUSSO",
                  color: Color(0xFF483A96),
                ),
                ThemeSizedBox.height24,
                IgnorePointer(
                  child: SizedBox(
                    height: constrains.maxWidth * 0.5,
                    width: constrains.maxWidth * 0.8,
                    child: LineChart(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      LineChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 70,
                              getTitlesWidget: (value, meta) {
                                String text = "";
                                switch (value.round()) {
                                  case 1:
                                    text = "Leggero";
                                    break;
                                  case 2:
                                    text = "Medio";
                                    break;
                                  case 3:
                                    text = "Abbondante";
                                    break;
                                }
                                return LabelSmall(
                                  text,
                                  color: ThemeColor.darkBlue,
                                );
                              },
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 60,
                              getTitlesWidget: (value, meta) {
                                if (value.isInteger) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ThemeSizedBox.height24,
                                      LabelSmall(
                                        (value.round() + 1).toString(),
                                        color: ThemeColor.darkBlue,
                                      ),
                                      const LabelSmall(
                                        "GIORNO",
                                        color: ThemeColor.darkBlue,
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                        maxY: 3.5,
                        gridData: FlGridData(
                          drawVerticalLine: true,
                          drawHorizontalLine: false,
                          verticalInterval: 1,
                          getDrawingVerticalLine: (value) {
                            return const FlLine(
                              color: Color(0x4D4B399C),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        backgroundColor: Colors.transparent,
                        lineBarsData: [
                          LineChartBarData(
                            dotData: FlDotData(
                              getDotPainter: (spot, percent, barData, index) {
                                if (spot.x.isInteger) {
                                  return DoubleCirclePainter(
                                    radius: 4,
                                    color: Colors.white,
                                    strokeWidth: 0,
                                    strokeColor: Colors.white,
                                    innerCircleColor:
                                        ThemeColor.menstruationColor,
                                  );
                                } else {
                                  return TransparentCirclePainter();
                                }
                              },
                            ),
                            color: ThemeColor.menstruationColor,
                            isCurved: false,
                            barWidth: 5,
                            isStrokeCapRound: true,
                            aboveBarData: BarAreaData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                            spots: spots,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DoubleCirclePainter extends FlDotCirclePainter {
  final Color innerCircleColor;

  DoubleCirclePainter({
    required this.innerCircleColor,
    super.color = Colors.white,
    super.radius = 4.0,
    super.strokeColor,
    super.strokeWidth = 3.0,
  });

  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    super.draw(canvas, spot, offsetInCanvas); // Draw the outer circle

    canvas.drawCircle(
      offsetInCanvas,
      radius / 2,
      Paint()
        ..color = innerCircleColor
        ..style = PaintingStyle.fill,
    );
  }
}

class TransparentCirclePainter extends FlDotCirclePainter {
  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {}
}
