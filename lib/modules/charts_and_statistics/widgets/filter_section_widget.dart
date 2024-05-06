import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/symptom.dart';

class FilterSectionWidget extends StatelessWidget {
  final Function() onTap;
  final Symptom? symptom;

  const FilterSectionWidget({
    required this.onTap,
    this.symptom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/symptoms/a_mille.svg",
                  width: 14,
                  height: 14,
                ),
                ThemeSizedBox.width6,
                const HeadlineSmall(
                  "Report di",
                  color: ThemeColor.darkBlue,
                ),
                const Spacer(),
                const BodyMedium(
                  "Tutti i mood",
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: ThemeColor.primary,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
