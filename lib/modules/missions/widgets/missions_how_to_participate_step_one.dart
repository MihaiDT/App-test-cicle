import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_header.dart';
import 'package:lines/modules/missions/widgets/missions_product.dart';

class MissionsHowToParticipateStepOne extends StatelessWidget {
  const MissionsHowToParticipateStepOne({
    super.key,
  });

  static const double _containerHeight = 90;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height24,
          const MissionsHowToParticipateHeader(
            stepNumber: 1,
            description:
                "Acquista 3 prodotti Lines,  di cui almeno uno per la notte.",
          ),
          ThemeSizedBox.height24,
          const TitleMedium(
            "PRODOTTI ACQUISTABILI",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          SizedBox(
            height: _containerHeight,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingMedium,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => MissionsProduct(
                border: Border.all(
                  color: _borderColor,
                ),
                product: Product(
                  name: "Lines seta",
                  points: 0,
                ),
                dimension: _containerHeight,
              ),
              separatorBuilder: (context, index) => ThemeSizedBox.width8,
            ),
          ),
          ThemeSizedBox.height24,
        ],
      ),
    );
  }
}
