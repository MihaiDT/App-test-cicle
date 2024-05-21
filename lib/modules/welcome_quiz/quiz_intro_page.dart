import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_intro_controller.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_body_text.dart';
import 'package:lines/repository/survey_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/app_round_button.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/coin/app_coin.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class QuizIntroPage extends GetView<WelcomeQuizIntroController> {
  const QuizIntroPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgQuestionMark,
      body: SafeArea(
        child: BottomWidgetLayout(
          bottomWidget: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: PrimaryLoadingButton(
                isLoading: appController.question.responseHandler.isPending,
                onPressed: () async {
                  await SurveyService.fetchWelcomeQuiz();
                  Get.offAndToNamed(Routes.welcomeQuizPage);
                },
                child: const TitleLarge(
                  'INIZIAMO',
                ),
              ),
            ),
          ),
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppRoundButton(
                    iconPath: ThemeIcon.close,
                    value: true,
                    onChanged: (_) {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const DisplayMedium(
                'Welcome Quiz',
              ).applyShaders(context),
              ThemeSizedBox.height60,
              Image(
                image: AssetImage(
                  ThemeImage.quizIntroImage,
                ),
              ),
              ThemeSizedBox.height32,
              const QuizBodyText(
                title: 'Conosciamoci meglio!',
                subTitle:
                    'Raccontaci qualcosa in più su di te:\nriceverai subito 150 Coins',
              ),
              ThemeSizedBox.height32,
              AppCoin(
                coinAmount: controller.coinAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
