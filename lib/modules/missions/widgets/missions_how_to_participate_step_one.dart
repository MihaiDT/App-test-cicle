import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_header.dart';
import 'package:lines/modules/missions/widgets/missions_product.dart';

class MissionsHowToParticipateStepOne extends StatelessWidget {
  final Mission mission;

  const MissionsHowToParticipateStepOne({
    required this.mission,
    super.key,
  });

  double get _containerHeight => Get.width * 0.2;
  static const Color _borderColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height20,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: MissionsHowToParticipateHeader(
              stepNumber: 1,
              description: mission.description,
            ),
          ),
          ThemeSizedBox.height24,
          const TitleMedium(
            "PRODOTTI ACQUISTABILI",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                mission.products.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: MissionsProduct(
                      border: Border.all(
                        color: _borderColor,
                      ),
                      product: mission.products[index],
                      dimension: _containerHeight,
                    ),
                  );
                },
              ),
            ),
          ),
          ThemeSizedBox.height20,
        ],
      ),
    );
  }
}
