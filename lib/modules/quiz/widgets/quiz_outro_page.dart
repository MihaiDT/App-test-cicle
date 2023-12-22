import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_image.dart';
import '../../../core/theme/theme_sized_box.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/coin/app_coin.dart';
import '../../../widgets/layouts/app_scaffold_padding.dart';
import '../quiz_controller.dart';
import 'quiz_body_text.dart';
import 'quiz_your_coins.dart';

class QuizOutroPage extends GetView<QuizController> {
  const QuizOutroPage({super.key});

  static const int totalCoins = 250;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgQuestionMark,
      body: AppScaffoldPadding(
        top: 24,
        sidePaddingLarge: false,
        child: Column(
          children: [
            ThemeSizedBox.height16,
            const DisplayMedium(
              'Welcome Quiz',
            ).applyShaders(context),
            ThemeSizedBox.height90,
            SvgPicture.asset(
              ThemeIcon.coinStack,
            ),
            ThemeSizedBox.height16,
            const AppCoin(coinAmount: 150),
            ThemeSizedBox.height40,
            const QuizBodyText(
              title: 'Complimenti!',
              subTitle:
                  'Completando il Welcome Quiz\n hai guadagnato 150 Coins!',
            ),
            ThemeSizedBox.height24,
            const QuizYourCoins(totalCoins: totalCoins),
            ThemeSizedBox.height24,
            GestureDetector(
              onTap: () {},
              child: const TitleMedium(
                'COSA SONO I COINS?',
                underline: true,
              ).applyShaders(context),
            ),
            const Spacer(),
            PrimaryButton(
              //TODO add on tap callback
              onPressed: () {},
              text: 'CHIUDI',
            ),
          ],
        ),
      ),
    );
  }
}
