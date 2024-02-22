import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_paragraph.dart';

class InfoHowDoesLuckyLinesWorkBottomSheet extends StatelessWidget {
  const InfoHowDoesLuckyLinesWorkBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        children: [
          ThemeSizedBox.height32,
          const DisplayMedium(
            "Come funzionano Lucky\nLines?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const InfoParagraph(
            title: "Lucky Lines: cosa sono?",
            description:
                "I Lucky Lines sono delle lotterie instantanee a cui puoi accedere utilizzando i tuoi Coins. Basta scegliere il premio che vuoi tentare di vincere: ti saranno scalati i Coins ad esso collegati e subito dopo potrai scoprire se sei stata fortunata o, in caso contrario, scegliere di ritentare la sorte.",
          ),
          ThemeSizedBox.height32,
          const InfoParagraph(
            title: "A quanti Lucky Lines posso partecipare?",
            description:
                "Puoi tentare la fortuna con i Lucky Lines ogni volta che vuoi per un massimo di XX volte al giorno e finché avrai Coins a sufficienza per sbloccare l’accesso alla lotteria.",
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
