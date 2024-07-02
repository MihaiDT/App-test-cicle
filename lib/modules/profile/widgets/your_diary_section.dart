import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/your_diary_section_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class YourDiarySection extends GetView<YourDiarySectionController> {
  const YourDiarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.isUserAdult) {
          return const SizedBox.shrink();
        }
        return ElevatedCard(
          color: Colors.white.withOpacity(0.6),
          child: Column(
            children: [
              ThemeSizedBox.height24,
              const DisplayMedium(
                "Il tuo diario",
              ).applyShaders(context),
              ThemeSizedBox.height4,
              controller.hasSavedSymptoms
                  ? const BodyMedium(
                      "Riepilogo dati inseriti",
                      color: ThemeColor.darkBlue,
                    )
                  : const BodyMedium(
                      "Nessun dato registrato",
                      color: ThemeColor.darkBlue,
                    ),
              ThemeSizedBox.height16,
              if (controller.mostFrequentSymptoms.isNotEmpty)
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
                                SvgPicture.asset(
                                  controller
                                      .mostFrequentSymptoms[index].iconPath,
                                  width: 32,
                                ),
                                ThemeSizedBox.height4,
                                LabelMedium(
                                  controller.mostFrequentSymptoms[index].name,
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
                          return InkWell(
                            onTap: () {
                              controller.onSymptomCategoryPressed(
                                controller.symptomCategories[index],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SizedBox.square(
                                dimension: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ThemeSizedBox.height12,
                                        SvgPicture.asset(
                                          controller.symptomCategories[index]
                                                  .iconPath ??
                                              '',
                                          width: 30,
                                        ),
                                        ThemeSizedBox.height4,
                                        LabelLarge(
                                          controller
                                                  .symptomCategories[index].name
                                                  .toUpperCase() ??
                                              '',
                                          textAlign: TextAlign.center,
                                          color: ThemeColor.brightPink,
                                        ),
                                        ThemeSizedBox.height12,
                                      ],
                                    ),
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
              InkWell(
                onTap: () {
                  controller.hasSavedSymptoms
                      ? Get.toNamed(
                          Routes.yourDiaryPage,
                        )
                      : Get.toNamed(
                          Routes.calendar,
                        );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingMedium,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        ThemeSize.paddingSmall,
                      ),
                      child: Row(
                        children: [
                          controller.hasSavedSymptoms
                              ? const TitleLarge(
                                  "GRAFICI E STATISTICHE",
                                  letterSpacing: 2,
                                ).applyShaders(context)
                              : const TitleLarge(
                                  "AGGIUNGI",
                                  letterSpacing: 2,
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
              ),
              ThemeSizedBox.height24,
            ],
          ),
        );
      },
    );
  }
}
