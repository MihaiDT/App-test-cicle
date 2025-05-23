import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_icon.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';
import 'package:lines/modules/info/widgets/info_what_are_coins_bottomsheet..dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_outro_controller.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_body_text.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_your_coins.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/app_coin.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class QuizOutroPage extends GetView<WelcomeQuizOutroController> {
  const QuizOutroPage({
    super.key,
  });

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
            AppCoin(
              coinAmount: controller.coinAmount,
            ),
            ThemeSizedBox.height40,
            const QuizBodyText(
              title: 'Complimenti!',
              subTitle:
                  'Completando il Welcome Quiz\n hai guadagnato 150 Coins!',
            ),
            ThemeSizedBox.height24,
            Obx(
              () {
                return QuizYourCoins(
                  totalCoins: controller.totalCoins.value,
                );
              },
            ),
            ThemeSizedBox.height24,
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(maxHeight: Get.height * 0.85),
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: Colors.white,
                    ),
                    child: const InfoBottomSheet(
                      child: InfoWhatAreCoinsBottomSheet(),
                    ),
                  ),
                );
              },
              child: const TitleMedium(
                'COSA SONO I COINS?',
                underline: true,
              ).applyShaders(context),
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () {
                Get.offAllNamed(Routes.main);
              },
              child: const TitleLarge(
                'CHIUDI',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
