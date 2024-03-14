import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/answer.dart';
import 'package:lines/modules/welcome_quiz/widgets/chip_select_button.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_select_button.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_select_button_large.dart';

class QuizBodyBuilder extends StatelessWidget {
  final String? quizType;
  final List<Answers>? answers;
  final RxList<Answers> selectedAnswers;
  final Function(Answers answer) onAnswerTap;

  const QuizBodyBuilder({
    this.quizType,
    this.answers,
    required this.selectedAnswers,
    required this.onAnswerTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: buildBody(answers ?? []),
    );
  }

  Widget buildBody(List<Answers> answers) {
    if (quizType == "select" && answers.first.imageUrl?.isNotEmpty == true) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return QuizSelectButtonLarge(
            title: answers[index].answer,
            imagePath: answers[index].imageUrl ?? '',
            selected: getIsSelected(answers[index]),
            onPressed: () {
              onAnswerTap(answers[index]);
            },
          );
        },
      );
    } else if (quizType == "select") {
      return ListView.separated(
        separatorBuilder: (_, __) => ThemeSizedBox.height8,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return Obx(
            () {
              return QuizSelectButton(
                title: answers[index].answer,
                selected: getIsSelected(answers[index]),
                onPressed: () {
                  onAnswerTap(answers[index]);
                },
              );
            },
          );
        },
      );
    } else {
      return Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        spacing: 8,
        children: List.generate(
          answers.length,
          (index) {
            return ChipSelectButton(
              title: answers[index].answer,
              selected: getIsSelected(answers[index]),
              onPressed: () {
                onAnswerTap(answers[index]);
              },
            );
          },
        ),
      );
    }
  }

  /// Return true if the current answer is selected
  bool getIsSelected(Answers answer) {
    if (selectedAnswers.isNotEmpty && selectedAnswers.contains(answer)) {
      return true;
    }
    return false;
  }
}
