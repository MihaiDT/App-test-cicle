import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/home_controller.dart';

class HomePeriodOvulationCard extends GetView<HomeController> {
  final String? textRow1;
  final String? textRow2;
  final String? textRow3;

  const HomePeriodOvulationCard({
    super.key,
    this.textRow1,
    this.textRow2,
    this.textRow3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.4),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _label(),
          _firstTextRow(),
          _secondTextRow(),
          _thirdTextRow(),
        ],
      ),
    );
  }

  Widget _firstTextRow() {
    return BodyMedium(
      textRow1 ?? 'In corso',
      color: ThemeColor.darkBlue,
    );
  }

  Widget _secondTextRow() {
    return DisplayLarge(
      textRow2 != null ? " $textRow2" : ' ',
      color: ThemeColor.darkBlue,
    );
  }

  Widget _thirdTextRow() {
    return LabelSmall(
      textRow2 ?? 'GIORNO',
      color: ThemeColor.darkBlue,
    );
  }

  Widget _label() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThemeColor.ovulationColor,
      ),
      padding: const EdgeInsets.only(
        bottom: 4,
        left: 6,
        right: 6,
        top: 2,
      ),
      child: const LabelLarge("OVULAZIONE"),
    );
  }
}
