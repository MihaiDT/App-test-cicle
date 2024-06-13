import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_card.dart';
import 'package:lines/routes/routes.dart';

class InfoHowToGetCoinsBottomSheet extends StatelessWidget {
  const InfoHowToGetCoinsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeSize.paddingSmall),
      child: Column(
        children: [
          ThemeSizedBox.height24,
          InfoCard(
            title: "Carica codici",
            description:
                "Acquista i tuoi prodotti Lines e carica, nell'apposita area,  i codici che trovi nelle confezioni.",
            buttonText: "Carica codice",
            onPressed: () {
              Get.toNamed(Routes.loadCode);
            },
            imagePath: ThemeImage.loadProduct,
          ),
          ThemeSizedBox.height16,
          InfoCard(
            title: "Questionari",
            description:
                "Raccontaci di più su di te e rispondi alle domande dei questionari.",
            imagePath: ThemeImage.quizIntroImage,
            buttonText: "Vedi i questionari",
            onPressed: () {
              Get.toNamed(Routes.surveysPage);
            },
          ),
          ThemeSizedBox.height16,
          InfoCard(
            title: "Invita un amico",
            description:
                "Invita un'amica a iscriversi a My Lines e sarai ricompensata!",
            imagePath: ThemeImage.inviteAFriend,
            buttonText: "Invita un amico",
            onPressed: () {
              Get.toNamed(Routes.inviteFriendPage);
            },
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
