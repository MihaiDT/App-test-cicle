import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/your_diary/widgets/category_symptom_tile.dart';
import 'package:lines/modules/your_diary/your_diary_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lottie/lottie.dart';

class YourDiaryPage extends GetView<YourDiaryController> {
  const YourDiaryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "GRAFICI E STATISTICHE",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: Column(
        children: [
          if (controller.showTitle) ...[
            ThemeSizedBox.height16,
            const DisplayMedium(
              "Il tuo diario",
              textAlign: TextAlign.center,
            ).applyShaders(context),
          ],
          ThemeSizedBox.height16,
          Obx(
            () {
              if (appController
                      .symptomCategoryStats.responseHandler.isSuccessful &&
                  controller.symptomCategoryStats != null) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      left: ThemeSize.paddingSmall,
                      right: ThemeSize.paddingSmall,
                      bottom: ThemeSize.paddingMedium,
                    ),
                    itemBuilder: (context, index) {
                      final currentCategory = controller
                          .symptomCategoryStats!.symptomsCategories[index];
                      return CategorySymptomTile(
                        canBePressed: currentCategory.enabled,
                        imagePath: currentCategory.iconPath,
                        title: currentCategory.name,
                        onTap: () => controller.onSymptomCategoryPressed(
                          currentCategory.id,
                          currentCategory.name,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => _divider,
                    itemCount: controller
                            .symptomCategoryStats?.symptomsCategories.length ??
                        0,
                  ),
                );
              }

              return Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: LottieBuilder.asset(
                    "assets/lottie/dark_loader.json",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget get _divider => const Divider(
        color: ThemeColor.lightGrey,
        thickness: 1,
      );
}
