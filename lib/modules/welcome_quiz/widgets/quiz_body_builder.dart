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
  final List<Answers> selectedAnswers;
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
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Obx(
        () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildAnswerWidgets(answers ?? []),
          );
        },
      ),
    );
  }

  /// Helper method to build the Column of the page basing on the quiz type
  List<Widget> _buildAnswerWidgets(List<Answers> answers) {
    List<Widget> result = [];
    for (int i = 0; i < answers.length; i += 2) {
      Answers answer = answers[i];
      Answers? secondAnswer = answers.elementAtOrNull(i + 1);
      if (quizType == "select" && answer.imageUrl == null) {
        // Refactor the repeated code into a helper method
        result.add(_buildSelectButton(answer));
        if (secondAnswer != null) {
          result.add(ThemeSizedBox.height8);
          result.add(_buildSelectButton(secondAnswer));
        }
      } else {
        // Refactor the singleLine list into a method that returns a row widget
        result.add(_buildAnswerRow(answer, secondAnswer));
      }
      result.add(ThemeSizedBox.height8);
    }
    return result;
  }

  /// Helper method to build a select button widget
  Widget _buildSelectButton(Answers answer) {
    return QuizSelectButton(
      title: answer.answer,
      selected: getIsSelected(answer),
      onPressed: () {
        onAnswerTap(answer);
      },
    );
  }

  /// Helper method to build a row widget with two answer widgets
  Widget _buildAnswerRow(Answers answer, Answers? secondAnswer) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildSingleAnswer(answer),
        if (secondAnswer != null) ...[
          ThemeSizedBox.width8,
          buildSingleAnswer(secondAnswer),
        ],
      ],
    );
  }

  /// Helper method to build a single answer widget depending on the quiz type
  Widget buildSingleAnswer(Answers answer) {
    if (answer.imageUrl != null) {
      return Expanded(
        child: QuizSelectButtonLarge(
          imagePath: answer.imageUrl!,
          selected: getIsSelected(answer),
          title: answer.answer,
          onPressed: () {
            onAnswerTap(answer);
          },
        ),
      );
    }
    return ChipSelectButton(
      title: answer.answer,
      selected: getIsSelected(answer),
      onPressed: () {
        onAnswerTap(answer);
      },
    );
  }

  /// Return true if the current answer is selected
  bool getIsSelected(Answers answer) {
    if (selectedAnswers.isNotEmpty && selectedAnswers.contains(answer)) {
      return true;
    }
    return false;
  }
}
