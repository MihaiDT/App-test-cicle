import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_image.dart';
import '../../../core/theme/theme_sized_box.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/buttons/app_round_button.dart';
import '../../../widgets/coin/app_coin.dart';
import '../../../widgets/layouts/app_scaffold_padding.dart';
import '../quiz_controller.dart';
import 'quiz_body_text.dart';

class QuizIntroPage extends GetView<QuizController> {
  const QuizIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgQuestionMark,
      body: AppScaffoldPadding(
        sidePaddingLarge: false,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: AppRoundButton(
                onTap: () {
                  Navigator.pop(Get.context!);
                },
              ),
            ),
            const DisplayMedium('Welcome Quiz').applyShaders(context),
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
            const AppCoin(coinAmount: 150),
            const Spacer(),
            PrimaryButton(
              onPressed: () {},
              text: 'INIZIAMO',
            ),
          ],
        ),
      ),
    );
  }
}
