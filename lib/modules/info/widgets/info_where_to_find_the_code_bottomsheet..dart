import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoWhereToFindTheCodeBottomSheet extends StatelessWidget {
  const InfoWhereToFindTheCodeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingLarge,
      ),
      child: Column(
        children: [
          ThemeSizedBox.height8,
          const DisplayMedium(
            "Dove trovo il codice?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height24,
          const BodyLarge(
            "Apri la confezione dei tuoi Lines: al suo interno troverai stampato il codice univoco da inserire per ottenere i Coins!",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height32,
          Image.asset(
            ThemeImage.findingCode,
            height: 250,
          ),
          ThemeSizedBox.height32,
          const BodyLarge(
            "Se hai acquistato una confezione multipla o un pacco Formato Scorta, puoi trovare il codice all’interno di ogni singola confezione. Potresti trovare un codice anche all'interno della confezione di cartone ma puoi ignorarlo in quanto non è valido per l'inserimento nell'app My Lines: i codici sono già nelle singole confezioni contenute dalla confezione multipla.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
