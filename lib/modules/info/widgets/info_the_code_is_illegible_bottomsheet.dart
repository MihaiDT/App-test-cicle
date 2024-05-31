import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoTheCodeIsIllegibleBottomSheet extends StatelessWidget {
  const InfoTheCodeIsIllegibleBottomSheet({
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
          ThemeSizedBox.height8,
          const DisplayMedium(
            "Il codice sulla confezione è illeggibile",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const BodyLarge(
            "Se il codice all'interno del pack è illeggibile o riscontri problemi nell'inserimento, contatta il Servizio Consumatori.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
