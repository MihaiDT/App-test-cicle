import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/prizes/widgets/survey_card.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class SurveysPage extends StatelessWidget {
  const SurveysPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "SONDAGGI",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: 250,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: (context, index) => const SurveyCard(
            title: "WELCOME QUIZ",
            description: "Raccontaci qualcosa su di te",
            coinAmount: 25,
            isCompleted: true,
          ),
          separatorBuilder: (context, index) => ThemeSizedBox.height16,
        ),
      ),
    );
  }
}
