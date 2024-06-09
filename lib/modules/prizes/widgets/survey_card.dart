import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class SurveyCard extends StatelessWidget {
  final String title;
  final String description;
  final int coinAmount;
  final bool withBorder;
  final bool isCompleted;
  final VoidCallback? onTap;

  const SurveyCard({
    required this.title,
    required this.description,
    required this.coinAmount,
    this.withBorder = false,
    this.isCompleted = false,
    this.onTap,
    super.key,
  });

  static const Color _borderColor = Color(0xffd7c3e8);
  static const _bgColor = Color(0xffedecf6);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        withBorder
            ? ElevatedCard.withBorder(
                borderColor: _borderColor,
                onPressed: onTap,
                color: _bgColor,
                backgroundImage: const DecorationImage(
                  image: AssetImage(
                    ThemeImage.questionMarksGroup,
                  ),
                ),
                child: _mainContent,
              )
            : ElevatedCard(
                onPressed: onTap,
                color: _bgColor,
                backgroundImage: const DecorationImage(
                  image: AssetImage(
                    ThemeImage.questionMarksGroup,
                  ),
                ),
                child: _mainContent,
              ),
        if (isCompleted)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                  color: ThemeColor.follicularColor,
                ),
                child: const BodySmall(
                  "Completato",
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget get _mainContent {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
        vertical: ThemeSize.paddingMedium,
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
                AppCoin.small(
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
    );
  }
}
