import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_profile/controller/your_information_section_controller.dart';
import 'package:lines/modules/change_profile/widget/information_tile.dart';

class YourInformationSection extends GetView<YourInformationSectionController> {
  const YourInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: ThemeSize.paddingSmall,
          ),
          child: const DisplayMedium(
            "I tuoi dati",
          ).applyShaders(context),
        ),
        ThemeSizedBox.height16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InformationTile(
              title: "Nome",
              value: controller.user?.firstName ?? '',
            ),
            ThemeSizedBox.height8,
            InformationTile(
              title: "Nickname",
              value: controller.user?.nickname ?? 'Nessuno',
            ),
            ThemeSizedBox.height8,
            InformationTile(
              title: "Cognome",
              value: controller.user?.lastName ?? '',
            ),
            ThemeSizedBox.height8,
            InformationTile(
              title: "Data di nascita",
              value: controller.user?.birthdate ?? '',
            ),
            ThemeSizedBox.height8,
            const InformationTile(
              title: "CAP",
              value: 'inserisci',
              percentageValue: '10%',
            ),
            ThemeSizedBox.height8,
          ],
        ),
      ],
    );
  }
}
