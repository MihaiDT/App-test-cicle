import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/your_diary_section_controller.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class YourDiarySection extends GetView<YourDiarySectionController> {
  const YourDiarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Colors.white.withOpacity(0.9),
      child: Column(
        children: [
          ThemeSizedBox.height24,
          const DisplayMedium(
            "Il tuo diario",
          ).applyShaders(context),
          ThemeSizedBox.height4,
          const BodyMedium(
            "Ultimi dati inseriti",
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingMedium,
            ),
            child: ElevatedCard(
              color: Colors.white,
              child: Column(
                children: [
                  ThemeSizedBox.height12,
                  const TitleMedium(
                    "SINTOMI PIÙ FREQUENTI",
                    color: ThemeColor.brightPink,
                  ),
                  ThemeSizedBox.height12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      controller.mostFrequentSymptoms.length,
                      (index) => Column(
                        children: [
                          controller.mostFrequentSymptoms[index].iconPath !=
                                  null
                              ? SvgPicture.asset(
                                  controller
                                      .mostFrequentSymptoms[index].iconPath!,
                                  width: 32,
                                )
                              : const Placeholder(),
                          ThemeSizedBox.height4,
                          LabelMedium(
                            controller.mostFrequentSymptoms[index].symptomName,
                            color: ThemeColor.darkBlue,
                          ),
                          ThemeSizedBox.height16,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 12,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ThemeSizedBox.width24,
                  ...List.generate(
                    controller.symptomCategories.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox.square(
                          dimension: 100,
                          child: ElevatedCard(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ThemeSizedBox.height12,
                                  SvgPicture.asset(
                                    controller.symptomCategories[index]
                                        .categoryIconPath,
                                    width: 40,
                                  ),
                                  ThemeSizedBox.height4,
                                  LabelLarge(
                                    controller
                                        .symptomCategories[index].categoryTitle
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    color: ThemeColor.brightPink,
                                  ),
                                  ThemeSizedBox.height12,
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingMedium,
            ),
            child: ElevatedCard(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(
                  ThemeSize.paddingSmall,
                ),
                child: Row(
                  children: [
                    const TitleLarge(
                      "GRAFICI E STATISTICHE",
                    ).applyShaders(context),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/arrow_right.svg",
                      color: ThemeColor.darkBlue,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ThemeSizedBox.height24,
        ],
      ),
    );
  }
}
