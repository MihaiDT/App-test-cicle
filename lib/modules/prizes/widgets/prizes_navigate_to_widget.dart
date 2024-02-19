import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';


class PrizesNavigateToWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const PrizesNavigateToWidget({
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 26,
            right: 16,
            top: 16,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleLarge(text).applyShaders(
                context,
              ),
              SvgPicture.asset(ThemeIcon.arrowRightGradient)
            ],
          ),
        ),
      ),
    );
  }
}
