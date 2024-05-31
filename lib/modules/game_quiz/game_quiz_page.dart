import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/game_quiz/game_quiz_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:shimmer/shimmer.dart';

class GameQuizPage extends GetView<GameQuizController> {
  const GameQuizPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        title: const TitleSmall(
          "CAMBIO ASSORBENTE",
          color: ThemeColor.darkBlue,
        ),
        showBackButton: false,
        actions: [
          CoinTotal(
            totalCoins: appController.user.value?.coinsCollected ?? 0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingLarge,
        ),
        child: ListView(
          children: [
            ThemeSizedBox.height16,
            const DisplayMedium(
              "È ora di cambiare\nl'assorbente di Cherry!",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height8,
            const BodyMedium(
              "Quale scegli?",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height32,
            Obx(
              () {
                return appController.question.responseHandler.isSuccessful
                    ? Column(
                        children: controller.answers.asMap().entries.map(
                          (entry) {
                            final productName = entry.value.answer.split(' *** ').first;
                            final productDescription = entry.value.answer.split(' *** ').last;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => controller.onAnswerTap(entry.value),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ThemeColor.whiteDark,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      color: ThemeColor.whiteDark.withOpacity(0.3),
                                    ),
                                    padding: const EdgeInsets.all(24),
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width - (16 * 2),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                flex: 7,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    LabelLarge(
                                                      productName,
                                                      maxLines: 5,
                                                      color: ThemeColor.brightPink,
                                                      letterSpacing: 2,
                                                    ),
                                                    ThemeSizedBox.height4,
                                                    HeadlineSmall(
                                                      productDescription,
                                                      maxLines: 5,
                                                      color: ThemeColor.darkBlue,
                                                    ),
                                                    ThemeSizedBox.height8,
                                                  ],
                                                ),
                                              ),
                                              ThemeSizedBox.width24,
                                              Flexible(
                                                flex: 3,
                                                child: (entry.value.imageUrl != null)
                                                    ? Image.network(
                                                        entry.value.imageUrl!,
                                                        fit: BoxFit.scaleDown,
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ThemeSizedBox.height8,
                              ],
                            );
                          },
                        ).toList(),
                      )
                    : _loading();
              },
            ),
            ThemeSizedBox.width32,
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 100,
            width: double.infinity,
          ),
          ThemeSizedBox.height8,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 100,
            width: double.infinity,
          ),
          ThemeSizedBox.height8,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 100,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
