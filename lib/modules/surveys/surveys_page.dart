import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/prizes/widgets/survey_card.dart';
import 'package:lines/modules/surveys/survey_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class SurveysPage extends GetView<SurveyController> {
  const SurveysPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          "SONDAGGI",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: appController.user.value?.coinsCollected ?? 0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: SurveyCard(
          onTap: () async {
            if (!controller.isWelcomeQuizCompleted) {
              Get.toNamed(Routes.welcomeQuizIntroPage);
            }
          },
          title: "WELCOME QUIZ",
          description: "Raccontaci qualcosa su di te",
          coinAmount: controller.welcomeQuizTotalCoins,
          isCompleted: controller.isWelcomeQuizCompleted,
        ),
      ),
    );
  }
}
