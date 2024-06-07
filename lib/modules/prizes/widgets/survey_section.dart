import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/prizes/controller/survey_section_controller.dart';
import 'package:lines/modules/prizes/widgets/prizes_navigate_to_widget.dart';
import 'package:lines/modules/prizes/widgets/survey_card.dart';
import 'package:lines/routes/routes.dart';

class SurveySection extends StatefulWidget {
  const SurveySection({
    super.key,
  });

  @override
  State<SurveySection> createState() => _SurveySectionState();
}

class _SurveySectionState extends State<SurveySection> {
  final controller = Get.put(SurveySectionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DisplayMedium(
            "Sondaggi",
          ).applyShaders(context),
          ThemeSizedBox.height12,
          if (controller.showWelcomeQuizCard)
            SurveyCard(
              onTap: () {
                Get.toNamed(Routes.welcomeQuizPage);
              },
              title: "WELCOME QUIZ",
              description: "Raccontaci qualcosa su di te",
              coinAmount: controller.welcomeQuizTotalCoins,
              withBorder: true,
            ),
          ThemeSizedBox.height8,
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: PrizesNavigateToWidget(
              onTap: () => Get.toNamed(
                Routes.surveysPage,
              ),
              text: "TUTTI I SONDAGGI",
            ),
          ),
          ThemeSizedBox.height40,
        ],
      ),
    );
  }
}
