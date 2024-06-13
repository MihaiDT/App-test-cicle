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
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9160D7).withOpacity(0.2),
                // Hex color with 20% opacity
                spreadRadius: 4,
                blurRadius: 21,
                offset: const Offset(10, 10), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _label(),
              ThemeSizedBox.height4,
              _firstTextRow(),
              ThemeSizedBox.height4,
              _secondTextRow(),
              _thirdTextRow(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: 56,
            height: 56,
            child: Image.asset(
              ThemeImage.homeBoxOvulationIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstTextRow() {
    return BodyMedium(
      textRow1 ?? 'In corso',
      color: ThemeColor.darkBlue,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _secondTextRow() {
    if (textRow2 == null || textRow2!.isEmpty) {
      return const SizedBox.shrink();
    }

    return DisplayLarge(
      textRow2 ?? ' ',
      color: ThemeColor.background,
    );
  }

  Widget _thirdTextRow() {
    return LabelSmall(
      (textRow3 ?? 'GIORNO').toUpperCase(),
      color: ThemeColor.background,
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
      child: const TitleMedium(
        "OVULAZIONE",
        color: Colors.white,
      ),
    );
  }
}
