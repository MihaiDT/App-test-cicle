import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';

class InfoQuestion extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const InfoQuestion({
    required this.text,
    this.onTap,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            ThemeSize.paddingSmall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: HeadlineMedium(
                  text,
                  color: ThemeColor.darkBlue,
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  ThemeIcon.arrowRightGradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
