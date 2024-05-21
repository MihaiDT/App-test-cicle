import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class InformationTile extends StatelessWidget {
  final String title;
  final String value;
  final String? percentageValue;
  final VoidCallback? onTap;
  final bool hasPadding;

  const InformationTile({
    required this.title,
    required this.value,
    this.percentageValue,
    this.onTap,
    this.hasPadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // show a dot if percentageValue is not empty or null
          if (percentageValue?.isNotEmpty == true) ...[
            ThemeSizedBox.width6,
            Container(
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeColor.brightPink,
              ),
            ),
            ThemeSizedBox.width6,
          ],

          // if percentageValue is empty, show a 16px width box instead the dot
          if (percentageValue == null) ThemeSizedBox.width16,
          HeadlineMedium(
            title,
            color: ThemeColor.darkBlue,
          ),
          const Spacer(),
          Row(
            children: [
              if (percentageValue?.isNotEmpty == true && value.isEmpty) ...[
                Text(
                  percentageValue ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    color: ThemeColor.primary,
                  ),
                ),
                ThemeSizedBox.width12,
              ],
              BodyMedium(
                value,
                color: ThemeColor.darkBlue,
              ),
              SvgPicture.asset(
                ThemeIcon.arrowRight,
                color: const Color(0xffB438B2),
                height: 20,
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
