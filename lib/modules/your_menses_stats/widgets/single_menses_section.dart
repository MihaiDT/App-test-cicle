import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/your_menses_stats/widgets/menses_dotted_tile_widget.dart';

class SingleMensesSection extends StatelessWidget {
  final String startingDate;
  final String? endingDate;

  final int periodDuration;

  final List<int> mensesDays;
  final List<int> ovulationDays;

  const SingleMensesSection({
    required this.startingDate,
    this.endingDate,
    required this.periodDuration,
    required this.mensesDays,
    required this.ovulationDays,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeSizedBox.height24,
            Row(
              children: [
                HeadlineMedium(
                  formatDate(startingDate),
                  color: ThemeColor.darkBlue,
                ),
                endingDate != null
                    ? HeadlineMedium(
                        " - ${formatDate(endingDate!)}",
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
            ThemeSizedBox.height16,
            _mensesDays(
              mensesDays.length,
              ovulationDays.length,
            ),
            ThemeSizedBox.height8,
            MensesDottedTileWidget(
              periodDuration: periodDuration,
              mensesDays: mensesDays,
              ovulationDays: ovulationDays,
            ),
            ThemeSizedBox.height24,
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            "assets/icons/arrow_right.svg",
            color: ThemeColor.primary,
          ),
        ),
      ],
    );
  }

  Widget _mensesDays(int mensesDay, int? ovulationDays) {
    return Row(
      children: [
        SvgPicture.asset(
          ThemeIcon.dropRoundedIcon,
          width: 16,
          height: 16,
        ),
        TitleMedium(
          "$mensesDay GIORNI",
          fontWeight: FontWeight.w900,
          color: ThemeColor.primary,
        ),
        ThemeSizedBox.width24,
        SvgPicture.asset(
          ThemeIcon.circleRoundedIcon,
          width: 16,
          height: 16,
        ),
        TitleMedium(
          endingDate != null ? "$periodDuration GIORNI" : "- GIORNI",
          fontWeight: FontWeight.w900,
          color: ThemeColor.primary,
        ),
      ],
    );
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM', 'it').format(parsedDate);
  }
}
