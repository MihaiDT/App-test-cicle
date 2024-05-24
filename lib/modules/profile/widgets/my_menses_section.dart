import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/my_menses_section_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class MyMensesSection extends GetView<MyMensesSectionController> {
  const MyMensesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ThemeSizedBox.height24,
            const DisplayMedium(
              "Il tuo ciclo",
            ).applyShaders(context),
            ThemeSizedBox.height4,
            controller.hasSavedMensesInfo
                ? const BodyMedium(
                    "Dati basati sulle tue informazioni",
                    color: ThemeColor.darkBlue,
                  )
                : const BodyMedium(
                    "Aggiungi mestruazioni per visualizzare i report",
                    color: ThemeColor.darkBlue,
                  ),
            ThemeSizedBox.height16,
            if (controller.hasSavedMensesInfo)
              Row(
                children: [
                  _infoCard(
                    value: controller.periodDays.toString(),
                    description: "Durata media flusso",
                    imagePath: ThemeIcon.dropRoundedIcon,
                  ),
                  ThemeSizedBox.width8,
                  _infoCard(
                    value: controller.periodDuration.toString(),
                    description: "Durata media ciclo",
                    imagePath: ThemeIcon.circleRoundedIcon,
                  ),
                ],
              ),
            ThemeSizedBox.height8,
            InkWell(
              onTap: () {
                Get.toNamed(Routes.yourMensesStatsPage);
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Row(
                    children: [
                      const TitleLarge(
                        "GRAFICI E STATISTICHE",
                      ).applyShaders(context),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeGradient.colorPrimaryGradientLight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height24,
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String value,
    required String description,
    required String imagePath,
  }) {
    return Flexible(
      flex: 1,
      child: ElevatedCard(
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
              DisplaySmall(
                "$value GIORNI",
                color: ThemeColor.primary,
              ),
              ThemeSizedBox.height4,
              BodySmall(
                description,
                color: ThemeColor.darkBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
