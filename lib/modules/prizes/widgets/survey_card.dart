import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class SurveyCard extends StatelessWidget {
  final String title;
  final String description;
  final int coinAmount;
  final VoidCallback? onTap;

  const SurveyCard({
    required this.title,
    required this.description,
    required this.coinAmount,
    this.onTap,
    super.key,
  });

  static const Color _borderColor = Color(0xffd7c3e8);
  static const _bgColor = Color(0xffedecf6);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ThemeImage.questionMarksGroup,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _borderColor,
            width: 4,
          ),
          color: _bgColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleMedium(
                    title,
                    color: ThemeColor.brightPink,
                  ),
                  ThemeSizedBox.height4,
                  HeadlineSmall(
                    description,
                    color: ThemeColor.darkBlue,
                  ),
                  ThemeSizedBox.height8,
                  AppCoin(
                    coinAmount: coinAmount,
                  ),
                ],
              ),
            ),
            Image.asset(
              height: 90,
              ThemeImage.quizIntroImage,
            ),
          ],
        ),
      ),
    );
  }
}
