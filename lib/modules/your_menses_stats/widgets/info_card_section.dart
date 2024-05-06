import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class InfoCardSection extends StatelessWidget {
  final int? periodDuration;
  final int? periodDays;

  const InfoCardSection({
    this.periodDuration,
    this.periodDays,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (periodDuration != null)
          _infoCard(
            value: periodDays.toString(),
            description: "Durata media flusso",
            imagePath: ThemeIcon.dropRoundedIcon,
          ),
        ThemeSizedBox.width8,
        if (periodDays != null)
          _infoCard(
            value: periodDuration.toString(),
            description: "Durata media ciclo",
            imagePath: ThemeIcon.circleRoundedIcon,
          ),
      ],
    );
  }

  Widget _infoCard({
    required String value,
    required String description,
    required String imagePath,
  }) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.lightGrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
              DisplaySmall(
                "$value Giorni",
                color: ThemeColor.primary,
              ),
              ThemeSizedBox.height4,
              BodySmall(
                description,
                color: ThemeColor.darkBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
