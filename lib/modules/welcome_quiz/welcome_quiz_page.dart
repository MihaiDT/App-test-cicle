import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_controller.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_body_builder.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/charts/animated_linear_progress_indicator.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class WelcomeQuizPage extends GetView<WelcomeQuizBodyController> {
  const WelcomeQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgQuestionMark,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const DisplayMedium("Welcome Quiz").applyShaders(context),
                ThemeSizedBox.height24,
                Obx(
                  () {
                    if (controller.pageShouldRefresh) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: ThemeGradient.quizBackGroundGradient,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        margin: ThemeSize.paddingS,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ThemeSizedBox.height24,
                            SizedBox(
                              width: constrains.maxWidth * 0.33,
                              child: AnimatedLinearProgressIndicator(
                                value: controller.progressValue,
                              ),
                            ),
                            ThemeSizedBox.height24,
                            HeadlineLarge(
                              controller.question.question ?? "",
                              color: ThemeColor.darkBlue,
                              textAlign: TextAlign.center,
                            ),
                            if (controller.questionHasDescription) ...[
                              ThemeSizedBox.height4,
                              BodyMedium(
                                controller.question.questionDescription,
                                color: ThemeColor.darkBlue,
                                textAlign: TextAlign.center,
                              ),
                            ],
                            ThemeSizedBox.height32,
                            SizedBox(
                              height: constrains.maxHeight * 0.6,
                              child: QuizBodyBuilder(
                                answers: controller.answers,
                                quizType:
                                    controller.question.typology ?? "select",
                                selectedAnswers: controller.selectedAnswers,
                                onAnswerTap: (answer) {
                                  if (!controller.isRefreshing) {
                                    controller.onAnswerTap(answer);
                                  }
                                },
                              ),
                            ),
                            ThemeSizedBox.height16,
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: ThemeSize.paddingSmall,
                    right: ThemeSize.paddingSmall,
                    top: ThemeSize.paddingSmall,
                  ),
                  child: Obx(
                    () {
                      return PrimaryLoadingButton(
                        onPressed: controller.canProceed
                            ? () {
                                controller.onPressed();
                              }
                            : null,
                        isLoading:
                            appController.question.responseHandler.isPending,
                        child: const TitleLarge(
                          'AVANTI',
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
